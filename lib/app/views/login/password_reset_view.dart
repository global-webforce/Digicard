import 'package:auto_route/annotations.dart';
import 'package:digicard/app/ui/_core/ez_button.dart';
import 'package:digicard/app/ui/_core/spacer.dart';
import 'package:digicard/app/views/login/login_viewmodel.dart';
import 'package:digicard/app/constants/dimensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:loader_overlay/loader_overlay.dart';
import 'package:reactive_forms/reactive_forms.dart';

import 'package:stacked/stacked.dart';

@RoutePage()
class PasswordResetView extends StatelessWidget {
  const PasswordResetView({Key? key}) : super(key: key);

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

    Widget passwordField() {
      return ReactiveTextField(
        showErrors: (control) => false,
        formControlName: 'password',
        keyboardType: TextInputType.visiblePassword,
        textInputAction: TextInputAction.done,
        obscureText: true,
        decoration: InputDecoration(
          labelText: "Password",
          floatingLabelBehavior: FloatingLabelBehavior.never,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(
              width: 0,
              style: BorderStyle.none,
            ),
          ),
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
                    children: const [
                      Text(
                        "PASSWORD RESET",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      vSpaceRegular,
                    ],
                  )
                : const SizedBox.shrink(),
          ),
          passwordField(),
          vSpaceRegular,
          mainButton(),
        ],
      );
    });
  }
}
