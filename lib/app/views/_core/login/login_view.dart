import 'package:digicard/app/ui/_core/ez_button.dart';
import 'package:digicard/app/ui/_core/spacer.dart';
import 'package:digicard/app/ui/_shared/app_colors.dart';
import 'package:digicard/app/views/_core/login/login_viewmodel.dart';
import 'package:digicard/app/ui/_shared/dimensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:loader_overlay/loader_overlay.dart';
import 'package:reactive_forms/reactive_forms.dart';

import 'package:stacked/stacked.dart';

class LoginView extends StatelessWidget {
  const LoginView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<LoginViewModel>.reactive(
        viewModelBuilder: () => LoginViewModel(),
        onDispose: (viewModel) {
          viewModel.form.dispose();
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
                leading: const BackButton(),
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
                              formGroup: viewModel.form, child: _LoginForm()),
                        ),
                      ),
                    )
                    /*     SliverToBoxAdapter(
                        child: Center(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: <Widget>[
                              SizedBox(
                                width: 500,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                   
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                      ), */
                  ],
                );
              }),
            );
          });
        });
  }
}

class _LoginForm extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final viewModel = getParentViewModel<LoginViewModel>(context, listen: true);
    FocusScopeNode currentFocus = FocusScope.of(context);

    Widget emailField() {
      return ReactiveTextField(
        showErrors: (control) => false,
        formControlName: 'email',
        keyboardType: TextInputType.emailAddress,
        textInputAction: TextInputAction.next,
        maxLength: 70,
        decoration: const InputDecoration(
          labelText: "Email",
          counterText: "",
        ),
      );
    }

    Widget passwordField() {
      return ReactiveTextField(
        showErrors: (control) => false,
        formControlName: 'password',
        keyboardType: TextInputType.visiblePassword,
        textInputAction: TextInputAction.next,
        obscureText: true,
        decoration: const InputDecoration(
          labelText: "Password",
        ),
      );
    }

    Widget mainButton() {
      return ReactiveFormConsumer(builder: (context, formGroup, child) {
        return EzButton.elevated(
          disabled: viewModel.form.hasErrors,
          title:
              viewModel.action == ActionType.login ? "LOGIN" : "CREATE ACCOUNT",
          onTap: () async {
            if (!currentFocus.hasPrimaryFocus) {
              currentFocus.unfocus();
            }
            viewModel.action == ActionType.login
                ? await viewModel.login()
                : await viewModel.register();
          },
        );
      });
    }

    Widget secondaryButton() {
      return TextButton(
        onPressed: () async {
          if (!currentFocus.hasPrimaryFocus) {
            currentFocus.unfocus();
          }
          if (viewModel.action == ActionType.login) {
            viewModel.action = ActionType.register;
          } else {
            viewModel.action = ActionType.login;
          }
        },
        child: Text(
          viewModel.action == ActionType.login ? "CREATE ACCOUNT" : "LOGIN",
          textAlign: TextAlign.center,
          style: const TextStyle(fontSize: 18),
        ),
      );
    }

    Widget forgotPasswordButton() {
      return TextButton(
        onPressed: () async {
          if (!currentFocus.hasPrimaryFocus) {
            currentFocus.unfocus();
          }
          await viewModel.forgotPassword();
        },
        child: const Text(
          "FORGOT PASSWORD",
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 18),
        ),
      );
    }

    Widget socialIcon(Icon icon) {
      return ClipOval(
        child: Material(
          color: kcPrimaryColor,
          child: InkWell(
            onTap: () {},
            child: SizedBox(width: 56, height: 56, child: icon),
          ),
        ),
      );
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
          if (!isKeyboardVisible)
            const Text(
              "Enter your email & password \nto login",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 20),
            ),
          if (!isKeyboardVisible) vSpaceRegular,
          if (!isKeyboardVisible)
            Wrap(
              spacing: 10,
              children: [
                socialIcon(const Icon(FontAwesomeIcons.google)),
                socialIcon(const Icon(FontAwesomeIcons.twitter)),
                socialIcon(const Icon(FontAwesomeIcons.facebook)),
                socialIcon(const Icon(FontAwesomeIcons.apple)),
                socialIcon(const Icon(FontAwesomeIcons.microsoft)),
              ],
            ),
          if (!isKeyboardVisible)
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8),
              child: Row(
                children: const [
                  Expanded(
                    child: Divider(
                      color: Colors.white,
                      thickness: 1,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text(
                      'OR',
                      style: TextStyle(fontSize: 18),
                    ),
                  ),
                  Expanded(
                    child: Divider(
                      color: Colors.white,
                      thickness: 1,
                    ),
                  ),
                ],
              ),
            ),
          emailField(),
          vSpaceRegular,
          passwordField(),
          vSpaceRegular,
          mainButton(),
          vSpaceRegular,
          secondaryButton(),
          forgotPasswordButton(),
        ],
      );
    });
  }
}
