import 'package:auto_route/auto_route.dart';
import 'package:ez_core/ez_core.dart';
import 'package:ez_ui/ez_ui.dart';
import 'package:digicard/app/app_view_model.dart';
import 'package:digicard/app/core/authentication/address_extension.dart';
import 'package:digicard/app/models/address.model.dart';
import 'package:digicard/app/routes/app_router.gr.dart';
import 'package:digicard/app/shared/ui/scaffold_body_wrapper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_extra_fields/form_builder_extra_fields.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:stacked/stacked.dart';

class RegisterClientPage extends StatefulWidget {
  const RegisterClientPage({Key? key}) : super(key: key);

  @override
  State<RegisterClientPage> createState() => _RegisterClientPageState();
}

class _RegisterClientPageState extends State<RegisterClientPage> {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<AppViewModel>.reactive(
        viewModelBuilder: () => AppViewModel(),
        onViewModelReady: (viewModel) {
          viewModel.loadPlacesInAustralia();
        },
        builder: (context, viewModel, child) {
          Widget closeButton() {
            return InkWell(
              borderRadius: BorderRadius.circular(8),
              onTap: () => context.replaceRoute(const LoginRoute()),
              //onLongPress: () => viewModel.generateUser(),
              child: Container(
                  decoration: BoxDecoration(
                      color: Theme.of(context)
                          .colorScheme
                          .primary
                          .withOpacity(0.6),
                      borderRadius: BorderRadius.circular(8)),
                  child: const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Icon(
                      Icons.close_rounded,
                      color: Colors.white,
                    ),
                  )),
            );
          }

          Widget formHeader() {
            return const Text(
              "Register as \nCompany Member",
              textAlign: TextAlign.center,
              style: TextStyle(fontWeight: FontWeight.w300, fontSize: 20),
            );
          }

          Widget dividerLine() {
            Widget line = Expanded(
              child: Container(
                  margin: const EdgeInsets.only(left: 20.0, right: 20.0),
                  child: const Divider(
                    color: Colors.grey,
                    thickness: 1,
                    height: 40,
                  )),
            );
            return Row(children: <Widget>[line, const Text("OR"), line]);
          }

          Widget formFooter() {
            return Column(
              children: [
                dividerLine(),
                TextButton(
                  child: const Text(
                    "SIGN-UP AS SERVICE PROVIDER",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
                  ),
                  onPressed: () {
                    context.replaceRoute(
                      const RegisterRoute(),
                    );
                  },
                ),
                vSpaceMedium,
                const EzText.body("Already have an account?"),
                TextButton(
                  onPressed: () {
                    context.replaceRoute(
                      const LoginRoute(),
                    );
                  },
                  child: const Text(
                    "LOGIN",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
                  ),
                ),
              ],
            );
          }

          return SafeArea(
              child: Scaffold(
                  floatingActionButton: Padding(
                    padding: const EdgeInsets.only(top: 15),
                    child: closeButton(),
                  ),
                  floatingActionButtonLocation:
                      FloatingActionButtonLocation.startTop,
                  backgroundColor: Colors.white,
                  body: ScaffoldBodyWrapper(
                      centered: true,
                      builder: (context, constraints) {
                        return Center(
                          child: SizedBox(
                            width: 500,
                            child: Padding(
                              padding: const EdgeInsets.symmetric(vertical: 30),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  formHeader(),
                                  vSpaceMedium,
                                  _RegisterForm(),
                                  formFooter(),
                                ],
                              ),
                            ),
                          ),
                        );
                      })));
        });
  }
}

class _RegisterForm extends StatelessWidget {
  final List<String> roleOptions = ['User', 'Admin'];

  @override
  Widget build(BuildContext context) {
    final viewModel = getParentViewModel<AppViewModel>(context);

    Widget addressDropdownField() {
      return FormBuilderSearchableDropdown<Address>(
        name: 'address2',
        validator: FormBuilderValidators.compose([
          FormBuilderValidators.required(),
        ]),
        itemAsString: (address) {
          return address.displaySafe();
        },
        onChanged: (value) {},
        compareFn: (a, b) {
          return a == b;
        },
        filterFn: (address, filter) =>
            address.displaySafe().toLowerCase().contains(filter.toLowerCase()),
        popupProps: const PopupProps.dialog(
          showSearchBox: true,
          searchDelay: Duration(milliseconds: 0),
        ),
        dropdownSearchDecoration: const InputDecoration(
          hintText: 'Search',
          labelText: 'Search',
        ),
        clearButtonProps: const ClearButtonProps(isVisible: true),
        decoration: const InputDecoration(labelText: "Suburb/state/postcode"),
        items: viewModel.placesInAustralia,
      );
    }

    Widget emailField() {
      return FormBuilderTextField(
        name: "email",
        textInputAction: TextInputAction.next,
        keyboardType: TextInputType.emailAddress,
        autofillHints: const [AutofillHints.email],
        maxLength: 70,
        decoration: const InputDecoration(
          labelText: "Email",
          counterText: "",
        ),
        validator: FormBuilderValidators.compose([
          FormBuilderValidators.required(),
          FormBuilderValidators.email(),
          FormBuilderValidators.maxLength(70),
        ]),
      );
    }

    Widget firstNameField() {
      return FormBuilderTextField(
        name: "first_name",
        textInputAction: TextInputAction.next,
        keyboardType: TextInputType.name,
        autofillHints: const [AutofillHints.namePrefix],
        maxLength: 70,
        decoration: const InputDecoration(
          labelText: "First Name",
          counterText: "",
        ),
        validator: FormBuilderValidators.compose([
          FormBuilderValidators.required(),
          FormBuilderValidators.maxLength(70),
        ]),
      );
    }

    Widget lastNameField() {
      return FormBuilderTextField(
        name: "last_name",
        textInputAction: TextInputAction.next,
        keyboardType: TextInputType.name,
        autofillHints: const [AutofillHints.nameSuffix],
        maxLength: 70,
        decoration: const InputDecoration(
          labelText: "Last Name",
          counterText: "",
        ),
        validator: FormBuilderValidators.compose([
          FormBuilderValidators.required(),
          FormBuilderValidators.maxLength(70),
        ]),
      );
    }

    Widget phoneField() {
      final maskFormatter = MaskTextInputFormatter(
        mask: "+61 ###-###-###",
        filter: {"#": RegExp(r'[0-9]')},
      );
      return FormBuilderTextField(
        inputFormatters: [maskFormatter],
        validator: FormBuilderValidators.compose([
          FormBuilderValidators.required(),
          FormBuilderValidators.minLength(15,
              errorText: "Invalid Mobile Number"),
          FormBuilderValidators.maxLength(15,
              errorText: "Invalid Mobile Number"),
        ]),
        //valueTransformer: (text) => maskFormatter.getUnmaskedText(),
        name: "mobile_number",

        textInputAction: TextInputAction.next,
        keyboardType: TextInputType.phone,
        autofillHints: const [AutofillHints.telephoneNumber],
        decoration: const InputDecoration(
          labelText: 'Mobile #',
        ),
      );
    }

    Widget passwordField() {
      return FormBuilderTextField(
        name: "password",
        textInputAction: TextInputAction.next,
        keyboardType: TextInputType.visiblePassword,
        autofillHints: const [AutofillHints.password],
        obscureText: true,
        decoration: const InputDecoration(
          labelText: "Password",
        ),
        validator: FormBuilderValidators.compose([
          FormBuilderValidators.required(),
        ]),
      );
    }

    Widget passwordConfirmationField() {
      return FormBuilderTextField(
        name: "password_confirmation",
        textInputAction: TextInputAction.next,
        keyboardType: TextInputType.visiblePassword,
        autofillHints: const [AutofillHints.password],
        obscureText: true,
        decoration: const InputDecoration(
          labelText: "Confirm Password",
        ),
        validator: FormBuilderValidators.compose([
          FormBuilderValidators.required(),
          (val) {
            if (val !=
                viewModel
                    .registerFormKey.currentState?.fields['password']?.value) {
              return 'Passwords do not match';
            }
            return null;
          },
        ]),
      );
    }

    Widget inviteCodeField() {
      return FormBuilderTextField(
        name: "code",
        initialValue: "*(&^ASdhjk",
        textInputAction: TextInputAction.next,
        keyboardType: TextInputType.text,
        decoration: const InputDecoration(
          prefixIcon: Icon(Icons.door_sliding_outlined),
          labelText: "Membership Code",
        ),
        obscureText: true,
      );
    }

    Widget submitButton() {
      return EzButton.elevated(
        rounded: true,
        busy: viewModel.isBusy,
        title: "REGISTER",
        onTap: () async {
          await viewModel.register();
        },
      );
    }

    return FormBuilder(
      key: viewModel.registerFormKey,
      autoFocusOnValidationFailure: true,
      skipDisabled: true,
      child: Column(
        children: [
          emailField(),
          vSpaceSmall,
          firstNameField(),
          vSpaceSmall,
          lastNameField(),
          vSpaceSmall,
          phoneField(),
          vSpaceSmall,
          addressDropdownField(),
          vSpaceSmall,
          passwordField(),
          vSpaceSmall,
          passwordConfirmationField(),
          vSpaceSmall,
          inviteCodeField(),
          vSpaceSmall,
          submitButton(),
        ],
      ),
    );
  }
}
