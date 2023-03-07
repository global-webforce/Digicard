import 'package:auto_route/auto_route.dart';
import 'package:digicard/app/app.locator.dart';

import 'package:digicard/app/services/_core/app_service.dart';
import 'package:digicard/app/routes/app_router.gr.dart';
import 'package:stacked/stacked.dart';

class InitialViewModel extends ReactiveViewModel {
  final _appService = locator<AppService>();
  final appRouter = locator<AppRoute>();

  @override
  List<ListenableServiceMixin> get listenableServices => [
        _appService,
      ];

  List<PageRouteInfo<dynamic>> isLoggedIn() {
    return _appService.isLoggedIn();
  }
}
