import 'package:digicard/app/models/login_dto.dart';
import 'package:digicard/app/models/register_dto.dart';
import 'package:digicard/ui/widgets/onboarding/onboarding.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ez_core/widgets/scaffold_body_wrapper.dart';
import 'package:stacked/stacked.dart';
import 'auth_viewmodel.dart';
import 'widgets/login_form.dart';
import 'widgets/register_form.dart';

class AuthViewTablet extends ViewModelWidget<AuthViewModel> {
  const AuthViewTablet({super.key});

  @override
  Widget build(BuildContext context, AuthViewModel viewModel) {
    return Scaffold(body: LayoutBuilder(builder: (context, size) {
      return ScaffoldBodyWrapper(
          isFullWidth: true,
          padding: EdgeInsets.zero,
          builder: (context, size) {
            return SizedBox(
              height: size.maxHeight,
              width: size.maxWidth,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Expanded(
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
                      child: Center(
                    child: SizedBox(
                      width: 600,
                      child: SingleChildScrollView(
                        padding: const EdgeInsets.all(30.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
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
                          ],
                        ),
                      ),
                    ),
                  )),
                ],
              ),
            );
          });
    }));
  }
}
