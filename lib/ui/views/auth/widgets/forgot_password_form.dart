import 'package:digicard/app/models/forgot_password_dto.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ez_core/widgets/ez_button.dart';
import 'package:reactive_forms/reactive_forms.dart';
import 'package:stacked/stacked.dart';
import 'package:digicard/ui/common/my_text.dart';
import 'package:digicard/ui/views/auth/auth_viewmodel.dart';

class ForgotPasswordForm extends StatelessWidget {
  const ForgotPasswordForm({super.key});

  @override
  Widget build(BuildContext context) {
    final viewModel = getParentViewModel<AuthViewModel>(context);
    return ReactiveForgotPasswordDtoFormConsumer(
        builder: (context, formModel, _) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const MyText.headingTwo("PASSWORD RESET"),
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
          ReactiveForgotPasswordDtoFormConsumer(
              builder: (context, formModel, child) {
            return EzButton(
              busy: viewModel.isBusy,
              title: 'REQUEST PASSWORD RESET',
              disabled: formModel.form.hasErrors ? true : false,
              onPressed: () async {
                await viewModel.forgotPassword(
                  email: formModel.emailControl?.value,
                );
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
          TextButton(
              onPressed: () {
                formModel.form.reset();

                viewModel.authType = AuthType.signIn;
              },
              child: const Text(
                "Already a member? Sign in",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
              )),
        ],
      );
    });
  }
}
