import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:stacked/stacked.dart';

import 'auth_view.desktop.dart';
import 'auth_view.mobile.dart';
import 'auth_viewmodel.dart';

class AuthView extends StackedView<AuthViewModel> {
  const AuthView({super.key});

  @override
  Widget builder(
    BuildContext context,
    AuthViewModel viewModel,
    Widget? child,
  ) {
    return ScreenTypeLayout.builder(
      mobile: (_) => const AuthViewMobile(),
      tablet: (_) => const AuthViewDesktop(),
      desktop: (_) => const AuthViewDesktop(),
    );
  }

  @override
  AuthViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      AuthViewModel();

  @override
  Future<void> onViewModelReady(AuthViewModel viewModel) async {
    viewModel.initialiseForms();

    super.onViewModelReady(viewModel);
  }
}
