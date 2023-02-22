import 'package:digicard/app/core/authentication/pages/auth_view_model.dart';
import 'package:digicard/app/shared/constants/dimensions.dart';
import 'package:ez_core/ez_core.dart';
import 'package:ez_ui/ez_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:loader_overlay/loader_overlay.dart';

import 'package:stacked/stacked.dart';

class LoginView extends StatefulWidget {
  const LoginView({Key? key}) : super(key: key);

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<AuthViewModel>.reactive(
        viewModelBuilder: () => AuthViewModel(),
        onViewModelReady: (_) {},
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
                          child: _LoginForm(),
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
    FocusScopeNode currentFocus = FocusScope.of(context);
    final viewModel = getParentViewModel<AuthViewModel>(context);

    Widget emailField() {
      return FormBuilderTextField(
        name: "email",
        onChanged: (value) {
          viewModel.checkAllowLogin();
        },
        keyboardType: TextInputType.emailAddress,
        textInputAction: TextInputAction.next,
        maxLength: 70,
        autovalidateMode: AutovalidateMode.disabled,
        decoration: const InputDecoration(
          labelText: "Email",
          counterText: "",
        ),
      );
    }

    Widget passwordField() {
      return FormBuilderTextField(
        name: "password",
        onChanged: (value) {
          viewModel.checkAllowLogin();
        },
        keyboardType: TextInputType.visiblePassword,
        textInputAction: TextInputAction.next,
        obscureText: true,
        decoration: const InputDecoration(
          labelText: "Password",
        ),
      );
    }

    Widget loginButton() {
      return EzButton.elevated(
        disabled: !viewModel.allowLogin,
        title: "LOGIN",
        onTap: () async {
          if (!currentFocus.hasPrimaryFocus) {
            currentFocus.unfocus();
          }
          await viewModel.login();
        },
      );
    }

    Widget loginButton2() {
      return TextButton(
        onPressed: () {
          viewModel.action = ActionType.login;
        },
        child: const Text(
          "LOGIN",
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 18),
        ),
      );
    }

    Widget registerButton() {
      return EzButton.elevated(
        disabled: !viewModel.allowLogin,
        title: "CREATE ACCOUNT",
        onTap: () async {
          if (!currentFocus.hasPrimaryFocus) {
            currentFocus.unfocus();
          }
          await viewModel.register();
        },
      );
    }

    Widget registerButton2() {
      return TextButton(
        onPressed: () {
          viewModel.action = ActionType.register;
        },
        child: const Text(
          "CREATE ACCOUNT",
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 18),
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
          color: Colors.orange,
          child: InkWell(
            onTap: () {},
            child: SizedBox(width: 56, height: 56, child: icon),
          ),
        ),
      );
    }

    return KeyboardVisibilityBuilder(builder: (context, isKeyboardVisible) {
      return FormBuilder(
        key: viewModel.loginFormKey,
        child: Column(
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
            if (viewModel.action == ActionType.login) loginButton(),
            if (viewModel.action == ActionType.register) registerButton(),
            vSpaceRegular,
            if (viewModel.action == ActionType.login) registerButton2(),
            if (viewModel.action == ActionType.register) loginButton2(),
            forgotPasswordButton(),
          ],
        ),
      );
    });
  }
}
