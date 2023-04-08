import 'dart:async';
import 'dart:io';
import 'package:digicard/app/app.locator.dart';
import 'package:digicard/app/models/digital_card.dart';
import 'package:digicard/app/services/digital_card_service.dart';
import 'package:stacked/stacked.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:uuid/uuid.dart';

import '_core/auth_service_supabase.dart';
import 'package:path/path.dart' as path;

class DigitalCardServiceSupabase
    with ListenableServiceMixin
    implements DigitalCardService {
  var uuid = const Uuid();

  final _authService = locator<AuthService>();
  final _supabase = Supabase.instance.client;

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

  DigitalCardServiceSupabase() {
    listenToReactiveValues([
      _digitalCards,
    ]);
  }

  final ReactiveValue<List<DigitalCard>> _digitalCards =
      ReactiveValue<List<DigitalCard>>([]);

  @override
  Future create(DigitalCard card) async {
    final data = card
        .copyWith(userId: "${_authService.authState?.session?.user.id}")
        .toJson();
    data.remove("id");
    data.remove("created_at");
    data.remove("updated_at");
    data.remove("custom_links");
    data.remove("full_name");

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
      final x = await _supabase
          .from('cards')
          .upsert(data, onConflict: 'avatar_url')
          .select();

      if (x is List<dynamic>) {
        _digitalCards.value.add(DigitalCard.fromJson(x[0]));
        notifyListeners();
      }
    } catch (e) {
      return Future.error(e.toString());
    }
  }

  @override
  Future update(DigitalCard card) async {
    final data = card
        .copyWith(userId: "${_authService.authState?.session?.user.id}")
        .toJson();
    data.remove("id");
    data.remove("created_at");
    data.remove("updated_at");
    data.remove("custom_links");
    data.remove("full_name");

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

      final x =
          await _supabase.from('cards').update(data).eq('id', card.id).select();
      if (x is List<dynamic>) {
        final index =
            _digitalCards.value.indexWhere((element) => element.id == card.id);
        _digitalCards.value[index] = DigitalCard.fromJson(x[0]);
        notifyListeners();
      }
    } catch (e) {
      return Future.error(e.toString());
    }
  }

  @override
  Future delete(DigitalCard card) async {
    try {
      await _supabase.from('cards').delete().eq('id', card.id);
      _digitalCards.value.removeWhere((element) => element.id == card.id);
      notifyListeners();
    } catch (e) {
      return errorMessage(e.toString());
    }
  }

  @override
  Future getAll() async {
    try {
      final data = await _supabase.from('cards').select('*').in_('user_id', [
        "${_authService.authState?.session?.user.id}"
      ]).order('created_at', ascending: true);
      if (data is List) {
        _digitalCards.value = data.map((e) => DigitalCard.fromJson(e)).toList();
      }
    } catch (e) {
      return errorMessage(e.toString());
    }
  }

  @override
  List<DigitalCard> get digitalCards {
    return _digitalCards.value.reversed.toList();
  }

  @override
  duplicate(DigitalCard digitalCard) async {
    await create(digitalCard);
  }
}
