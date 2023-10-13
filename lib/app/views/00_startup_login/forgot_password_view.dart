import 'package:auto_route/auto_route.dart';
import 'package:digicard/app/ui/_core/ez_button.dart';
import 'package:digicard/app/ui/_core/spacer.dart';
import 'package:digicard/app/constants/dimensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:loader_overlay/loader_overlay.dart';
import 'package:reactive_forms/reactive_forms.dart';

import 'package:stacked/stacked.dart';

import 'login_viewmodel.dart';

@RoutePage()
class ForgotPasswordView extends StatelessWidget {
  /// this route cannot be accessed manual so we put flag to prevent it.
  final bool fromLink;
  const ForgotPasswordView({Key? key, this.fromLink = false}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<LoginViewModel>.reactive(
        viewModelBuilder: () => LoginViewModel(),
        onViewModelReady: (viewModel) {},
        onDispose: (viewModel) {
          viewModel.passwordResetForm.dispose();
        },
        builder: (context, viewModel, child) {
          viewModel.isBusy
              ? context.loaderOverlay.show()
              : context.loaderOverlay.hide();
          return KeyboardVisibilityBuilder(
              builder: (context, isKeyboardVisible) {
            FocusScopeNode currentFocus = FocusScope.of(context);
            return Scaffold(
              appBar: AppBar(
                leading: const AutoLeadingButton(),
                actions: [
                  if (isKeyboardVisible)
                    TextButton(
                        onPressed: () {
                          if (!currentFocus.hasPrimaryFocus) {
                            currentFocus.unfocus();
                          }
                        },
                        child: const Text("DONE"))
                ],
              ),
              body: LayoutBuilder(builder: (context, constraints) {
                return CustomScrollView(
                  slivers: <Widget>[
                    SliverPadding(
                      padding: Dimens.sliverPaddingForm(constraints),
                      sliver: SliverFillRemaining(
                        hasScrollBody: false,
                        child: Center(
                          child: ReactiveForm(
                              formGroup: viewModel.passwordResetForm,
                              child: ForgotPasswordForm(
                                fromLink: fromLink,
                              )),
                        ),
                      ),
                    )
                  ],
                );
              }),
            );
          });
        });
  }
}

class ForgotPasswordForm extends StatelessWidget {
  final bool fromLink;
  const ForgotPasswordForm({
    super.key,
    required this.fromLink,
  });
  @override
  Widget build(BuildContext context) {
    final viewModel = getParentViewModel<LoginViewModel>(context, listen: true);
    FocusScopeNode currentFocus = FocusScope.of(context);

    Widget passwordField() {
      return ReactiveTextField(
        readOnly: !fromLink,
        formControlName: 'password',
        keyboardType: TextInputType.visiblePassword,
        textInputAction: TextInputAction.done,
        obscureText: true,
        showErrors: (control) =>
            control.invalid && control.touched && control.dirty,
        validationMessages: {ValidationMessage.required: (error) => 'Required'},
        decoration: const InputDecoration(
          labelText: "Password",
        ),
      );
    }

    Widget passwordConfirmation() {
      return ReactiveTextField(
        readOnly: !fromLink,
        formControlName: 'passwordConfirmation',
        validationMessages: {
          ValidationMessage.mustMatch: (error) => 'The passwords do not match'
        },
        showErrors: (control) =>
            control.invalid && control.touched && control.dirty,
        keyboardType: TextInputType.visiblePassword,
        textInputAction: TextInputAction.done,
        obscureText: true,
        decoration: const InputDecoration(
          labelText: "Confirm Password",
        ),
      );
    }

    Widget mainButton() {
      return ReactiveFormConsumer(builder: (context, formGroup, child) {
        return EzButton.elevated(
          disabled: viewModel.passwordResetForm.invalid || fromLink == false,
          title: "RESET PASSWORD",
          onTap: () async {
            await viewModel.resetPassword();
            if (!currentFocus.hasPrimaryFocus) {
              currentFocus.unfocus();
            }
          },
        );
      });
    }

    return KeyboardVisibilityBuilder(builder: (
      context,
      isKeyboardVisible,
    ) {
      return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          const Text(
            "Forgot Password",
            style: TextStyle(
              fontSize: 20,
            ),
          ),
          vSpaceRegular,
          passwordField(),
          vSpaceRegular,
          passwordConfirmation(),
          vSpaceRegular,
          mainButton(),
          if (!fromLink)
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                "Check password reset link on your email",
                style: TextStyle(fontSize: 14),
              ),
            )
        ],
      );
    });
  }
}
