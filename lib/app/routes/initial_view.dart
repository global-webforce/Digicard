import 'package:auto_route/auto_route.dart';
import 'package:digicard/app/views/_core/startup/startup_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import '../views/_core/welcome/welcome_view.dart';
import '../views/dashboard/dashboard_view.dart';

@RoutePage(name: 'InitialRoute')
class InitialView extends StatelessWidget {
  const InitialView({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<StartupViewModel>.reactive(
        viewModelBuilder: () => StartupViewModel(),
        onDispose: (viewModel) {},
        builder: (context, viewModel, child) {
          return viewModel.isPresent
              ? const DashboardView()
              : const WelcomeView();
        });
  }
}
