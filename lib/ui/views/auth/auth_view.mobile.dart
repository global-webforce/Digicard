import 'package:digicard/app/models/login_dto.dart';
import 'package:digicard/app/models/register_dto.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ez_core/helpers/ui_helpers.dart';
import 'package:stacked/stacked.dart';
import 'auth_viewmodel.dart';
import 'widgets/login_form.dart';
import 'widgets/register_form.dart';

class AuthViewMobile extends ViewModelWidget<AuthViewModel> {
  const AuthViewMobile({super.key});

  @override
  Widget build(BuildContext context, AuthViewModel viewModel) {
    return Scaffold(
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            SliverFillRemaining(
              hasScrollBody: false,
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    vSpaceRegular,
                    (viewModel.authType == AuthType.signIn)
                        ? ReactiveLoginDtoForm(
                            key: ObjectKey(viewModel.loginFormModel),
                            form: viewModel.loginFormModel,
                            child: const LoginForm(),
                          )
                        : ReactiveRegisterDtoForm(
                            key: ObjectKey(viewModel.registerFormModel),
                            form: viewModel.registerFormModel,
                            child: const RegisterForm(),
                          ),
                    vSpaceRegular,
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
