import 'package:digicard/app/app.locator.dart';

import 'package:digicard/app/services/_core/app_service.dart';
import 'package:digicard/app/routes/app_router.gr.dart';
import 'package:digicard/app/services/_core/auth_service_supabase.dart';
import 'package:stacked/stacked.dart';

class InitialViewModel extends ReactiveViewModel {
  final appService = locator<AppService>();
  final authService = locator<AuthService>();
  final appRouter = locator<AppRoute>();

  @override
  List<ListenableServiceMixin> get listenableServices => [
        appService,
      ];
}
