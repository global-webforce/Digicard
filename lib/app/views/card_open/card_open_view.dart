import 'package:digicard/app/app.locator.dart';
import 'package:digicard/app/ui/_shared/app_colors.dart';
import 'package:digicard/app/ui/widgets/card_components/card_color_picker.dart';
import 'package:digicard/app/ui/widgets/card_components/card_info.dart';
import 'package:digicard/app/ui/widgets/card_components/card_logo.dart';
import 'package:digicard/app/ui/widgets/card_components/card_profile_image.dart';
import 'package:digicard/app/views/card_open/card_open_viewmodel.dart';
import 'package:ez_core/ez_core.dart';
import 'package:ez_ui/ez_ui.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:reactive_forms/reactive_forms.dart';
import 'package:stacked/stacked.dart';
import 'package:url_launcher/url_launcher.dart';

class CardOpenView extends StatelessWidget {
  final ViewMode viewMode;
  const CardOpenView({Key? key, required this.cardId, required this.viewMode})
      : super(key: key);
  final int cardId;

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<CardOpenViewModel>.reactive(
        viewModelBuilder: () => locator<CardOpenViewModel>(),
        disposeViewModel: false,
        onViewModelReady: (viewModel) {
          viewModel.initForm(id: cardId, viewMode: viewMode);
        },
        builder: (context, viewModel, child) {
          Widget bevel() {
            return Container(
              height: 30,
              decoration: BoxDecoration(
                color: Theme.of(context).scaffoldBackgroundColor,
                borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(30.0),
                    topRight: Radius.circular(30.0)),
              ),
            );
          }

          Widget bottomSheet() {
            return Padding(
              padding: const EdgeInsets.fromLTRB(15, 15, 15, 30),
              child: EzButton.elevated(
                background: HexColor("${viewModel.formVal("color")}"),
                rounded: true,
                leading: Icons.save_rounded,
                title: "Save Contact",
                onLongPress: () {},
              ),
            );
          }

          Widget titleField() {
            return Padding(
              padding: const EdgeInsets.all(0),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(5),
                child: ReactiveTextField(
                  onSubmitted: (control) {
                    viewModel.form.unfocus();
                  },
                  textCapitalization: TextCapitalization.characters,
                  textAlign: TextAlign.center,
                  showErrors: (control) => false,
                  formControlName: 'title',
                  textInputAction: TextInputAction.next,
                  decoration: const InputDecoration(
                      contentPadding:
                          EdgeInsets.symmetric(horizontal: 8, vertical: 10),
                      border: UnderlineInputBorder(),
                      hintText: "TITLE",
                      counterText: "",
                      filled: false),
                ),
              ),
            );
          }

          Widget logoImage() {
            return ReactiveValueListenableBuilder<dynamic>(
                formControlName: 'logo_image',
                builder: (context, value1, child) {
                  return ReactiveValueListenableBuilder<dynamic>(
                      formControlName: 'logo_image_file',
                      builder: (context, value2, child) {
                        return CardLogo(
                            image: value1.value,
                            imageError: value2.value,
                            color: Theme.of(context).scaffoldBackgroundColor,
                            onTap: () async {
                              viewModel.form.unfocus();
                              await viewModel.showLogoPicker();
                            });
                      });
                });
          }

          Widget profileImage() {
            return ReactiveValueListenableBuilder<dynamic>(
                formControlName: 'profile_image',
                builder: (context, value1, child) {
                  return ReactiveValueListenableBuilder<dynamic>(
                      formControlName: 'profile_image_file',
                      builder: (context, value2, child) {
                        return CardProfileImage(
                          image: value1.value,
                          imageError: value2.value,
                          color: Colors.red,
                          onTap: () async {
                            viewModel.form.unfocus();
                            await viewModel.showImagePicker();
                          },
                        );
                      });
                });
          }

          Widget colorPicker() {
            return CardColorPicker(
              onTap: () async {
                viewModel.form.unfocus();
                await viewModel.showColorPicker();
              },
            );
          }

          return SafeArea(
            child: Scaffold(
                appBar: AppBar(
                  automaticallyImplyLeading: false,
                  leading: const BackButton(),
                  actions: [
                    TextButton(onPressed: () {}, child: const Text("SAVE"))
                  ],
                ),
                //  bottomSheet: bottomSheet(),
                body: SizedBox(
                  width: double.infinity,
                  height: double.infinity,
                  child: SingleChildScrollView(
                      physics: const BouncingScrollPhysics(),
                      primary: true,
                      padding: const EdgeInsets.fromLTRB(0, 0, 0, 50),
                      child: ReactiveForm(
                          formGroup: viewModel.form,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              titleField(),
                              Stack(
                                clipBehavior: Clip.none,
                                fit: StackFit.loose,
                                key: UniqueKey(),
                                children: [
                                  profileImage(),
                                  vSpaceRegular,
                                  Positioned(
                                    bottom: 30,
                                    right: 0,
                                    child: colorPicker(),
                                  ),
                                  Positioned(
                                    bottom: 0,
                                    left: 0,
                                    right: 0,
                                    child: bevel(),
                                  ),
                                  Positioned(
                                    top: 0,
                                    left: 0,
                                    right: 0,
                                    child: logoImage(),
                                  ),
                                ],
                              ),
                              const _CardInfo(),
                              const _Form(),
                            ],
                          ))),
                )),
          );
        });
  }
}

class _CardInfo extends StatelessWidget {
  const _CardInfo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final viewModel = getParentViewModel<CardOpenViewModel>(context);
    return ReactiveFormConsumer(builder: (context, v, w) {
      return Padding(
        padding: const EdgeInsets.fromLTRB(15, 30, 15, 15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              viewModel.fullName,
              style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            vSpaceSmall,
            Text(
              viewModel.formVal("title"),
              style: const TextStyle(
                fontSize: 17,
              ),
            ),
            vSpaceRegular,
            InfoItem(
              padding: EdgeInsets.zero,
              icon: const Icon(
                FontAwesomeIcons.solidBuilding,
                size: 17,
              ),
              title: viewModel.formVal("company"),
              titleTextStyle: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            vSpaceRegular,
            InfoItem(
              padding: EdgeInsets.zero,
              icon: Padding(
                padding: const EdgeInsets.only(left: 12, right: 2),
                child: Container(
                  color: Colors.white,
                  width: 3,
                ),
              ),
              title: viewModel.formVal("short_bio"),
            ),
            vSpaceRegular,
            InfoItem(
              padding: EdgeInsets.zero,
              icon: const Icon(
                FontAwesomeIcons.quoteLeft,
                size: 18,
              ),
              title: "Goes By ${viewModel.formVal("goes_by")}",
            ),
            vSpaceRegular,
            Card(
              clipBehavior: Clip.antiAlias,
              child: ListView(
                padding: const EdgeInsets.symmetric(vertical: 8),
                shrinkWrap: true,
                primary: false,
                children: [
                  InfoItem(
                    icon: const Icon(
                      FontAwesomeIcons.envelope,
                      size: 18,
                    ),
                    title: viewModel.formVal("email"),
                    onTap: () {
                      final Uri url = Uri(
                        scheme: 'mailto',
                        path: viewModel.formVal("email"),
                      );

                      launchUrl(url);
                    },
                  ),
                  InfoItem(
                    icon: const Icon(
                      FontAwesomeIcons.locationDot,
                      size: 18,
                    ),
                    title: viewModel.formVal("address"),
                    onTap: () {
                      final Uri url = Uri.parse(
                        "https://www.google.com/maps/search/?api=1&query=${viewModel.formVal("address")}",
                      );
                      launchUrl(url);
                    },
                  ),
                  InfoItem(
                    icon: const Icon(
                      FontAwesomeIcons.phone,
                      size: 18,
                    ),
                    title: viewModel.formVal("mobile_number"),
                    onTap: () {
                      final Uri url = Uri(
                        scheme: 'sms',
                        path: viewModel.formVal("mobile_number"),
                      );

                      launchUrl(url);
                    },
                  ),
                  InfoItem(
                    icon: const Icon(
                      FontAwesomeIcons.globe,
                      size: 18,
                    ),
                    title: viewModel.formVal("website"),
                    onTap: () {
                      final Uri url = Uri.parse(
                        viewModel.formVal("website"),
                      );

                      launchUrl(url);
                    },
                  )
                ],
              ),
            )
          ],
        ),
      );
    });
  }
}

class _Form extends StatelessWidget {
  const _Form({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final viewModel = getParentViewModel<CardOpenViewModel>(context);

    Widget prefixField() {
      return ClipRRect(
        borderRadius: BorderRadius.circular(5),
        child: ReactiveTextField(
          showErrors: (control) => false,
          formControlName: 'prefix',
          textInputAction: TextInputAction.next,
          decoration: const InputDecoration(
            border: InputBorder.none,
            labelText: "Prefix",
            counterText: "",
          ),
        ),
      );
    }

    Widget firstNameField() {
      return ClipRRect(
        borderRadius: BorderRadius.circular(5),
        child: ReactiveTextField(
          showErrors: (control) => false,
          formControlName: 'first_name',
          textInputAction: TextInputAction.next,
          decoration: const InputDecoration(
            border: InputBorder.none,
            labelText: "First name",
            counterText: "",
          ),
        ),
      );
    }

    Widget middleNameField() {
      return ClipRRect(
        borderRadius: BorderRadius.circular(5),
        child: ReactiveTextField(
          showErrors: (control) => false,
          formControlName: 'middle_name',
          textInputAction: TextInputAction.next,
          decoration: const InputDecoration(
            border: InputBorder.none,
            labelText: "Middle name",
            counterText: "",
          ),
        ),
      );
    }

    Widget lastNameField() {
      return ClipRRect(
        borderRadius: BorderRadius.circular(5),
        child: ReactiveTextField(
          showErrors: (control) => false,
          formControlName: 'last_name',
          textInputAction: TextInputAction.next,
          decoration: const InputDecoration(
            border: InputBorder.none,
            labelText: "Last name",
            counterText: "",
          ),
        ),
      );
    }

    Widget suffixField() {
      return ClipRRect(
        borderRadius: BorderRadius.circular(5),
        child: ReactiveTextField(
          showErrors: (control) => false,
          formControlName: 'suffix',
          textInputAction: TextInputAction.next,
          decoration: const InputDecoration(
            border: InputBorder.none,
            labelText: "Suffix",
            counterText: "",
          ),
        ),
      );
    }

    Widget positionField() {
      return ClipRRect(
        borderRadius: BorderRadius.circular(5),
        child: ReactiveTextField(
          showErrors: (control) => false,
          formControlName: 'position',
          textInputAction: TextInputAction.next,
          decoration: const InputDecoration(
            border: InputBorder.none,
            labelText: "Position",
            counterText: "",
          ),
        ),
      );
    }

    Widget companyField() {
      return ClipRRect(
        borderRadius: BorderRadius.circular(5),
        child: ReactiveTextField(
          showErrors: (control) => false,
          formControlName: 'company',
          textInputAction: TextInputAction.next,
          decoration: const InputDecoration(
            border: InputBorder.none,
            labelText: "Company",
            counterText: "",
          ),
        ),
      );
    }

    Widget shortBioField() {
      return ClipRRect(
        borderRadius: BorderRadius.circular(5),
        child: ReactiveTextField(
          showErrors: (control) => false,
          formControlName: 'short_bio',
          textInputAction: TextInputAction.next,
          maxLines: null,
          minLines: 3,
          keyboardType: TextInputType.multiline,
          decoration: const InputDecoration(
            floatingLabelAlignment: FloatingLabelAlignment.start,
            alignLabelWithHint: true,
            border: InputBorder.none,
            labelText: "Short Bio",
            hintText: "Tell something about yourself...",
            counterText: "",
          ),
        ),
      );
    }

    Widget goesByField() {
      return ClipRRect(
        borderRadius: BorderRadius.circular(5),
        child: ReactiveTextField(
          showErrors: (control) => false,
          formControlName: 'goes_by',
          textInputAction: TextInputAction.next,
          decoration: const InputDecoration(
            border: InputBorder.none,
            prefixIcon: Icon(
              FontAwesomeIcons.quoteLeft,
            ),
            labelText: "Goes By",
            counterText: "",
          ),
        ),
      );
    }

    Widget emailField() {
      return ClipRRect(
        borderRadius: BorderRadius.circular(5),
        child: ReactiveTextField(
          showErrors: (control) => false,
          formControlName: 'email',
          textInputAction: TextInputAction.next,
          decoration: const InputDecoration(
            border: InputBorder.none,
            prefixIcon: Icon(FontAwesomeIcons.envelope),
            labelText: "Email",
            counterText: "",
          ),
        ),
      );
    }

    Widget addressField() {
      return ClipRRect(
        borderRadius: BorderRadius.circular(5),
        child: ReactiveTextField(
          showErrors: (control) => false,
          formControlName: 'address',
          textInputAction: TextInputAction.next,
          maxLines: null,
          keyboardType: TextInputType.multiline,
          decoration: const InputDecoration(
            prefixIcon: Icon(
              FontAwesomeIcons.locationDot,
            ),
            border: InputBorder.none,
            labelText: "Address",
            counterText: "",
          ),
        ),
      );
    }

    Widget mobileNumberField() {
      return ClipRRect(
        borderRadius: BorderRadius.circular(5),
        child: ReactiveTextField(
          showErrors: (control) => false,
          formControlName: 'mobile_number',
          textInputAction: TextInputAction.next,
          decoration: const InputDecoration(
            border: InputBorder.none,
            prefixIcon: Icon(FontAwesomeIcons.phone),
            labelText: "Mobile number",
            counterText: "",
          ),
        ),
      );
    }

    Widget websiteField() {
      return ClipRRect(
        borderRadius: BorderRadius.circular(5),
        child: ReactiveTextField(
          showErrors: (control) => false,
          formControlName: 'website',
          textInputAction: TextInputAction.next,
          decoration: const InputDecoration(
              border: InputBorder.none,
              prefixIcon: Icon(FontAwesomeIcons.globe),
              labelText: "Website",
              counterText: "",
              hintText: "yourwebsite.com"),
        ),
      );
    }

    return Padding(
      padding: const EdgeInsets.fromLTRB(15, 15, 15, 15),
      child: Column(
        children: [
          ReactiveFormConsumer(builder: (context, f, w) {
            return Collapsible(
                onToggle: (expanded) {
                  viewModel.form.unfocus();
                },
                value: viewModel.fullName,
                body: Padding(
                  padding: const EdgeInsets.only(left: 30),
                  child: Column(
                    children: [
                      vSpaceSmall,
                      prefixField(),
                      vSpaceSmall,
                      firstNameField(),
                      vSpaceSmall,
                      middleNameField(),
                      vSpaceSmall,
                      lastNameField(),
                      vSpaceSmall,
                      suffixField(),
                    ],
                  ),
                ));
          }),
          vSpaceSmall,
          positionField(),
          vSpaceSmall,
          companyField(),
          vSpaceSmall,
          shortBioField(),
          vSpaceSmall,
          goesByField(),
          vSpaceSmall,
          emailField(),
          vSpaceSmall,
          addressField(),
          vSpaceSmall,
          mobileNumberField(),
          vSpaceSmall,
          websiteField(),
        ],
      ),
    );
  }
}

class Collapsible extends StatefulWidget {
  final String? value;
  final Widget body;
  final Function(bool expanded) onToggle;
  const Collapsible(
      {Key? key, required this.body, this.value, required this.onToggle})
      : super(key: key);

  @override
  State<Collapsible> createState() => _CollapsibleState();
}

class _CollapsibleState extends State<Collapsible> {
  double _animatedHeight = 0;
  bool expanded = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(5),
          child: GestureDetector(
              child: TextFormField(
            initialValue: widget.value,
            onTap: () {
              setState(() {
                expanded = !expanded;
                expanded ? _animatedHeight = 310.0 : _animatedHeight = 0.0;
                widget.onToggle(expanded);
              });
            },
            key: UniqueKey(),
            readOnly: true,
            enableInteractiveSelection: true,
            decoration: InputDecoration(
                border: InputBorder.none,
                labelText: "Full name",
                hintText: 'Full name',
                suffixIcon: expanded
                    ? const Icon(
                        Icons.arrow_drop_down_rounded,
                        size: 28,
                      )
                    : const Icon(
                        Icons.arrow_drop_up_rounded,
                        size: 28,
                      )),
          )),
        ),
        AnimatedSize(
          clipBehavior: Clip.hardEdge,
          duration: const Duration(milliseconds: 250),
          curve: Curves.linear,
          reverseDuration: const Duration(milliseconds: 250),
          child: !expanded
              ? const SizedBox(
                  width: double.infinity,
                )
              : SizedBox(height: _animatedHeight, child: widget.body),
        ),
      ],
    );
  }
}
