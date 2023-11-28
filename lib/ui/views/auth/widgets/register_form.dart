import 'package:flutter/material.dart';
import 'package:flutter_ez_core/widgets/ez_button.dart';
import 'package:reactive_forms/reactive_forms.dart';
import 'package:stacked/stacked.dart';
import 'package:digicard/app/models/register_dto.dart';
import 'package:digicard/ui/common/my_text.dart';
import 'package:digicard/ui/views/auth/auth_viewmodel.dart';

class RegisterForm extends StatelessWidget {
  const RegisterForm({super.key});

  @override
  Widget build(BuildContext context) {
    final viewModel = getParentViewModel<AuthViewModel>(context);

    removeFocus() {
      FocusScopeNode currentFocus = FocusScope.of(context);
      if (!currentFocus.hasPrimaryFocus) {
        currentFocus.focusedChild?.unfocus();
      }
    }

    return ReactiveRegisterDtoFormConsumer(builder: (context, formModel, _) {
      /*    formModel.form.updateValue({
        'fullName': 'Mark Dionnie Bulingit',
        'email': 'bulingitmarkdionnie@gmail.com',
        'password': 'qweqwe123',
        'passwordConfirmation': 'qweqwe123',
        'acceptLicense': true
      }); */
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const MyText.headingTwo('SIGN UP'),
          const SizedBox(height: 24.0),
          ReactiveTextField<String>(
            formControl: formModel.fullNameControl,
            validationMessages: {
              ValidationMessage.required: (_) => 'Required',
            },
            textInputAction: TextInputAction.next,
            style: const TextStyle(fontSize: 14),
            decoration: const InputDecoration(
              labelText: "Fullname",
              helperText: '',
              helperStyle: TextStyle(height: 0.8),
              errorStyle: TextStyle(height: 0.8),
            ),
          ),
          const SizedBox(height: 8.0),
          ReactiveTextField<String>(
            formControl: formModel.emailControl,
            validationMessages: {
              ValidationMessage.required: (_) => 'Required',
              ValidationMessage.email: (_) => 'Invalid email'
            },
            textInputAction: TextInputAction.next,
            style: const TextStyle(fontSize: 14),
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
            validationMessages: {ValidationMessage.required: (_) => 'Required'},
            textInputAction: TextInputAction.next,
            style: const TextStyle(fontSize: 14),
            decoration: const InputDecoration(
              labelText: "Password",
              helperText: '',
              helperStyle: TextStyle(height: 0.8),
              errorStyle: TextStyle(height: 0.8),
            ),
          ),
          const SizedBox(height: 8.0),
          ReactiveTextField<String>(
            formControl: formModel.passwordConfirmationControl,
            obscureText: true,
            validationMessages: {
              ValidationMessage.required: (_) => 'Required',
              ValidationMessage.mustMatch: (_) => "Password do not match",
            },
            textInputAction: TextInputAction.next,
            style: const TextStyle(fontSize: 14),
            decoration: const InputDecoration(
              labelText: "Confirm Password",
              helperText: '',
              helperStyle: TextStyle(height: 0.8),
              errorStyle: TextStyle(height: 0.8),
            ),
          ),
          Row(
            children: [
              Transform.scale(
                scale: 1,
                child: ReactiveCheckbox(
                  onChanged: (control) {},
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(4)),
                  formControl: formModel.acceptLicenseControl,
                  /*   fillColor: const MaterialStatePropertyAll(
                      kcPrimaryColor,
                    ) */
                ),
              ),
              const SizedBox(width: 8),
              const Expanded(
                  child: Text(
                "I accept terms and conditions & privacy policy",
                style: TextStyle(fontSize: 14),
              ))
            ],
          ),
          const SizedBox(height: 24.0),
          ReactiveRegisterDtoFormConsumer(
            builder: (context, formModel, child) {
              return EzButton(
                busy: viewModel.isBusy,
                title: 'SIGN UP',
                disabled: formModel.form.hasErrors ? true : false,
                onPressed: () async {
                  removeFocus();
                  await viewModel.signUp(
                      email: formModel.emailControl?.value,
                      password: formModel.passwordControl?.value);
                },
              );
            },
          ),
          const SizedBox(height: 18.0),
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
