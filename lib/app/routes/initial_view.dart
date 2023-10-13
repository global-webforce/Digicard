import 'package:auto_route/auto_route.dart';
import 'package:digicard/app/views/00_startup/startup_viewmodel.dart';
import 'package:digicard/app/views/dashboard/dashboard_view.dart';
import 'package:digicard/app/views/00_startup_welcome/welcome_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:stacked/stacked.dart';

@RoutePage(name: 'InitialRoute')
class InitialView extends StatelessWidget {
  const InitialView({super.key});

  @override
  Widget build(BuildContext context) {
    final vm = getParentViewModel<StartupViewModel>(context);
    FlutterNativeSplash.remove();
    if (vm.isPresent) {
      return const DashboardView();
    }

    return const WelcomeView();
  }
}
