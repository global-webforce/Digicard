import 'package:digicard/app/app.router.dart';
import 'package:digicard/app/app_view_model.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class AuthView extends StatelessWidget {
  const AuthView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<AppViewModel>.reactive(
        viewModelBuilder: () => AppViewModel(),
        onViewModelReady: (_) {},
        builder: (context, viewModel, child) {
          return Scaffold(
              body: ExtendedNavigator(
                  router: AuthViewRouter(),
                  navigatorKey: StackedService.nestedNavigationKey(1)));
        });
  }
}
