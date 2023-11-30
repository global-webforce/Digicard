import 'package:digicard/ui/widgets/onboarding/app_logo.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ez_core/helpers/ui_helpers.dart';
import 'package:flutter_ez_core/widgets/ez_button.dart';
import 'package:reactive_forms/reactive_forms.dart';
import 'package:stacked/stacked.dart';
import 'package:digicard/app/models/login_dto.dart';
import 'package:digicard/ui/common/my_text.dart';
import 'package:digicard/ui/views/auth/auth_viewmodel.dart';

class LoginForm extends StatelessWidget {
  const LoginForm({super.key});

  @override
  Widget build(BuildContext context) {
    final viewModel = getParentViewModel<AuthViewModel>(context);
    return ReactiveLoginDtoFormConsumer(builder: (context, formModel, _) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          if (isMobile(context)) const AppLogo(),
          const SizedBox(height: 24.0),
          const MyText.headingTwo("SIGN-IN"),
          const SizedBox(height: 24.0),
          ReactiveTextField<String>(
            formControl: formModel.emailControl,
            textInputAction: TextInputAction.next,
            validationMessages: {
              ValidationMessage.required: (_) => 'Required',
              ValidationMessage.email: (_) => 'Invalid email'
            },
            decoration: const InputDecoration(
              labelText: 'Email',
              helperText: '',
              helperStyle: TextStyle(height: 0.8),
              errorStyle: TextStyle(height: 0.8),
            ),
          ),
          const SizedBox(height: 8.0),
          ReactiveTextField<String>(
            formControl: formModel.passwordControl,
            obscureText: true,
            validationMessages: {
              ValidationMessage.required: (_) => 'Required',
            },
            textInputAction: TextInputAction.done,
            decoration: const InputDecoration(
              labelText: "Password",
              helperText: '',
              helperStyle: TextStyle(height: 0.8),
              errorStyle: TextStyle(height: 0.8),
            ),
          ),
          const SizedBox(height: 8.0),
          ReactiveLoginDtoFormConsumer(builder: (context, formModel, child) {
            return EzButton(
              busy: viewModel.isBusy,
              title: 'SIGN IN',
              disabled: formModel.form.hasErrors ? true : false,
              onPressed: () async {
                await viewModel.signIn(
                    email: formModel.emailControl?.value,
                    password: formModel.passwordControl?.value);
              },
            );
          }),
          const SizedBox(height: 18.0),
          TextButton(
              onPressed: () {
                formModel.form.reset();

                viewModel.authType = AuthType.signUp;
              },
              child: const Text(
                "Still not a member? Sign up",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
              )),
          /*  TextButton(
              onPressed: () {
                formModel.form.reset();

                viewModel.authType = AuthType.forgotPassword;
              },
              child: const Text(
                "Forgot Password?",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
              )), */
        ],
      );
    });
  }
}
