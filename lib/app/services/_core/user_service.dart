import 'package:stacked/stacked.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class UserService with ListenableServiceMixin {
  final _supabase = Supabase.instance.client;
  /*
  It's purpose is to prevent Auth Service to be 
  imported to any part of the app just because the user info is needed 
  */

  final ReactiveValue<User?> _user = ReactiveValue<User?>(null);
  User? get user => _user.value ?? _supabase.auth.currentUser;

  String? get id => _user.value?.id;

  set user(value) {
    _user.value = value;
    notifyListeners();
  }

  bool get isPresent => user != null ? true : false;

  UserService() {
    listenToReactiveValues([
      _user,
    ]);
  }
}
