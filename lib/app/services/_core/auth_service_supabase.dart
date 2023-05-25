import 'dart:async';
import 'package:digicard/app/services/_core/user_service.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../../app.locator.dart';

class AuthService {
  final _supabase = Supabase.instance.client;
  final _userService = locator<UserService>();
  //final navService = locator<NavigationService>();

  AuthService() {
    _supabase.auth.onAuthStateChange.listen((event) async {
      /*      if (event.event.name == "passwordRecovery") {
        navService.navigateToView(const PasswordResetView());
      } */

      _userService.user = event.session?.user;
      if (event.session != null) {
        final expiresAt = DateTime.fromMillisecondsSinceEpoch(
            event.session!.expiresAt! * 1000);
        if (expiresAt
            .isBefore(DateTime.now().subtract(const Duration(seconds: 180)))) {
          await _supabase.auth.refreshSession();
        }
      }
    });
  }

  Future login(Map<String, dynamic> formData) async {
    try {
      await _supabase.auth
          .signInWithPassword(
        email: formData["email"],
        password: formData["password"],
      )
          .then((value) async {
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
            redirectTo: 'https://markbulingit.github.io/#/update-password',
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

  Future<void> logOut() async {
    await _supabase.auth.signOut();
    _userService.user = null;
  }
}
