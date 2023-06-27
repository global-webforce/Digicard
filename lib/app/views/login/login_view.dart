import 'package:auto_route/auto_route.dart';
import 'package:digicard/app/ui/_core/ez_button.dart';
import 'package:digicard/app/ui/_core/spacer.dart';
import 'package:digicard/app/constants/colors.dart';
import 'package:digicard/app/views/login/login_viewmodel.dart';
import 'package:digicard/app/constants/dimensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:loader_overlay/loader_overlay.dart';
import 'package:reactive_forms/reactive_forms.dart';

import 'package:stacked/stacked.dart';

@RoutePage()
class LoginView extends StatelessWidget {
  final void Function(bool)? onSuccessfulLogin;
  const LoginView({Key? key, this.onSuccessfulLogin}) : super(key: key);

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
                              formGroup: viewModel.form,
                              child: LoginForm(
                                onSuccessfulLogin: (val) {
                                  (onSuccessfulLogin != null)
                                      ? onSuccessfulLogin!(true)
                                      : null;
                                },
                              )),
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

class LoginForm extends StatelessWidget {
  final void Function(bool)? onSuccessfulLogin;

  const LoginForm({super.key, this.onSuccessfulLogin});
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
        decoration: const InputDecoration(
          labelText: "Email",
        ),
      );
    }

    Widget passwordField() {
      return ReactiveTextField(
        showErrors: (control) => false,
        formControlName: 'password',
        keyboardType: TextInputType.visiblePassword,
        textInputAction: TextInputAction.done,
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
                ? await viewModel.login().then((value) =>
                    (onSuccessfulLogin != null)
                        ? onSuccessfulLogin!(true)
                        : null)
                : await viewModel.register();
          },
        );
      });
    }

    Widget secondaryButton() {
      return TextButton(
        style: TextButton.styleFrom(
          minimumSize: Size.zero,
          padding: const EdgeInsets.symmetric(
            horizontal: 12,
            vertical: 4,
          ),
          tapTargetSize: MaterialTapTargetSize.shrinkWrap,
        ),
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
        style: TextButton.styleFrom(
          minimumSize: Size.zero,
          padding: const EdgeInsets.symmetric(
            horizontal: 12,
            vertical: 4,
          ),
          tapTargetSize: MaterialTapTargetSize.shrinkWrap,
        ),
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

    Widget socialIcon({required Icon icon, Function()? onTap}) {
      return ClipOval(
        child: Material(
          color: kcPrimaryColor,
          child: InkWell(
            onTap: onTap != null ? () => onTap() : null,
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
          AnimatedSwitcher(
            duration: const Duration(milliseconds: 500),
            child: !isKeyboardVisible
                ? Column(
                    children: [
                      const Text(
                        "SIGN-IN WITH",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      vSpaceRegular,
                      Wrap(
                        spacing: 10,
                        children: [
                          socialIcon(icon: const Icon(FontAwesomeIcons.google)),
                          socialIcon(
                              icon: const Icon(FontAwesomeIcons.twitter)),
                          socialIcon(
                            icon: const Icon(FontAwesomeIcons.facebook),
                            onTap: () {
                              viewModel.loginOAuth();
                            },
                          ),
                          socialIcon(icon: const Icon(FontAwesomeIcons.apple)),
                          socialIcon(
                              icon: const Icon(FontAwesomeIcons.microsoft)),
                        ],
                      ),
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
                                style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold,
                                ),
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
                    ],
                  )
                : const SizedBox.shrink(),
          ),
          emailField(),
          vSpaceRegular,
          passwordField(),
          vSpaceRegular,
          mainButton(),
          vSpaceRegular,
          secondaryButton(),
          vSpaceTiny,
          forgotPasswordButton(),
        ],
      );
    });
  }
}
