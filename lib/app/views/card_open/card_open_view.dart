import 'package:digicard/app/app.locator.dart';
import 'package:digicard/app/extensions/color.dart';
import 'package:digicard/app/models/digital_card.dart';
import 'package:digicard/app/ui/overlays/custom_overlay.dart';
import 'package:digicard/app/ui/widgets/card_components/card_color_picker.dart';
import 'package:digicard/app/ui/widgets/card_components/card_info.dart';
import 'package:digicard/app/ui/widgets/card_components/card_logo.dart';
import 'package:digicard/app/ui/widgets/card_components/card_profile_image.dart';
import 'package:digicard/app/views/card_open/card_open_viewmodel.dart';
import 'package:ez_core/ez_core.dart';
import 'package:ez_ui/ez_ui.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:loader_overlay/loader_overlay.dart';
import 'package:reactive_forms/reactive_forms.dart';
import 'package:stacked/stacked.dart';
import 'package:url_launcher/url_launcher.dart';

class CardOpenView extends StatelessWidget {
  final DigitalCard card;
  final ActionType actionType;
  const CardOpenView({Key? key, required this.card, required this.actionType})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<CardOpenViewModel>.reactive(
        viewModelBuilder: () => locator<CardOpenViewModel>(),
        disposeViewModel: false,
        onDispose: (model) {
          model.formModel.form.dispose();
        },
        onViewModelReady: (model) => model.initialize(card, actionType),
        builder: (context, viewModel, child) {
          if (viewModel.busy(saveBusyKey)) {
            context.loaderOverlay
                .show(widget: const CustomOverlay(title: "Saving..."));
          } else {
            context.loaderOverlay.hide();
          }

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

          return ReactiveDigitalCardForm(
            form: viewModel.formModel,
            child: Builder(builder: (context) {
              final formModel = viewModel.formModel;
              Widget bottomSheet() {
                return Padding(
                  padding: const EdgeInsets.fromLTRB(15, 15, 15, 30),
                  child: EzButton.elevated(
                    background:
                        HexColor.fromHex("${formModel.colorControl?.value}"),
                    rounded: true,
                    leading: Icons.save_rounded,
                    title: "Save Contact",
                    onLongPress: () {},
                  ),
                );
              }

              Widget logoImage() {
                return ReactiveValueListenableBuilder<dynamic>(
                    formControl: formModel.logoImageControl,
                    builder: (context, field, child) {
                      return CardLogo(
                          showOnError: viewModel.actionType == ActionType.view
                              ? false
                              : true,
                          image: field.value,
                          color: Theme.of(context).scaffoldBackgroundColor,
                          onTap: (viewModel.actionType == ActionType.view)
                              ? null
                              : () async {
                                  formModel.form.unfocus();
                                  await viewModel.showLogoPicker();
                                });
                    });
              }

              Widget profileImage() {
                return ReactiveValueListenableBuilder<dynamic>(
                    formControl: formModel.colorControl,
                    builder: (context, color, child) {
                      return ReactiveValueListenableBuilder<dynamic>(
                          formControl: formModel.profileImageControl,
                          builder: (context, image, child) {
                            return CardProfileImage(
                              showOnError:
                                  viewModel.actionType == ActionType.view
                                      ? false
                                      : true,
                              image: image.value,
                              color: HexColor.fromHex("${color.value}") ??
                                  Theme.of(context).colorScheme.primary,
                              onTap: (viewModel.actionType == ActionType.view)
                                  ? null
                                  : () async {
                                      formModel.form.unfocus();
                                      await viewModel.showImagePicker();
                                    },
                            );
                          });
                    });
              }

              Widget colorPicker() {
                return ReactiveValueListenableBuilder<dynamic>(
                    formControl: formModel.colorControl,
                    builder: (context, field, child) {
                      return CardColorPicker(
                        onTap: () async {
                          formModel.form.unfocus();
                          await viewModel.showColorPicker(
                              HexColor.fromHex("${field.value}") ??
                                  Theme.of(context).scaffoldBackgroundColor);
                        },
                      );
                    });
              }

              return WillPopScope(
                onWillPop: () async {
                  if (!viewModel.formModel.form.pristine) {
                    return await viewModel
                        .confirmExit()
                        .then((value) => value!.confirmed);
                  }

                  return Future.value(true);
                },
                child: Material(
                  color: Theme.of(context).scaffoldBackgroundColor,
                  child: SafeArea(
                    top: ((viewModel.actionType == ActionType.edit) ||
                            (viewModel.actionType == ActionType.create))
                        ? false
                        : true,
                    child: Scaffold(
                      extendBodyBehindAppBar:
                          viewModel.actionType == ActionType.view,
                      appBar: viewModel.actionType == ActionType.edit ||
                              viewModel.actionType == ActionType.create
                          ? AppBar(
                              leading: const BackButton(),
                              title: Text(
                                  viewModel.actionType == ActionType.edit
                                      ? "Edit Card"
                                      : "Create Card"),
                              elevation: 0,
                              backgroundColor: null,
                              actions: [
                                ReactiveDigitalCardFormConsumer(
                                    builder: (context, f, w) {
                                  return (((viewModel.actionType ==
                                                  ActionType.edit) ||
                                              (viewModel.actionType ==
                                                  ActionType.create)) &&
                                          viewModel.formModel.form.pristine !=
                                              true)
                                      ? TextButton(
                                          onPressed: () async {
                                            await viewModel.save();
                                          },
                                          child: const Text(
                                            "Save",
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 16),
                                          ))
                                      : const SizedBox.shrink();
                                }),
                              ],
                            )
                          : AppBar(
                              leadingWidth: 15,
                              toolbarHeight: 60,
                              centerTitle: true,
                              titleSpacing: 0,
                              automaticallyImplyLeading: false,
                              title: Stack(
                                children: [
                                  logoImage(),
                                  Align(
                                    alignment: Alignment.centerRight,
                                    child: Padding(
                                      padding: const EdgeInsets.fromLTRB(
                                          0, 10, 8, 10),
                                      child: Container(
                                        decoration: BoxDecoration(
                                            shape: BoxShape.circle,
                                            color: Theme.of(context)
                                                .scaffoldBackgroundColor
                                                .withOpacity(0.6)),
                                        child: InkWell(
                                          customBorder: const CircleBorder(),
                                          onTap: () =>
                                              Navigator.maybePop(context),
                                          child: const Padding(
                                            padding: EdgeInsets.all(6),
                                            child: Icon(Icons.close_rounded,
                                                color: Colors.black),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              elevation: 0,
                              backgroundColor: Colors.transparent,
                            ),
                      //  bottomSheet: bottomSheet(),

                      body: Builder(builder: (context) {
                        return SizedBox(
                          width: double.infinity,
                          height: double.infinity,
                          child: SingleChildScrollView(
                            //  physics: const BouncingScrollPhysics(),
                            primary: true,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                /*   if (viewModel.actionType != ActionType.view)
                                      titleField(), */
                                Stack(
                                  children: [
                                    profileImage(),
                                    if (viewModel.actionType != ActionType.view)
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
                                    viewModel.actionType == ActionType.edit ||
                                            viewModel.actionType ==
                                                ActionType.create
                                        ? Positioned(
                                            top: 0,
                                            left: 0,
                                            right: 0,
                                            child: logoImage(),
                                          )
                                        : const SizedBox.shrink(),
                                  ],
                                ),
                                if (viewModel.actionType == ActionType.view)
                                  const _CardInfo(),
                                if (viewModel.actionType != ActionType.view)
                                  const _Form(),
                              ],
                            ),
                          ),
                        );
                      }),
                    ),
                  ),
                ),
              );
            }),
          );
        });
  }
}

class _CardInfo extends StatelessWidget {
  const _CardInfo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final form = ReactiveDigitalCardForm.of(context, listen: true);

    return ReactiveDigitalCardFormConsumer(builder: (context, v, w) {
      return Padding(
        padding: const EdgeInsets.fromLTRB(20, 10, 20, 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "${form?.prefixControl?.value ?? ""} ${form?.firstNameControl?.value ?? ""} ${form?.middleNameControl?.value ?? ""} ${form?.lastNameControl?.value ?? ""} ${form?.suffixControl?.value ?? ""}"
                  .trim(),
              style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            vSpaceSmall,
            Text(
              "${form?.titleControl?.value}",
              style: const TextStyle(
                fontSize: 16,
              ),
            ),
            vSpaceRegular,
            ReactiveValueListenableBuilder<dynamic>(
                formControl: form?.colorControl,
                builder: (context, field, child) {
                  return InfoItem(
                    padding: EdgeInsets.zero,
                    icon: const Icon(
                      FontAwesomeIcons.solidBuilding,
                      size: 17,
                    ),
                    title: "${form?.companyControl?.value}",
                    titleTextStyle: TextStyle(
                      color: HexColor.fromHex("${form?.colorControl?.value}"),
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  );
                }),
            vSpaceRegular,
            InfoItem(
              padding: EdgeInsets.zero,
              icon: Padding(
                padding: const EdgeInsets.only(left: 12, right: 2),
                child: Container(
                  color: HexColor.fromHex("${form?.colorControl?.value}"),
                  width: 3,
                ),
              ),
              title: "${form?.shortBioControl?.value}",
            ),
            vSpaceRegular,
            InfoItem(
              padding: EdgeInsets.zero,
              icon: const Icon(
                FontAwesomeIcons.quoteLeft,
                size: 18,
              ),
              title: "Goes By ${form?.goesByControl?.value}",
            ),
            vSpaceRegular,
            Card(
              color: HexColor.fromHex("${form?.colorControl?.value}")
                  ?.withOpacity(0.2),
              elevation: 0,
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
                    title: "${form?.emailControl?.value}",
                    onTap: () {
                      final Uri url = Uri(
                        scheme: 'mailto',
                        path: "${form?.emailControl?.value}",
                      );

                      launchUrl(url);
                    },
                  ),
                  InfoItem(
                    icon: const Icon(
                      FontAwesomeIcons.locationDot,
                      size: 18,
                    ),
                    title: "${form?.addressControl?.value}",
                    onTap: () {
                      final Uri url = Uri.parse(
                        "https://www.google.com/maps/search/?api=1&query=${form?.addressControl?.value}",
                      );
                      launchUrl(url);
                    },
                  ),
                  InfoItem(
                    icon: const Icon(
                      FontAwesomeIcons.phone,
                      size: 18,
                    ),
                    title: "${form?.mobileNumberControl?.value}",
                    onTap: () {
                      final Uri url = Uri(
                        scheme: 'sms',
                        path: "${form?.mobileNumberControl?.value}",
                      );

                      launchUrl(url);
                    },
                  ),
                  InfoItem(
                    icon: const Icon(
                      FontAwesomeIcons.globe,
                      size: 18,
                    ),
                    title: "${form?.websiteControl?.value}",
                    onTap: () {
                      final Uri url = Uri.parse(
                        "${form?.websiteControl?.value}",
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
    final form = ReactiveDigitalCardForm.of(context);

    Widget titleField() {
      return ClipRRect(
        borderRadius: BorderRadius.circular(5),
        child: ReactiveTextField(
          showErrors: (control) => false,
          formControl: form?.titleControl,
          textInputAction: TextInputAction.next,
          decoration: const InputDecoration(
            border: InputBorder.none,
            labelText: "Title",
            counterText: "",
          ),
        ),
      );
    }

    Widget prefixField() {
      return ClipRRect(
        borderRadius: BorderRadius.circular(5),
        child: ReactiveTextField(
          showErrors: (control) => false,
          formControl: form?.prefixControl,
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
          formControl: form?.firstNameControl,
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
          formControl: form?.middleNameControl,
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
          formControl: form?.lastNameControl,
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
          formControl: form?.suffixControl,
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
          formControl: form?.positionControl,
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
          formControl: form?.companyControl,
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
          formControl: form?.shortBioControl,
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
          formControl: form?.goesByControl,
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
          formControl: form?.emailControl,
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
          formControl: form?.addressControl,
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
          formControl: form?.mobileNumberControl,
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
          formControl: form?.websiteControl,
          textInputAction: TextInputAction.done,
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
          titleField(),
          vSpaceSmall,
          ReactiveDigitalCardFormConsumer(builder: (context, f, w) {
            return Collapsible(
                onToggle: (expanded) {},
                value:
                    "${form?.prefixControl?.value ?? ""} ${form?.firstNameControl?.value ?? ""} ${form?.middleNameControl?.value ?? ""} ${form?.lastNameControl?.value ?? ""} ${form?.suffixControl?.value ?? ""}"
                        .trim(),
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
  double animatedHeight = 0;
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
                expanded ? animatedHeight = 310.0 : animatedHeight = 0.0;
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
              : SizedBox(height: animatedHeight, child: widget.body),
        ),
      ],
    );
  }
}
