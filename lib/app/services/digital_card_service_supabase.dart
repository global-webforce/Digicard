import 'dart:async';
import 'dart:io';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:digicard/app/extensions/string_extension.dart';
import 'package:digicard/app/models/digital_card.dart';
import 'package:digicard/app/services/digital_card_service.dart';
import 'package:stacked/stacked.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:uuid/uuid.dart';

class DigitalCardServiceSupabase
    with ListenableServiceMixin
    implements DigitalCardService {
  final _supabase = Supabase.instance.client;

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

  DigitalCardServiceSupabase() {
    listenToReactiveValues([
      _digitalCards,
    ]);
  }

  final ReactiveValue<List<DigitalCard>> _digitalCards =
      ReactiveValue<List<DigitalCard>>([]);

  @override
  Future create(DigitalCard card) async {
    final data =
        card.copyWith(userId: "${_supabase.auth.currentUser?.id}").toJson();
    data.remove("id");
    data.remove("created_at");
    data.remove("updated_at");
    data.remove("custom_links");
    data.remove("full_name");

    try {
      if ("${card.profileImage}".isNotNullOrEmpty()) {
        final profileImageFileName = 'profile-images/${uuid.v4()}.jpg';

        /// Save to Storage
        final profileImageFile = File("${card.profileImage}");
        await _supabase.storage.from('public').upload(
              profileImageFileName,
              profileImageFile,
              fileOptions: const FileOptions(
                cacheControl: '3600',
                upsert: false,
              ),
            );

        /// Get public url
        data["profile_image"] =
            _supabase.storage.from('public').getPublicUrl(profileImageFileName);
      }
      if ("${card.logoImage}".isNotNullOrEmpty()) {
        final logoImageFileName = 'logo-images/${uuid.v4()}.jpg';

        /// Save to Storage
        final logoImageFile = File("${card.logoImage}");
        await _supabase.storage.from('public').upload(
              logoImageFileName,
              logoImageFile,
              fileOptions: const FileOptions(
                cacheControl: '3600',
                upsert: false,
              ),
            );

        /// Get public url
        data["logo_image"] =
            _supabase.storage.from('public').getPublicUrl(logoImageFileName);
      }

      final x = await _supabase.from('digicards').insert(data).select();

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
    final index =
        _digitalCards.value.indexWhere((element) => element.id == card.id);
    final originalRecord = _digitalCards.value[index];

    final updateData =
        card.copyWith(userId: "${_supabase.auth.currentUser?.id}").toJson();
    updateData.remove("id");
    updateData.remove("created_at");
    updateData.remove("updated_at");
    updateData.remove("custom_links");
    updateData.remove("full_name");

    try {
      if ("${card.profileImage}".isFileExistLocally()) {
        /// Save to Storage
        final profileImageFile = File("${card.profileImage}");
        await _supabase.storage.from('public').update(
              'profile-images/${"${originalRecord.profileImage}".extractFileName()}',
              profileImageFile,
              fileOptions: const FileOptions(
                cacheControl: '3600',
                upsert: false,
              ),
            );

        await CachedNetworkImage.evictFromCache(
            "${originalRecord.profileImage}");

        updateData["profile_image"] = originalRecord.profileImage;
      }

      if ("${card.logoImage}".isFileExistLocally()) {
        /// Save to Storage
        final logoImageFile = File("${card.logoImage}");
        await _supabase.storage.from('public').update(
              'logo-images/${"${originalRecord.logoImage}".extractFileName()}',
              logoImageFile,
              fileOptions: const FileOptions(
                cacheControl: '3600',
                upsert: false,
              ),
            );

        await CachedNetworkImage.evictFromCache("${originalRecord.logoImage}");

        updateData["logo_image"] = originalRecord.logoImage;
      }

      final x = await _supabase
          .from('digicards')
          .update(updateData)
          .eq('id', card.id)
          .select();
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
      await _supabase.storage.from('public').remove(
          ['profile-images/${"${card.profileImage}".extractFileName()}']);
      await _supabase.storage
          .from('public')
          .remove(['logo-images/${"${card.logoImage}".extractFileName()}']);
      await _supabase.from('digicards').delete().eq('id', card.id);
      _digitalCards.value.removeWhere((element) => element.id == card.id);
      notifyListeners();
    } catch (e) {
      return errorMessage(e.toString());
    }
  }

  @override
  Future getAll() async {
    final data = await _supabase
        .from('digicards')
        .select('*')
        .in_('user_id', ["${_supabase.auth.currentUser?.id}"]).order(
            'created_at',
            ascending: true);
    if (data is List) {
      _digitalCards.value = data.map((e) => DigitalCard.fromJson(e)).toList();
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
