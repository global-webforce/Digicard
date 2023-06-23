import 'dart:async';
import 'package:digicard/app/app.logger.dart';
import 'package:digicard/app/services/user_service.dart';
import 'package:mime/mime.dart';
import 'package:digicard/app/extensions/digital_card_extension.dart';
import 'package:digicard/app/models/digital_card.dart';
import 'package:flutter/foundation.dart';
import 'package:stacked/stacked.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:uuid/uuid.dart';
import 'package:path/path.dart' as path;
import '../app.locator.dart';

class DigitalCardService with ListenableServiceMixin {
  final log = getLogger('LocalStorageService');
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

  Future<String?> imageSave(Uint8List? image, {required String path}) async {
    try {
      var mime = lookupMimeType('', headerBytes: image);
      var extension = extensionFromMime("$mime");
      final fileName = '${uuid.v4()}.$extension';
      if (image != null) {
        await Supabase.instance.client.storage.from('images').uploadBinary(
              "$path/$fileName",
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
      log.e(e.toString());
      return null;
    }
  }

  Future imageDelete({required String path}) async {
    try {
      await _supabase
          .from('storage.objects')
          .delete()
          .eq('bucket_id', 'images')
          .eq('name', path);
    } catch (e) {
      log.e(e.toString());
    }
  }

  final ReactiveValue<List<DigitalCard>> _digitalCards =
      ReactiveValue<List<DigitalCard>>([]);

  Future create(DigitalCard card) async {
    try {
      final data = DigitalCardExtension.create(
          card.copyWith(userId: _userService.id).toJson());
      data["custom_links"] = card.customLinks.map((e) => e.toJson()).toList();
      data["avatar_url"] = await imageSave(card.avatarFile, path: 'avatars');
      data["logo_url"] = await imageSave(card.logoFile, path: 'logos');
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
      data["avatar_url"] = await imageSave(card.avatarFile, path: 'avatars');
      data["logo_url"] = await imageSave(card.logoFile, path: 'logos');
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

  duplicate(DigitalCard card) async {
    final data = DigitalCardExtension.create(
        card.copyWith(userId: _userService.id).toJson());

    data["custom_links"] = card.customLinks.map((e) => e.toJson()).toList();

    try {
      final og = _digitalCards.value.firstWhere((e) => e.id == card.id);
      if (og.avatarUrl == card.avatarUrl && card.avatarFile == null) {
        final avatarName = "${uuid.v4()}${path.extension('${og.avatarUrl}')}";

        try {
          await _supabase.storage.from("images").copy(
                "avatars/${og.avatarUrl}",
                "avatars/$avatarName",
              );
        } catch (e) {
          if (e.toString().contains(
              "type 'Null' is not a subtype of type 'String' in type cast")) {
            data["avatar_url"] = avatarName;
          }
        }
      } else {
        if (card.avatarFile != null) {
          var mime = lookupMimeType('', headerBytes: card.avatarFile);
          var extension = extensionFromMime("$mime");
          final avatarName = '${uuid.v4()}.$extension';

          await Supabase.instance.client.storage
              .from('images')
              .uploadBinary(
                "avatars/$avatarName",
                card.avatarFile ?? Uint8List(0),
                fileOptions: const FileOptions(
                  cacheControl: '3600',
                  upsert: true,
                ),
              )
              .then((_) {
            data["avatar_url"] = avatarName;
          });
        }
      }

//LOGO
      if (og.logoUrl == card.logoUrl && card.logoFile == null) {
        final logoName = "${uuid.v4()}${path.extension('${og.logoUrl}')}";

        try {
          await _supabase.storage.from("images").copy(
                "logos/${og.logoUrl}",
                "logos/$logoName",
              );
        } catch (e) {
          if (e.toString().contains(
              "type 'Null' is not a subtype of type 'String' in type cast")) {
            data["logo_url"] = logoName;
          }
        }
      } else {
        if (card.logoFile != null) {
          var mime = lookupMimeType('', headerBytes: card.logoFile);
          var extension = extensionFromMime("$mime");
          final logoName = '${uuid.v4()}.$extension';

          await Supabase.instance.client.storage
              .from('images')
              .uploadBinary(
                "logos/$logoName",
                card.logoFile ?? Uint8List(0),
                fileOptions: const FileOptions(
                  cacheControl: '3600',
                  upsert: true,
                ),
              )
              .then((_) {
            data["logo_url"] = logoName;
          });
        }
      }

      final insertedCard = await _supabase.from('cards').insert(data).select();

      if (insertedCard is List<dynamic> && insertedCard.isNotEmpty) {
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
