import 'package:auto_route/auto_route.dart';
import 'package:digicard/app/views/_core/startup/startup_viewmodel.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:stacked/stacked.dart';

import '../app.locator.dart';
import 'app_router.dart';
import 'app_router.gr.dart';

@RoutePage(name: 'InitialRoute')
class InitialView extends StatelessWidget {
  const InitialView({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<StartupViewModel>.reactive(
        viewModelBuilder: () => StartupViewModel(),
        onViewModelReady: (viewModel) async {
          if (viewModel.isPresent) {
            locator<AppRouter>().replace(const DashboardRoute());
          } else {
            locator<AppRouter>().replace(const WelcomeRoute());
          }
          if (!kIsWeb) FlutterNativeSplash.remove();
        },
        onDispose: (viewModel) {},
        builder: (context, viewModel, child) {
          return const Scaffold(
            body: Center(
              child: CircularProgressIndicator(),
            ),
          );
        });
  }
}
