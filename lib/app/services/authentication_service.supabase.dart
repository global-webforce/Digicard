import 'package:digicard/app/app.locator.dart';
import 'package:digicard/app/app.logger.dart';
import 'package:digicard/app/app.router.dart';
import 'package:digicard/app/env/env.dart';
import 'package:digicard/app/services/auth_service.dart';
import 'package:digicard/app/services/user_service.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

enum SupabaseAuthEvent {
  signedIn,
  signedOut,
  tokenRefreshed,
  userUpdated,
  passwordRecovery
}

class SupabaseAuthService with Initialisable implements AuthService {
  final log = getLogger('AuthService');
  final _supabase = Supabase.instance.client;
  final _userService = locator<UserService>();
  final _navService = locator<RouterService>();

  @override
  Future<void> initialise() async {
    _supabase.auth.onAuthStateChange.listen((event) async {
      if (event.event.name == "passwordRecovery") {
        _navService.navigateToForgotPasswordView(fromLink: true);
        _userService.user = event.session?.user;
        if (event.session != null) {
          final expiresAt = DateTime.fromMillisecondsSinceEpoch(
              event.session!.expiresAt! * 1000);
          if (expiresAt.isBefore(
              DateTime.now().subtract(const Duration(seconds: 180)))) {
            await _supabase.auth.refreshSession();
          }
        }
      }
    });
  }

  @override
  Future signInWithEmail(
      {required String email, required String password}) async {
    try {
      await _supabase.auth
          .signInWithPassword(
        email: email,
        password: password,
      )
          .then((value) async {
        if (value.session == null) {
          return Future.value(
            "We've already sent confirmation link to your email, Please check",
          );
        } else {}
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
  @override
  Future signUpWithEmail(
      {required String email, required String password}) async {
    try {
      final authResponse = await _supabase.auth.signUp(
        email: email,
        password: password,
      );

      if ((authResponse.user?.identities ?? []).isEmpty) {
        return Future.value(
          "This user already exists",
        );
      }
      if (authResponse.session == null) {
        return Future.value(
          "We've sent confirmation link to your email, Please check",
        );
      }
      if (authResponse.session != null) {}
    } catch (e) {
      if (e is AuthException) {
        return Future.error(e.message);
      } else if (e.toString().toLowerCase().contains("already exists")) {
        return Future.error(e);
      } else if (e.toString().toLowerCase().contains("confirmation link")) {
        return Future.error(e);
      }
      return Future.error("Unknown error occured");
    }
  }

  @override
  Future resetPassword({required String password}) async {
    try {
      await _supabase.auth.updateUser(UserAttributes(password: password));
    } catch (e) {
      if (e is AuthException) {
        return Future.error(e.message);
      }
      return Future.error("Unknown error occured");
    }
  }

  @override
  Future resetPasswordRequest({required String email}) async {
    try {
      await _supabase.auth.resetPasswordForEmail(
        email,
        redirectTo: Env.siteUrlNoHash,
      );
    } catch (e) {
      if (e is AuthException) {
        return Future.error(e.message);
      }
      return Future.error("Unknown error occured");
    }
  }

  @override
  Future signOut() async {
    try {
      await _supabase.auth.signOut();
      _navService.clearStackAndShow(const AuthViewRoute());
    } catch (e) {
      return await Future.error(e.toString());
    }
  }

  @override
  Future signInAnonymously() async {}

  @override
  get user => _supabase.auth.currentUser;
}

String supabaseErrorDefinitions(String value) {
  final val = value.trim().toLowerCase();

  if (val.contains('failed host lookup') ||
      val.contains('xmlhttprequest error')) {
    return "Your internet connection appears to be offline.\nPlease connect and retry.";
  }

  if (val.contains('already exists')) {
    return "User already exists.";
  }
  if (val.contains('invalid login credentials')) {
    return "Invalid login credentials.";
  }
  if (val.contains('confirm')) {
    return "Please verify your email address.Check your email.";
  }

  return value;
}
