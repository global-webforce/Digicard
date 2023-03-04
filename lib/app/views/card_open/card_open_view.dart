import 'package:digicard/app/app.locator.dart';
import 'package:digicard/app/extensions/digital_card_extension.dart';
import 'package:digicard/app/models/digital_card.model.dart';
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
  const CardOpenView({Key? key, required this.card}) : super(key: key);
  final DigitalCard card;

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<CardOpenViewModel>.reactive(
        viewModelBuilder: () => locator<CardOpenViewModel>(),
        disposeViewModel: false,
        onViewModelReady: (viewModel) {},
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

          Widget contentBody() {
            return Padding(
              padding: const EdgeInsets.fromLTRB(15, 15, 15, 15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    card.fullName(),
                    style: const TextStyle(
                        fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                  vSpaceSmall,
                  Text(
                    "${card.title}",
                    style: const TextStyle(
                      fontSize: 16,
                    ),
                  ),
                  vSpaceRegular,
                  InfoItem(
                    padding: EdgeInsets.zero,
                    icon: const Icon(
                      FontAwesomeIcons.solidBuilding,
                    ),
                    title: "${card.company}",
                    titleTextStyle: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: HexColor("${card.color}")),
                  ),
                  vSpaceRegular,
                  InfoItem(
                      padding: EdgeInsets.zero,
                      icon: Padding(
                        padding: const EdgeInsets.only(left: 20, right: 2),
                        child: Container(
                          color: Colors.white,
                          width: 3,
                        ),
                      ),
                      title: "${card.shortBio}"),
                  vSpaceRegular,
                  InfoItem(
                      padding: EdgeInsets.zero,
                      icon: const Icon(
                        FontAwesomeIcons.quoteLeft,
                      ),
                      title: "Goes by ${card.goesBy}"),
                  vSpaceRegular,
                  Card(
                    clipBehavior: Clip.antiAlias,
                    child: ListView(
                      padding: const EdgeInsets.symmetric(vertical: 15),
                      shrinkWrap: true,
                      primary: false,
                      children: [
                        InfoItem(
                          icon: const Icon(FontAwesomeIcons.envelope),
                          title: "${card.email}",
                          onTap: () {
                            final Uri url = Uri(
                              scheme: 'mailto',
                              path: "${card.email}",
                            );

                            launchUrl(url);
                          },
                        ),
                        InfoItem(
                          icon: const Icon(FontAwesomeIcons.locationDot),
                          title: "${card.address}",
                          onTap: () {
                            final Uri url = Uri.parse(
                              "https://www.google.com/maps/search/?api=1&query=${card.address}",
                            );
                            launchUrl(url);
                          },
                        ),
                        InfoItem(
                          icon: const Icon(FontAwesomeIcons.phone),
                          title: "${card.mobileNumber}",
                          onTap: () {
                            final Uri url = Uri(
                              scheme: 'sms',
                              path: "${card.mobileNumber}",
                            );

                            launchUrl(url);
                          },
                        ),
                        InfoItem(
                          icon: const Icon(FontAwesomeIcons.globe),
                          title: "${card.website}",
                          onTap: () {
                            final Uri url = Uri.parse(
                              "${card.website}",
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
          }

          Widget bottomSheet() {
            return Padding(
              padding: const EdgeInsets.fromLTRB(15, 15, 15, 15),
              child: EzButton.elevated(
                background: HexColor("${card.color}"),
                rounded: true,
                leading: Icons.save_rounded,
                title: "Save Contact",
                onLongPress: () {},
              ),
            );
          }

          Widget titleField() {
            return ReactiveTextField(
              onSubmitted: (control) {
                //   viewModel.form.control('goes_by').focus();
              },
              textCapitalization: TextCapitalization.characters,
              textAlign: TextAlign.center,
              showErrors: (control) => false,
              formControlName: 'title',
              textInputAction: TextInputAction.next,
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: "${card.title}",
                counterText: "",
              ),
            );
          }

          Widget prefixField() {
            return ReactiveTextField(
              showErrors: (control) => false,
              formControlName: 'prefix',
              textInputAction: TextInputAction.next,
              decoration: const InputDecoration(
                border: InputBorder.none,
                labelText: "Prefix",
                counterText: "",
              ),
            );
          }

          Widget firstNameField() {
            return ReactiveTextField(
              showErrors: (control) => false,
              formControlName: 'first_name',
              textInputAction: TextInputAction.next,
              decoration: const InputDecoration(
                border: InputBorder.none,
                labelText: "First name",
                counterText: "",
              ),
            );
          }

          Widget middleNameField() {
            return ReactiveTextField(
              showErrors: (control) => false,
              formControlName: 'middle_name',
              textInputAction: TextInputAction.next,
              decoration: const InputDecoration(
                border: InputBorder.none,
                labelText: "Middle name",
                counterText: "",
              ),
            );
          }

          Widget lastNameField() {
            return ReactiveTextField(
              showErrors: (control) => false,
              formControlName: 'last_name',
              textInputAction: TextInputAction.next,
              decoration: const InputDecoration(
                border: InputBorder.none,
                labelText: "Last name",
                counterText: "",
              ),
            );
          }

          Widget suffixField() {
            return ReactiveTextField(
              showErrors: (control) => false,
              formControlName: 'suffix',
              textInputAction: TextInputAction.next,
              decoration: const InputDecoration(
                border: InputBorder.none,
                labelText: "Suffix",
                counterText: "",
              ),
            );
          }

          Widget positionField() {
            return ReactiveTextField(
              showErrors: (control) => false,
              formControlName: 'position',
              textInputAction: TextInputAction.next,
              decoration: const InputDecoration(
                border: InputBorder.none,
                labelText: "Position",
                counterText: "",
              ),
            );
          }

          Widget companyField() {
            return ReactiveTextField(
              showErrors: (control) => false,
              formControlName: 'company',
              textInputAction: TextInputAction.next,
              decoration: const InputDecoration(
                border: InputBorder.none,
                labelText: "Company",
                counterText: "",
              ),
            );
          }

          Widget shortBioField() {
            return ReactiveTextField(
              showErrors: (control) => false,
              formControlName: 'short_bio',
              textInputAction: TextInputAction.next,
              maxLines: null,
              minLines: 2,
              keyboardType: TextInputType.multiline,
              decoration: const InputDecoration(
                border: InputBorder.none,
                alignLabelWithHint: true,
                labelText: "Short Bio",
                hintText: "Tell something about yourself...",
                counterText: "",
              ),
            );
          }

          Widget goesByField() {
            return ReactiveTextField(
              showErrors: (control) => false,
              formControlName: 'goes_by',
              textInputAction: TextInputAction.next,
              decoration: const InputDecoration(
                border: InputBorder.none,
                prefixIcon: Icon(FontAwesomeIcons.quoteRight),
                labelText: "Goes By",
                counterText: "",
              ),
            );
          }

          Widget emailField() {
            return ReactiveTextField(
              showErrors: (control) => false,
              formControlName: 'email',
              textInputAction: TextInputAction.next,
              decoration: const InputDecoration(
                border: InputBorder.none,
                prefixIcon: Icon(FontAwesomeIcons.envelope),
                labelText: "Email",
                counterText: "",
              ),
            );
          }

          Widget addressField() {
            return ReactiveTextField(
              showErrors: (control) => false,
              formControlName: 'address',
              textInputAction: TextInputAction.next,
              maxLines: null,
              minLines: 2,
              keyboardType: TextInputType.multiline,
              decoration: const InputDecoration(
                alignLabelWithHint: true,
                border: InputBorder.none,
                prefixIcon: Icon(FontAwesomeIcons.locationDot),
                labelText: "Address",
                counterText: "",
              ),
            );
          }

          Widget mobileNumberField() {
            return ReactiveTextField(
              showErrors: (control) => false,
              formControlName: 'mobile_number',
              textInputAction: TextInputAction.next,
              decoration: const InputDecoration(
                border: InputBorder.none,
                prefixIcon: Icon(FontAwesomeIcons.phone),
                labelText: "Mobile number",
                counterText: "",
              ),
            );
          }

          Widget websiteField() {
            return ReactiveTextField(
              showErrors: (control) => false,
              formControlName: 'website',
              textInputAction: TextInputAction.next,
              decoration: const InputDecoration(
                  border: InputBorder.none,
                  prefixIcon: Icon(FontAwesomeIcons.globe),
                  labelText: "Website",
                  counterText: "",
                  hintText: "yourwebsite.com"),
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
                      primary: true,
                      padding: const EdgeInsets.fromLTRB(0, 0, 0, 70),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          ReactiveForm(
                              formGroup: viewModel.form, child: titleField()),
                          Stack(
                            clipBehavior: Clip.none,
                            fit: StackFit.loose,
                            key: UniqueKey(),
                            children: [
                              vSpaceRegular,
                              CardProfileImage(
                                imageUrl: card.profileImage,
                                color: card.color != null
                                    ? HexColor("${card.color}")
                                    : Theme.of(context).primaryColor,
                                onTap: () {
                                  viewModel.form.unfocus();
                                  viewModel.showImagePicker();
                                },
                              ),
                              Positioned(
                                  bottom: 30,
                                  right: 0,
                                  child: CardColorPicker(
                                    onTap: () {
                                      viewModel.form.unfocus();

                                      viewModel.showColorPicker();
                                    },
                                  )),
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
                                child: CardLogo(
                                  imageUrl: card.logoImage,
                                  color: card.color != null
                                      ? HexColor("${card.color}")
                                      : Theme.of(context).primaryColor,
                                  onTap: () {
                                    viewModel.form.unfocus();
                                    viewModel.showImagePicker();
                                  },
                                ),
                              ),
                            ],
                          ),
                          contentBody(),
                          ReactiveForm(
                            formGroup: viewModel.form,
                            child: Padding(
                              padding: const EdgeInsets.all(15),
                              child: Column(
                                children: [
                                  ReactiveFormConsumer(
                                      builder: (context, f, w) {
                                    return Collapsible(
                                        onToggle: () {
                                          viewModel.form.unfocus();
                                        },
                                        value: viewModel.fullName,
                                        body: Padding(
                                          padding:
                                              const EdgeInsets.only(left: 30),
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
                                  goesByField(),
                                  vSpaceSmall,
                                  shortBioField(),
                                  vSpaceSmall,
                                  positionField(),
                                  vSpaceSmall,
                                  companyField(),
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
                            ),
                          )
                        ],
                      )),
                )),
          );
        });
  }
}

class Collapsible extends StatefulWidget {
  final String? value;
  final Widget body;
  final Function() onToggle;
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
        GestureDetector(
            child: TextFormField(
          initialValue: widget.value,
          onTap: () {
            setState(() {
              widget.onToggle();

              expanded = !expanded;
              expanded ? _animatedHeight = 310.0 : _animatedHeight = 0.0;
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
                  ? const Icon(Icons.arrow_downward_rounded)
                  : const Icon(Icons.arrow_upward_rounded)),
        )),
        AnimatedSize(
          clipBehavior: Clip.hardEdge,
          duration: const Duration(milliseconds: 300),
          curve: Curves.fastOutSlowIn,
          reverseDuration: const Duration(milliseconds: 300),
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
