import 'dart:async';
import 'package:digicard/app/services/_core/app_service.dart';
import 'package:digicard/app/app.locator.dart';

import 'package:supabase_flutter/supabase_flutter.dart';

class AuthService {
  late final StreamSubscription<AuthState> _authSubscription;

  final _appService = locator<AppService>();
  final _supabase = Supabase.instance.client;

  checkSession() async {
    _authSubscription = _supabase.auth.onAuthStateChange.listen((data) {
      final Session? session = data.session;
      _appService.user = session;
    });
  }

  Future login(Map<String, dynamic> formData) async {
    try {
      return await _supabase.auth
          .signInWithPassword(
        email: formData["email"],
        password: formData["password"],
      )
          .then((value) {
        if (value.session == null) {
          return Future.error(
            "We've already sent confirmation link to your email, Please check",
          );
        }
      });
    } catch (e) {
      if (e is AuthException) {
        return Future.error(e.message);
      } else if (e.toString().toLowerCase().contains("confirmation link")) {
        return Future.error(e);
      }
      return Future.error("Unknown error occured");
    }
  }

//https://github.com/supabase/supabase-js/issues/296#issuecomment-962391773
  Future register(Map<String, dynamic> formData) async {
    try {
      return await _supabase.auth
          .signUp(
        email: formData["email"],
        password: formData["password"],
      )
          .then((value) {
        final x = value.user?.identities ?? [];
        if (x.isEmpty) {
          return Future.error(
            "This user already exists",
          );
        }
      });
    } catch (e) {
      if (e is AuthException) {
        return Future.error(e.message);
      } else if (e.toString().toLowerCase().contains("already exists")) {
        return Future.error(e);
      }
      return Future.error("Unknown error occured");
    }
  }

  Future resetPassword(Map<String, dynamic> formData) async {
    try {
      return await _supabase.auth
          .resetPasswordForEmail(
            formData["email"],
          )
          .then((value) {});
    } catch (e) {
      if (e is AuthException) {
        return Future.error(e.message);
      } else if (e.toString().toLowerCase().contains("already exists")) {
        return Future.error(e);
      }
      return Future.error("Unknown error occured");
    }
  }

  Future updateProfile(Map<String, dynamic> formData) async {}

  x() {
    _authSubscription.cancel();
  }

  Future<void> logOut() async {
    await _supabase.auth.signOut();
  }
}
