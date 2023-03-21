import 'package:digicard/app/app.locator.dart';
import 'package:digicard/app/extensions/color.dart';
import 'package:digicard/app/models/digital_card.dart';
import 'package:digicard/app/ui/overlays/custom_overlay.dart';
import 'package:digicard/app/ui/widgets/card_components/card_color_picker.dart';
import 'package:digicard/app/ui/widgets/card_components/card_info.dart';
import 'package:digicard/app/ui/widgets/card_components/card_logo.dart';
import 'package:digicard/app/ui/widgets/card_components/card_profile_image.dart';
import 'package:digicard/app/ui/widgets/card_components/collapsible.dart';
import 'package:digicard/app/views/card_open/card_open_viewmodel.dart';
import 'package:ez_core/ez_core.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:loader_overlay/loader_overlay.dart';
import 'package:reactive_forms/reactive_forms.dart';
import 'package:stacked/stacked.dart';

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

          return ReactiveDigitalCardForm(
            form: viewModel.formModel,
            child: ReactiveValueListenableBuilder<dynamic>(
                formControl: viewModel.formModel.colorControl,
                builder: (context, color, child) {
                  final colorTheme = HexColor.fromHex("${color.value}") ??
                      Theme.of(context).colorScheme.primary;
                  return Builder(builder: (context) {
                    final formModel = viewModel.formModel;

                    Widget bevel() {
                      return SizedBox(
                        height: 70,
                        child: Stack(
                          children: [
                            Align(
                              alignment: Alignment.topCenter,
                              child: CustomPaint(
                                size: const Size(double.infinity, 60),
                                painter: Wave(colorTheme),
                              ),
                            ),
                            Align(
                              alignment: Alignment.bottomCenter,
                              child: CustomPaint(
                                size: const Size(double.infinity, 60),
                                painter: Wave(Theme.of(context).cardColor),
                              ),
                            ),
                          ],
                        ),
                      );
                    }

                    Widget logoImage() {
                      return ReactiveValueListenableBuilder<dynamic>(
                          formControl: formModel.logoImageControl,
                          builder: (context, field, child) {
                            return CardLogo(
                                showOnError:
                                    viewModel.actionType == ActionType.view
                                        ? false
                                        : true,
                                image: field.value,
                                color: colorTheme,
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
                          formControl: formModel.profileImageControl,
                          builder: (context, image, child) {
                            return CardProfileImage(
                              heroTag: "card-${card.id}}",
                              showOnError:
                                  viewModel.actionType == ActionType.view
                                      ? false
                                      : true,
                              image: image.value,
                              color: colorTheme,
                              onTap: (viewModel.actionType == ActionType.view)
                                  ? null
                                  : () async {
                                      formModel.form.unfocus();
                                      await viewModel.showImagePicker();
                                    },
                            );
                          });
                    }

                    Widget colorPicker() {
                      return CardColorPicker(
                        onTap: () async {
                          formModel.form.unfocus();
                          await viewModel.showColorPicker(colorTheme);
                        },
                      );
                    }

                    Widget closeButton() {
                      return Padding(
                        padding: const EdgeInsets.fromLTRB(0, 10, 8, 10),
                        child: Container(
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: colorTheme.darken().withOpacity(0.8)),
                          child: InkWell(
                            customBorder: const CircleBorder(),
                            onTap: () => Navigator.maybePop(context),
                            child: Padding(
                              padding: const EdgeInsets.all(6),
                              child: Icon(Icons.close_rounded,
                                  color:
                                      Theme.of(context).colorScheme.onPrimary),
                            ),
                          ),
                        ),
                      );
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
                      child: SafeArea(
                        top: ((viewModel.actionType == ActionType.edit) ||
                                (viewModel.actionType == ActionType.create))
                            ? false
                            : false,
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
                                              viewModel.formModel.form
                                                      .pristine !=
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
                                        child: closeButton(),
                                      ),
                                    ],
                                  ),
                                  elevation: 0,
                                  backgroundColor: Colors.transparent,
                                ),
                          body: Builder(builder: (context) {
                            return SizedBox(
                              width: double.infinity,
                              height: double.infinity,
                              child: SingleChildScrollView(
                                primary: true,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Stack(
                                      children: [
                                        Material(child: profileImage()),
                                        if (viewModel.actionType !=
                                            ActionType.view)
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
                                        viewModel.actionType ==
                                                    ActionType.edit ||
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
                    );
                  });
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
    final colorTheme = HexColor.fromHex("${form?.colorControl?.value}") ??
        Theme.of(context).colorScheme.primary;

    return ReactiveDigitalCardFormConsumer(builder: (context, v, w) {
      return LayoutBuilder(builder: (context, c) {
        return Container(
          color: Theme.of(context).cardColor,
          child: Padding(
            padding: const EdgeInsets.fromLTRB(20, 10, 20, 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "${form?.fullnameForm.prefixControl?.value ?? ""} ${form?.fullnameForm.firstNameControl?.value ?? ""} ${form?.fullnameForm.middleNameControl?.value ?? ""} ${form?.fullnameForm.lastNameControl?.value ?? ""} ${form?.fullnameForm.suffixControl?.value ?? ""}"
                      .trim(),
                  style: const TextStyle(
                      fontSize: 22, fontWeight: FontWeight.bold),
                ),
                vSpaceSmall,
                Text(
                  "${form?.positionControl?.value}",
                  style: const TextStyle(
                    fontSize: 18,
                  ),
                ),
                vSpaceSmall,
                Text(
                  "${form?.departmentControl?.value}",
                  style: const TextStyle(
                    fontSize: 16,
                  ),
                ),
                vSpaceRegular,
                InfoItem(
                  padding: EdgeInsets.zero,
                  icon: const Icon(
                    FontAwesomeIcons.solidBuilding,
                    size: 17,
                  ),
                  title: "${form?.companyControl?.value}",
                  titleTextStyle: TextStyle(
                      color: colorTheme,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      fontStyle: FontStyle.italic),
                ),
                vSpaceRegular,
                InfoItem(
                  padding: EdgeInsets.zero,
                  icon: Padding(
                    padding: const EdgeInsets.only(left: 12, right: 2),
                    child: Container(
                      color: colorTheme,
                      width: 3,
                    ),
                  ),
                  title: "${form?.headlineControl?.value}",
                ),
                vSpaceRegular,
                InfoItem(
                  padding: EdgeInsets.zero,
                  icon: const Icon(
                    FontAwesomeIcons.message,
                    size: 18,
                  ),
                  title:
                      "Goes By \"${form?.fullnameForm.preferredNameControl?.value}\" (${form?.fullnameForm.pronounsControl?.value})",
                ),
                vSpaceRegular,
                Card(
                  color: colorTheme.withOpacity(0.4),
                  elevation: 0,
                  clipBehavior: Clip.antiAlias,
                  child: ListView(
                      padding: const EdgeInsets.symmetric(vertical: 8),
                      shrinkWrap: true,
                      primary: false,
                      children: [
                        ReactiveFormArray<Map<String, Object?>>(
                          formArray: form?.customLinksControl,
                          builder: (context, formArray, child) {
                            return Padding(
                              padding: const EdgeInsets.all(15.0),
                              child: Wrap(
                                  spacing: 15,
                                  runSpacing: 15,
                                  children: formArray.value != null
                                      ? formArray.value!
                                          .asMap()
                                          .entries
                                          .map((menu) {
                                          return Row(
                                            children: [
                                              const Icon(
                                                FontAwesomeIcons.link,
                                                size: 20,
                                              ),
                                              hSpaceRegular,
                                              Expanded(
                                                  child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                mainAxisAlignment:
                                                    MainAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    "${menu.value?["text"]}",
                                                    style: const TextStyle(
                                                        fontSize: 16),
                                                  ),
                                                  Text(
                                                    "${menu.value?["label"]}",
                                                    style: const TextStyle(
                                                        fontSize: 14),
                                                  ),
                                                ],
                                              ))
                                            ],
                                          );
                                        }).toList()
                                      : []),
                            );
                          },
                        ),
                      ]),
                )
              ],
            ),
          ),
        );
      });
    });
  }
}

class _Form extends StatelessWidget {
  const _Form({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final form = ReactiveDigitalCardForm.of(
      context,
    );

    final viewModel = getParentViewModel<CardOpenViewModel>(context);

    const inputStyle = InputDecoration(
        alignLabelWithHint: true,
        filled: false,
        fillColor: Colors.transparent,
        border: UnderlineInputBorder(),
        enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.grey),
        ),
        floatingLabelBehavior: FloatingLabelBehavior.always);
    Widget titleField() {
      return ClipRRect(
        borderRadius: BorderRadius.circular(5),
        child: ReactiveTextField(
          showErrors: (control) => false,
          formControl: form?.titleControl,
          textInputAction: TextInputAction.next,
          decoration: inputStyle.copyWith(label: const Text("TITLE")),
        ),
      );
    }

    Widget prefixField() {
      return ClipRRect(
        borderRadius: BorderRadius.circular(5),
        child: ReactiveTextField(
          showErrors: (control) => false,
          formControl: form?.fullnameForm.prefixControl,
          textInputAction: TextInputAction.next,
          decoration: inputStyle.copyWith(label: const Text("Prefix")),
        ),
      );
    }

    Widget firstNameField() {
      return ClipRRect(
        borderRadius: BorderRadius.circular(5),
        child: ReactiveTextField(
          showErrors: (control) => false,
          formControl: form?.fullnameForm.firstNameControl,
          textInputAction: TextInputAction.next,
          decoration: inputStyle.copyWith(label: const Text("First name")),
        ),
      );
    }

    Widget middleNameField() {
      return ClipRRect(
        borderRadius: BorderRadius.circular(5),
        child: ReactiveTextField(
          showErrors: (control) => false,
          formControl: form?.fullnameForm.middleNameControl,
          textInputAction: TextInputAction.next,
          decoration: inputStyle.copyWith(label: const Text("Middle name")),
        ),
      );
    }

    Widget lastNameField() {
      return ClipRRect(
        borderRadius: BorderRadius.circular(5),
        child: ReactiveTextField(
          showErrors: (control) => false,
          formControl: form?.fullnameForm.lastNameControl,
          textInputAction: TextInputAction.next,
          decoration: inputStyle.copyWith(label: const Text("Last name")),
        ),
      );
    }

    Widget suffixField() {
      return ClipRRect(
        borderRadius: BorderRadius.circular(5),
        child: ReactiveTextField(
          showErrors: (control) => false,
          formControl: form?.fullnameForm.suffixControl,
          textInputAction: TextInputAction.next,
          decoration: inputStyle.copyWith(label: const Text("Suffix")),
        ),
      );
    }

    Widget accrediationsField() {
      return ClipRRect(
        borderRadius: BorderRadius.circular(5),
        child: ReactiveTextField(
          showErrors: (control) => false,
          formControl: form?.fullnameForm.accreditationsControl,
          textInputAction: TextInputAction.next,
          decoration: inputStyle.copyWith(label: const Text("Accreditations")),
        ),
      );
    }

    Widget preferredNameField() {
      return ClipRRect(
        borderRadius: BorderRadius.circular(5),
        child: ReactiveTextField(
          showErrors: (control) => false,
          formControl: form?.fullnameForm.preferredNameControl,
          textInputAction: TextInputAction.next,
          decoration: inputStyle.copyWith(label: const Text("Preferred Name")),
        ),
      );
    }

    Widget maidenNameField() {
      return ClipRRect(
        borderRadius: BorderRadius.circular(5),
        child: ReactiveTextField(
          showErrors: (control) => false,
          formControl: form?.fullnameForm.maidenNameControl,
          textInputAction: TextInputAction.next,
          decoration: inputStyle.copyWith(label: const Text("Maiden Name")),
        ),
      );
    }

    Widget pronounsField() {
      return ClipRRect(
        borderRadius: BorderRadius.circular(5),
        child: ReactiveTextField(
          showErrors: (control) => false,
          formControl: form?.fullnameForm.pronounsControl,
          textInputAction: TextInputAction.next,
          decoration: inputStyle.copyWith(label: const Text("Pronouns")),
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
          decoration: inputStyle.copyWith(label: const Text("Position")),
        ),
      );
    }

    Widget departmentField() {
      return ClipRRect(
        borderRadius: BorderRadius.circular(5),
        child: ReactiveTextField(
          showErrors: (control) => false,
          formControl: form?.departmentControl,
          textInputAction: TextInputAction.next,
          decoration: inputStyle.copyWith(label: const Text("Department")),
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
          decoration: inputStyle.copyWith(label: const Text("Company")),
        ),
      );
    }

    Widget headlineField() {
      return ClipRRect(
        borderRadius: BorderRadius.circular(5),
        child: ReactiveTextField(
            showErrors: (control) => false,
            formControl: form?.headlineControl,
            textInputAction: TextInputAction.next,
            maxLines: null,
            minLines: 3,
            keyboardType: TextInputType.multiline,
            decoration: inputStyle.copyWith(label: const Text("Headline"))),
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
                onToggle: (expanded) {
                  viewModel.formModel.form.unfocus();
                },
                value:
                    "${form?.fullnameForm.prefixControl?.value ?? ""} ${form?.fullnameForm.firstNameControl?.value ?? ""} ${form?.fullnameForm.middleNameControl?.value ?? ""} ${form?.fullnameForm.lastNameControl?.value ?? ""} ${form?.fullnameForm.suffixControl?.value ?? ""}"
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
                      vSpaceSmall,
                      accrediationsField(),
                      vSpaceSmall,
                      preferredNameField(),
                      vSpaceSmall,
                      maidenNameField(),
                      vSpaceSmall,
                      pronounsField(),
                    ],
                  ),
                ));
          }),
          vSpaceSmall,
          positionField(),
          vSpaceSmall,
          departmentField(),
          vSpaceSmall,
          companyField(),
          vSpaceSmall,
          headlineField(),
          vSpaceRegular,
          ReactiveFormArray<Map<String, Object?>>(
            formArray: form?.customLinksControl,
            builder: (context, formArray, child) {
              return Wrap(
                  spacing: 15,
                  runSpacing: 15,
                  children: formArray.value != null
                      ? formArray.value!.asMap().entries.map((menu) {
                          return Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Padding(
                                padding: EdgeInsets.only(top: 20),
                                child: Icon(FontAwesomeIcons.link, size: 20),
                              ),
                              hSpaceRegular,
                              Expanded(
                                child: Column(
                                  children: [
                                    ReactiveTextField<String>(
                                      formControlName: '${menu.key}.text',
                                      decoration: const InputDecoration(
                                          alignLabelWithHint: true,
                                          filled: false,
                                          fillColor: Colors.transparent,
                                          border: UnderlineInputBorder(),
                                          enabledBorder: UnderlineInputBorder(
                                            borderSide:
                                                BorderSide(color: Colors.grey),
                                          ),
                                          labelText: 'Link',
                                          floatingLabelBehavior:
                                              FloatingLabelBehavior.always),
                                    ),
                                    ReactiveTextField<String>(
                                      formControlName: '${menu.key}.label',
                                      decoration: const InputDecoration(
                                          alignLabelWithHint: true,
                                          filled: false,
                                          fillColor: Colors.transparent,
                                          border: UnderlineInputBorder(),
                                          enabledBorder: UnderlineInputBorder(
                                            borderSide:
                                                BorderSide(color: Colors.grey),
                                          ),
                                          labelText: 'Label',
                                          floatingLabelBehavior:
                                              FloatingLabelBehavior.always),
                                    ),
                                    ReactiveTextField<String>(
                                      formControlName: '${menu.key}.type',
                                      decoration: const InputDecoration(
                                          alignLabelWithHint: true,
                                          filled: false,
                                          fillColor: Colors.transparent,
                                          border: UnderlineInputBorder(),
                                          enabledBorder: UnderlineInputBorder(
                                            borderSide:
                                                BorderSide(color: Colors.grey),
                                          ),
                                          labelText: 'Type',
                                          floatingLabelBehavior:
                                              FloatingLabelBehavior.always),
                                    ),
                                  ],
                                ),
                              ),
                              hSpaceRegular,
                              Padding(
                                  padding: const EdgeInsets.only(top: 20),
                                  child: InkWell(
                                      onTap: () {
                                        viewModel.addNew();
                                        form?.form
                                            .markAsDirty(updateParent: true);
                                      },
                                      child: const Icon(Icons.close_rounded))),
                            ],
                          );
                        }).toList()
                      : []);
            },
          ),
        ],
      ),
    );
  }
}

class Wave extends CustomPainter {
  final Color color;
  Path path0 = Path();

  Wave(this.color);
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint0 = Paint()
      ..color = color
      ..style = PaintingStyle.fill
      ..strokeWidth = 10.0;

    Path path0 = Path();
    path0.moveTo(size.width * -0.0157436, size.height * 0.4346154);
    path0.quadraticBezierTo(size.width * 0.2432308, size.height * 1.1865385,
        size.width * 0.4970769, size.height * 0.4423077);
    path0.quadraticBezierTo(size.width * 0.7381026, size.height * -0.3346154,
        size.width * 1.0098974, size.height * 0.4423077);
    path0.lineTo(size.width, size.height);
    path0.lineTo(0, size.height);

    canvas.drawPath(path0, paint0);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }

  @override
  bool hitTest(Offset position) {
    bool hit = path0.contains(position);
    return hit;
  }
}
