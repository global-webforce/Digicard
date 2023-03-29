import 'package:stacked/stacked.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class AppService with ListenableServiceMixin {
  AppService() {
    listenToReactiveValues([_session]);
  }
  final ReactiveValue<Session?> _session = ReactiveValue<Session?>(null);
  Session? get session => _session.value;
  set user(Session? val) {
    _session.value = val;
  }
}
