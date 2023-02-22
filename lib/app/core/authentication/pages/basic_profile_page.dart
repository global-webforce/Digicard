import 'package:ez_core/ez_core.dart';
import 'package:ez_dashboard/screen_size_helper.dart';
import 'package:ez_ui/ez_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:form_builder_extra_fields/form_builder_extra_fields.dart';
import 'package:form_builder_image_picker/form_builder_image_picker.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:stacked/stacked.dart';
import 'package:digicard/app/app.viewmodels_busy_keys.dart';
import 'package:digicard/app/app_view_model.dart';
import 'package:digicard/app/shared/ui/scaffold_body_wrapper.dart';
import 'package:digicard/app/core/authentication/address_extension.dart';
import 'package:digicard/app/models/address.model.dart';

class BasicProfilePage extends StatelessWidget {
  const BasicProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<AppViewModel>.reactive(
        viewModelBuilder: () => AppViewModel(),
        onViewModelReady: (viewModel) async {
          viewModel.loadPlacesInAustralia();
        },
        builder: (context, viewModel, child) {
          return Scaffold(
              appBar: AppBar(
                centerTitle: true,
                leading: const BackButton(),
                title: const Text("Basic Profile"),
              ),
              body: ScaffoldBodyWrapper(builder: (context, constraints) {
                return Column(
                  children: const [
                    _ProfileCard(),
                    vSpaceRegular,
                    _BasicProfileForm(),
                  ],
                );
              }));
        });
  }
}

class _BasicProfileForm extends StatelessWidget {
  const _BasicProfileForm({
    Key? key,
  }) : super(key: key);

  final textStyle = const TextStyle(fontWeight: FontWeight.w500);
  @override
  Widget build(BuildContext context) {
    final viewModel = getParentViewModel<AppViewModel>(context);
    final user = viewModel.user;

    Widget avatarField() {
      return FormBuilderImagePicker(
        name: 'profile_pic',
        autovalidateMode: AutovalidateMode.onUserInteraction,
        maxImages: 1,
        validator: FormBuilderValidators.compose([]),
        decoration: const InputDecoration(
          labelText: "Profile Picture",
          counterText: "",
        ),
      );
    }

    Widget emailField() {
      return FormBuilderTextField(
        name: "email",
        enabled: false,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        initialValue: user?.email,
        keyboardType: TextInputType.emailAddress,
        autofillHints: const [AutofillHints.email],
        decoration: const InputDecoration(
          labelText: "Email",
          counterText: "",
          prefixIcon: Icon(Icons.email_rounded),
        ),
      );
    }

    Widget firstNameField() {
      return FormBuilderTextField(
        name: "first_name",
        enabled: false,
        initialValue: user?.firstName,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        decoration: const InputDecoration(labelText: "First Name"),
        validator: FormBuilderValidators.compose([
          FormBuilderValidators.required(),
        ]),
      );
    }

    Widget lastNameField() {
      return FormBuilderTextField(
        name: "last_name",
        enabled: false,
        initialValue: user?.lastName,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        keyboardType: TextInputType.name,
        autofillHints: const [AutofillHints.nameSuffix],
        maxLength: 70,
        decoration:
            const InputDecoration(labelText: "Last Name", counterText: ""),
        validator: FormBuilderValidators.compose([
          FormBuilderValidators.required(),
          FormBuilderValidators.maxLength(70),
        ]),
      );
    }

    Widget birthDateField() {
      return FormBuilderDateTimePicker(
        name: "birth_date",
        inputType: InputType.date,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        initialValue: DateTime.tryParse("${user?.birthDate}"),
        valueTransformer: (value) {
          return value?.toIso8601String();
        },
        decoration: const InputDecoration(
          labelText: "Birthdate",
          prefixIcon: Icon(
            Icons.calendar_month_rounded,
          ),
        ),
      );
    }

    Widget genderField() {
      final genderOptions = ["Male", "Female", "Others"];
      return FormBuilderDropdown(
        name: 'gender',
        autovalidateMode: AutovalidateMode.onUserInteraction,
        decoration: const InputDecoration(
          labelText: 'Gender',
          hintText: 'Select Gender',
          prefixIcon: Icon(Icons.male_rounded),
        ),
        initialValue: user?.gender,
        items: genderOptions
            .map((gender) => DropdownMenuItem(
                  value: gender,
                  child: Text(gender),
                ))
            .toList(),
      );
    }

    Widget phoneField() {
      final maskFormatter = MaskTextInputFormatter(
          mask: "+61 ###-###-###",
          filter: {"#": RegExp(r'[0-9]')},
          type: MaskAutoCompletionType.lazy);
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

        initialValue: user?.mobileNumber,
        autovalidateMode: AutovalidateMode.onUserInteraction,

        keyboardType: TextInputType.phone,
        autofillHints: const [AutofillHints.telephoneNumber],

        decoration: const InputDecoration(
          labelText: 'Mobile #',
          prefixIcon: Icon(Icons.phone_android_rounded),
        ),
      );
    }

    Widget houseNumberField() {
      return FormBuilderTextField(
        name: "address1",
        initialValue: user?.address?.fullAddress,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        maxLines: null,
        keyboardType: TextInputType.multiline,
        maxLength: 200,
        decoration: const InputDecoration(
          labelText: "Street Name, Building, House No.",
          counterText: "",
          prefixIcon: Icon(
            Icons.home_rounded,
          ),
        ),
        /*     validator: FormBuilderValidators.compose([
          FormBuilderValidators.required(),
          FormBuilderValidators.maxLength(200),
        ]), */
      );
    }

    Widget addressDropdownField() {
      return FormBuilderSearchableDropdown<Address>(
        name: 'address2',
        autovalidateMode: AutovalidateMode.onUserInteraction,
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
        initialValue: user?.address,
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
        items: viewModel.placesInAustralia,
        decoration: const InputDecoration(
          labelText: 'Suburb/state/postcode',
          prefixIcon: Icon(
            Icons.location_city_rounded,
          ),
        ),
      );
    }

    Widget heightField() {
      return FormBuilderTextField(
        name: "height",
        autovalidateMode: AutovalidateMode.onUserInteraction,
        initialValue: (user?.profile?.height != null)
            ? user?.profile?.height.toString()
            : null,
        keyboardType: TextInputType.number,
        decoration:
            const InputDecoration(labelText: "Height (cm.)", counterText: ""),
        validator: FormBuilderValidators.compose([
          FormBuilderValidators.maxLength(3),
          FormBuilderValidators.numeric(),
        ]),
      );
    }

    Widget weightField() {
      return FormBuilderTextField(
        name: "weight",
        initialValue: (user?.profile?.weight != null)
            ? user?.profile?.weight.toString()
            : null,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        keyboardType: TextInputType.number,
        decoration:
            const InputDecoration(labelText: "Weight (kg.)", counterText: ""),
        validator: FormBuilderValidators.compose([
          FormBuilderValidators.maxLength(3),
          FormBuilderValidators.numeric(),
        ]),
      );
    }

    Widget shortBio() {
      return FormBuilderTextField(
        name: "short_bio",
        initialValue: user?.profile?.shortBio,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        maxLines: null,
        keyboardType: TextInputType.multiline,
        maxLength: 5000,
        decoration: const InputDecoration(
          labelText: "Short Bio",
        ),
      );
    }

    return Card(
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 15,
          vertical: 25,
        ),
        child: Column(
          children: [
            FormBuilder(
              autoFocusOnValidationFailure: true,
              skipDisabled: true,
              key: viewModel.userProfileFormKey,
              child: StaggeredGrid.count(
                crossAxisCount: isMobile(context) ? 1 : 2,
                mainAxisSpacing: 15,
                crossAxisSpacing: 15,
                children: [
                  StaggeredGridTile.fit(
                    crossAxisCellCount: 2,
                    child: emailField(),
                  ),
                  StaggeredGridTile.fit(
                    crossAxisCellCount: 1,
                    child: firstNameField(),
                  ),
                  StaggeredGridTile.fit(
                    crossAxisCellCount: 1,
                    child: lastNameField(),
                  ),
                  StaggeredGridTile.fit(
                    crossAxisCellCount: 2,
                    child: birthDateField(),
                  ),
                  StaggeredGridTile.fit(
                    crossAxisCellCount: 2,
                    child: phoneField(),
                  ),
                  StaggeredGridTile.fit(
                    crossAxisCellCount: 2,
                    child: genderField(),
                  ),
                  StaggeredGridTile.fit(
                    crossAxisCellCount: 2,
                    child: houseNumberField(),
                  ),
                  StaggeredGridTile.fit(
                    crossAxisCellCount: 2,
                    child: addressDropdownField(),
                  ),
                  if (user?.role == "member")
                    StaggeredGridTile.fit(
                      crossAxisCellCount: 1,
                      child: weightField(),
                    ),
                  if (user?.role == "member")
                    StaggeredGridTile.fit(
                      crossAxisCellCount: 1,
                      child: heightField(),
                    ),
                  if (user?.role == "service_provider")
                    StaggeredGridTile.fit(
                      crossAxisCellCount: 2,
                      child: shortBio(),
                    ),
                  StaggeredGridTile.fit(
                    crossAxisCellCount: 2,
                    child: avatarField(),
                  ),
                  StaggeredGridTile.fit(
                    crossAxisCellCount: 2,
                    child: Row(
                      children: [
                        EzButton.elevated(
                          busy: viewModel
                              .busy(ViewModelBusyKeys.userProfileUpdate),
                          title: "Save",
                          onTap: () async {
                            await viewModel.updateProfile();
                          },
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _ProfileCard extends ViewModelWidget<AppViewModel> {
  const _ProfileCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, AppViewModel viewModel) {
    Widget name() {
      return Text(
        "${viewModel.user?.firstName} ${viewModel.user?.lastName}",
        maxLines: 2,
        overflow: TextOverflow.ellipsis,
        style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
      );
    }

    Widget address() {
      return Text(
        "${viewModel.user?.address?.displaySafe()}",
        maxLines: 2,
        overflow: TextOverflow.ellipsis,
        style: const TextStyle(
          fontSize: 14,
        ),
      );
    }

    return Stack(children: [
      Padding(
        padding: const EdgeInsets.only(top: 60),
        child: SizedBox(
          width: double.infinity,
          child: Card(
            clipBehavior: Clip.antiAlias,
            child: SizedBox(
              child: Column(
                children: [
                  const SizedBox(height: 60),
                  name(),
                  vSpaceTiny,
                  address(),
                  vSpaceRegular,
                ],
              ),
            ),
          ),
        ),
      ),
      Align(
        alignment: Alignment.topCenter,
        child: EzAvatar(
          name: "${viewModel.user?.firstName} ${viewModel.user?.lastName}",
          imgUrl: "${viewModel.user?.profilePic}",
        ),
      ),
    ]);
  }
}
