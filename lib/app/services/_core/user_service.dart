import 'package:stacked/stacked.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class UserService with ListenableServiceMixin {
  /*
  It's purpose is to prevent Auth Service to be 
  imported to any part of the app just because the user info is needed 
  */
  final _supabase = Supabase.instance.client;

  final ReactiveValue<User?> _user = ReactiveValue<User?>(null);
  User? get user => _user.value ?? _supabase.auth.currentUser;

  String? get id => _user.value?.id;
  set user(final value) {
    _user.value = value;
    notifyListeners();
  }

  bool get isPresent => _user.value != null ? true : false;

  UserService() {
    listenToReactiveValues([
      _user,
    ]);
  }
}
