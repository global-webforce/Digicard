import 'dart:async';
import 'package:mime/mime.dart';
import 'package:universal_io/io.dart';
import 'package:digicard/app/extensions/digital_card_extension.dart';
import 'package:digicard/app/extensions/string_extension.dart';
import 'package:digicard/app/models/digital_card.dart';
import 'package:flutter/foundation.dart';

import 'package:stacked/stacked.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:uuid/uuid.dart';

import 'package:path/path.dart' as path;

import '../app.locator.dart';
import '_core/user_service.dart';

class DigitalCardService with ListenableServiceMixin {
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

  Future create(DigitalCard card) async {
    final data = DigitalCardExtension.create(
        card.copyWith(userId: _userService.id).toJson());

    data["custom_links"] = card.customLinks.map((e) => e.toJson()).toList();

    try {
      if (card.avatarFile != null) {
        var mime = lookupMimeType('', headerBytes: card.avatarFile);
        var extension = extensionFromMime("$mime");
        final avatarName = '${uuid.v4()}$extension';

        await Supabase.instance.client.storage
            .from('images')
            .uploadBinary(
                "avatars/$avatarName", card.avatarFile ?? Uint8List(0))
            .then((_) {
          data["avatar_url"] = avatarName;
        });
      }
      /*      final logo = File("${card.logoUrl}");
      if (logo.existsSync()) {
        final logoName = '${uuid.v4()}${path.extension(logo.path)}';
        await _supabase.storage
            .from('images')
            .upload(
              "logos/$logoName",
              logo,
              fileOptions: const FileOptions(
                cacheControl: '3600',
                upsert: true,
              ),
            )
            .then((_) {
          data["logo_url"] = logoName;
        });
      } */
      final insertedCard = await _supabase.from('cards').insert(data).select();

      if (insertedCard is List<dynamic> && insertedCard.isNotEmpty) {
        DigitalCard? temp = DigitalCard.fromJson(insertedCard[0]);
        _digitalCards.value.add(temp);
        notifyListeners();
      } else {
        /*    await _supabase
            .from('storage.objects')
            .delete()
            .eq('bucket_id', 'images')
            .eq('name', 'avatars/fdsfsdf.png'); */
      }
    } catch (e) {
      return Future.error(e.toString());
    }
  }

  Future update(DigitalCard card) async {
    final data = DigitalCardExtension.update(card.toJson());
    data["custom_links"] = card.customLinks.map((e) => e.toJson()).toList();

    try {
      final avatar = File("${card.avatarUrl}");
      if (avatar.existsSync()) {
        final avatarName = '${uuid.v4()}${path.extension(avatar.path)}';

        await _supabase.storage
            .from('images')
            .upload(
              "avatars/$avatarName",
              avatar,
              fileOptions: const FileOptions(
                cacheControl: '3600',
                upsert: true,
              ),
            )
            .then((value) {
          data["avatar_url"] = avatarName;
        });
      }

      final logo = File("${card.logoUrl}");
      if (logo.existsSync()) {
        final logoName = '${uuid.v4()}${path.extension(logo.path)}';

        await _supabase.storage
            .from('images')
            .upload(
              "logos/$logoName",
              logo,
              fileOptions: const FileOptions(
                cacheControl: '3600',
                upsert: true,
              ),
            )
            .then((value) {
          data["logo_url"] = logoName;
        });
      }

      final updatedCard =
          await _supabase.from('cards').update(data).eq('id', card.id).select();
      if (updatedCard is List<dynamic> && updatedCard.isNotEmpty) {
        DigitalCard? temp = DigitalCard.fromJson(updatedCard[0]);

        final index =
            _digitalCards.value.indexWhere((element) => element.id == card.id);
        _digitalCards.value[index] = temp;
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
      if (og.avatarUrl == card.avatarUrl &&
          "${card.avatarUrl}".isNotNullOrEmpty()) {
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
        final avatar = File("${card.avatarUrl}");
        if (avatar.existsSync()) {
          final avatarName = "${uuid.v4()}${path.extension(avatar.path)}";

          await _supabase.storage
              .from('images')
              .upload(
                "avatars/$avatarName",
                avatar,
                fileOptions: const FileOptions(
                  cacheControl: '3600',
                  upsert: true,
                ),
              )
              .then((value) {
            data["avatar_url"] = avatarName;
          });
        }
      }

//LOGO
      if (og.logoUrl == card.logoUrl && "${card.logoUrl}".isNotNullOrEmpty()) {
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
        final logo = File("${card.logoUrl}");
        if (logo.existsSync()) {
          final logoName = "${uuid.v4()}${path.extension(logo.path)}";

          await _supabase.storage
              .from('images')
              .upload(
                "logos/$logoName",
                logo,
                fileOptions: const FileOptions(
                  cacheControl: '3600',
                  upsert: true,
                ),
              )
              .then((value) {
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
