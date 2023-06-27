import 'dart:async';
import 'package:digicard/app/app.logger.dart';
import 'package:digicard/app/extensions/string_extension.dart';
import 'package:digicard/app/services/user_service.dart';
import 'package:mime/mime.dart';
import 'package:digicard/app/extensions/digital_card_extension.dart';
import 'package:digicard/app/models/digital_card.dart';
import 'package:flutter/foundation.dart';
import 'package:stacked/stacked.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:uuid/uuid.dart';
import '../app.locator.dart';

class DigitalCardService with ListenableServiceMixin {
  final log = getLogger('DigitalCardService');
  final _supabase = Supabase.instance.client;
  final _userService = locator<UserService>();

  var uuid = const Uuid();

  errorMessage(String? message) {
    final String error = "$message".trim();
    if (error.isEmpty || error == "null") {
      return Future.error("Unknown error");
    }
    if (error.contains("Failed host lookup")) {
      return Future.error("Check your internet connection");
    }
    return Future.error(error);
  }

  DigitalCardService() {
    listenToReactiveValues([
      _userService,
      _digitalCards,
    ]);
  }

  final ReactiveValue<List<DigitalCard>> _digitalCards =
      ReactiveValue<List<DigitalCard>>([]);

  Future<String?> imageSave(Uint8List? image,
      {required String folderPath}) async {
    try {
      var mime = lookupMimeType('', headerBytes: image);
      var extension = extensionFromMime("$mime");
      final fileName = '${uuid.v4()}.$extension';
      if (image != null) {
        await Supabase.instance.client.storage.from('images').uploadBinary(
              "$folderPath/$fileName",
              image,
              fileOptions: const FileOptions(
                cacheControl: '3600',
                upsert: true,
              ),
            );
        return fileName;
      } else {
        return null;
      }
    } catch (e) {
      log.e("imageSave() : ${e.toString()}");
      return null;
    }
  }

  Future<String?> imageCopy(
      {required String sourceFileName, required String folderPath}) async {
    String extension = StringExtension.getFileExtension(sourceFileName);
    final fileName = '${uuid.v4()}.$extension';
    try {
      await _supabase.storage.from("images").copy(
            "$folderPath/$sourceFileName",
            "$folderPath/$fileName",
          );
      return fileName;
    } catch (e) {
      /// A weird supabase file copy bug that returns exception
      /// even if the operation is successful
      if (e.toString().contains("Expected a value of type 'String'")) {
        return fileName;
      }
      log.e("imageCopy() : ${e.toString()}");
      return null;
    }
  }

  Future imageDelete({required String folderPath}) async {
    try {
      await _supabase
          .from('storage.objects')
          .delete()
          .eq('bucket_id', 'images')
          .eq('name', folderPath);
    } catch (e) {
      log.e("imageDelete() : ${e.toString()}");
    }
  }

  Future getAll() async {
    try {
      final data = await _supabase.from('cards').select('*').in_(
          'user_id', [_userService.id]).order('created_at', ascending: true);
      if (data is List && data.isNotEmpty) {
        _digitalCards.value = data.map((e) => DigitalCard.fromJson(e)).toList();
      }
    } catch (e) {
      return errorMessage(e.toString());
    }
  }

  List<DigitalCard> get digitalCards {
    return _digitalCards.value.reversed.toList();
  }

  Future create(DigitalCard card) async {
    try {
      final data = DigitalCardExtension.create(
          card.copyWith(userId: _userService.id).toJson());
      data["custom_links"] = card.customLinks.map((e) => e.toJson()).toList();
      data["avatar_url"] =
          await imageSave(card.avatarFile, folderPath: 'avatars');
      data["logo_url"] = await imageSave(card.logoFile, folderPath: 'logos');
      final insertedCard = await _supabase.from('cards').insert(data).select();
      if (insertedCard is List<dynamic>) {
        _digitalCards.value.add(DigitalCard.fromJson(insertedCard[0]));
        notifyListeners();
      }
    } catch (e) {
      return Future.error(e.toString());
    }
  }

  Future update(DigitalCard card) async {
    try {
      final data = DigitalCardExtension.update(card.toJson());
      data["custom_links"] = card.customLinks.map((e) => e.toJson()).toList();
      data["avatar_url"] =
          await imageSave(card.avatarFile, folderPath: 'avatars');
      data["logo_url"] = await imageSave(card.logoFile, folderPath: 'logos');
      final updatedCard =
          await _supabase.from('cards').update(data).eq('id', card.id).select();
      if (updatedCard is List<dynamic>) {
        final index =
            _digitalCards.value.indexWhere((element) => element.id == card.id);
        _digitalCards.value[index] = DigitalCard.fromJson(updatedCard[0]);
        notifyListeners();
      }
    } catch (e) {
      return Future.error(e.toString());
    }
  }

  Future delete(DigitalCard card) async {
    try {
      await _supabase.from('cards').delete().eq('id', card.id);
      _digitalCards.value.removeWhere((element) => element.id == card.id);
      notifyListeners();
    } catch (e) {
      return errorMessage(e.toString());
    }
  }

  duplicate(DigitalCard card) async {
    try {
      final data = DigitalCardExtension.create(
          card.copyWith(userId: _userService.id).toJson());
      data["custom_links"] = card.customLinks.map((e) => e.toJson()).toList();
      final originalCard =
          _digitalCards.value.firstWhere((e) => e.id == card.id);

      final bool isCopyOriginalAvatar =
          card.avatarUrl == originalCard.avatarUrl &&
              originalCard.avatarUrl != null;
      final bool isUploadNewAvatar =
          card.avatarUrl == "&!&" && card.avatarFile != null;

      if (isCopyOriginalAvatar) {
        data["avatar_url"] = await imageCopy(
            sourceFileName: "${originalCard.avatarUrl}", folderPath: 'avatars');
      }
      if (isUploadNewAvatar) {
        data["avatar_url"] =
            await imageSave(card.avatarFile, folderPath: 'avatars');
      }

      final bool isCopyOriginalLogo =
          card.logoUrl == originalCard.logoUrl && originalCard.logoUrl != null;
      final bool isUploadNewLogo =
          card.logoUrl == "&!&" && card.logoFile != null;

      if (isCopyOriginalLogo) {
        data["logo_url"] = await imageCopy(
            sourceFileName: "${originalCard.logoUrl}", folderPath: 'logos');
      }

      if (isUploadNewLogo) {
        data["logo_url"] = await imageSave(card.logoFile, folderPath: 'logos');
      }

      final insertedCard = await _supabase.from('cards').insert(data).select();

      if (insertedCard is List<dynamic>) {
        DigitalCard? temp = DigitalCard.fromJson(insertedCard[0]);
        _digitalCards.value.add(temp);
        notifyListeners();
      }
    } catch (e) {
      return Future.error(e.toString());
    }
  }

  Future<DigitalCard?> findOne(String uuid) async {
    final data = await _supabase.from('cards').select().eq('uuid', uuid);
    if (data is List && data.isNotEmpty) {
      return DigitalCard.fromJson(data[0]);
    }
    return null;
  }

  clean() {
    _digitalCards.value = [];
  }
}
