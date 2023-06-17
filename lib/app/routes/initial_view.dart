import 'package:auto_route/auto_route.dart';
import 'package:digicard/app/app.locator.dart';
import 'package:digicard/app/routes/app_router.dart';
import 'package:digicard/app/routes/app_router.gr.dart';
import 'package:digicard/app/views/_core/startup/startup_viewmodel.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:stacked/stacked.dart';

@RoutePage(name: 'InitialRoute')
class InitialView extends StatelessWidget {
  const InitialView({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<StartupViewModel>.reactive(
        viewModelBuilder: () => StartupViewModel(),
        onViewModelReady: (viewModel) async {
          final a = locator<AppRouter>();
          if (viewModel.isPresent) {
            a.replaceAll([const DashboardRoute()]);
          } else {
            a.replaceAll([const WelcomeRoute()]);
          }
          if (!kIsWeb) FlutterNativeSplash.remove();
        },
        builder: (context, viewModel, child) {
          return const Scaffold(
            body: Center(child: CircularProgressIndicator()),
          );
        });
  }
}
