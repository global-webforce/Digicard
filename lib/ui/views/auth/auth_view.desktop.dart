import 'package:digicard/app/models/forgot_password_dto.dart';
import 'package:digicard/app/models/login_dto.dart';
import 'package:digicard/app/models/register_dto.dart';
import 'package:digicard/app/models/reset_password_dto.dart';
import 'package:digicard/ui/views/auth/widgets/forgot_password_form.dart';
import 'package:digicard/ui/widgets/onboarding/onboarding.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'auth_viewmodel.dart';
import 'widgets/login_form.dart';
import 'widgets/register_form.dart';

class AuthViewDesktop extends ViewModelWidget<AuthViewModel> {
  const AuthViewDesktop({super.key});

  @override
  Widget build(BuildContext context, AuthViewModel viewModel) {
    return Scaffold(body: LayoutBuilder(builder: (context, size) {
      return SizedBox(
        height: size.maxHeight,
        width: size.maxWidth,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Expanded(
              flex: 3,
              child: SizedBox(
                  width: size.maxWidth,
                  height: size.maxHeight,
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: ClipRRect(
                        borderRadius: BorderRadius.circular(15),
                        child: const Onboarding()),
                  )),
            ),
            Expanded(
                flex: 2,
                child: Center(
                  child: SizedBox(
                    width: 600,
                    child: SingleChildScrollView(
                      padding: const EdgeInsets.all(40.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          if ((viewModel.authType == AuthType.signIn))
                            ReactiveLoginDtoForm(
                              key: ObjectKey(viewModel.loginFormModel),
                              form: viewModel.loginFormModel,
                              child: const LoginForm(),
                            ),
                          if ((viewModel.authType == AuthType.signUp))
                            ReactiveRegisterDtoForm(
                              key: ObjectKey(viewModel.registerFormModel),
                              form: viewModel.registerFormModel,
                              child: const RegisterForm(),
                            ),
                          if ((viewModel.authType == AuthType.forgotPassword))
                            ReactiveForgotPasswordDtoForm(
                              key: ObjectKey(viewModel.forgotPasswordFormModel),
                              form: viewModel.forgotPasswordFormModel,
                              child: const ForgotPasswordForm(),
                            ),
                        ],
                      ),
                    ),
                  ),
                )),
          ],
        ),
      );
    }));
  }
}
