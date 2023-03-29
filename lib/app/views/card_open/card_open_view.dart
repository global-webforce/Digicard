import 'dart:math';

import 'package:digicard/app/app.locator.dart';
import 'package:digicard/app/extensions/color_extension.dart';
import 'package:digicard/app/models/digital_card.dart';
import 'package:digicard/app/ui/_core/scaffold_body_wrapper.dart';
import 'package:digicard/app/ui/overlays/custom_overlay.dart';
import 'package:digicard/app/ui/widgets/card_components/card_logo.dart';
import 'package:digicard/app/ui/widgets/card_components/card_profile_image.dart';
import 'package:digicard/app/views/card_open/card_open_viewmodel.dart';
import 'package:digicard/app/views/card_open/widgets/card_form.dart';
import 'package:digicard/app/views/card_open/widgets/card_info.dart';
import 'package:digicard/app/views/card_open/widgets/waves.dart';
import 'package:flutter/material.dart';
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
          return ReactiveDigitalCardForm(
            form: viewModel.formModel,
            child: ReactiveValueListenableBuilder<dynamic>(
                formControl: viewModel.formModel.colorControl,
                builder: (context, color, child) {
                  final colorTheme = ColorExtension.fromHex("${color.value}") ??
                      Theme.of(context).colorScheme.primary;

                  if (viewModel.busy(saveBusyKey)) {
                    context.loaderOverlay.show(
                        widget: CustomOverlay(
                      title: "Saving...",
                      color: colorTheme,
                    ));
                  } else if (viewModel.busy(doneBusyKey)) {
                    context.loaderOverlay.show(
                      widget: DoneOverlay(
                        context,
                        title: "Done!",
                        color: colorTheme,
                      ),
                    );
                  } else {
                    context.loaderOverlay.hide();
                  }

                  return Builder(builder: (context) {
                    final formModel = viewModel.formModel;

                    Widget logoImage() {
                      return ReactiveValueListenableBuilder<dynamic>(
                          formControl: formModel.logoImageControl,
                          builder: (context, field, child) {
                            return CardLogo(
                                showOnError: viewModel.editorMode,
                                image: "${field.value}",
                                color: colorTheme,
                                onTap: !viewModel.editorMode
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
                              showOnError: viewModel.editorMode,
                              image: image.value,
                              color: colorTheme,
                              onTap: !viewModel.editorMode
                                  ? null
                                  : () async {
                                      formModel.form.unfocus();
                                      await viewModel.showImagePicker();
                                    },
                            );
                          });
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
                        top: viewModel.editorMode ? false : false,
                        child: Scaffold(
                          extendBodyBehindAppBar: !viewModel.editorMode,
                          appBar: viewModel.editorMode
                              ? AppBar(
                                  leading: const BackButton(),
                                  title: Text(
                                      viewModel.actionType == ActionType.edit ||
                                              viewModel.actionType ==
                                                  ActionType.duplicate
                                          ? "Edit Card"
                                          : "Create Card"),
                                  foregroundColor: Theme.of(context)
                                      .textTheme
                                      .bodyLarge
                                      ?.color,
                                  backgroundColor:
                                      Theme.of(context).scaffoldBackgroundColor,
                                  actions: [
                                    ReactiveDigitalCardFormConsumer(
                                        builder: (context, f, w) {
                                      return ((viewModel.editorMode) &&
                                              viewModel.formModel.form
                                                      .pristine !=
                                                  true)
                                          ? TextButton(
                                              onPressed: () async {
                                                await viewModel.save();
                                              },
                                              child: Text(
                                                "Save",
                                                style: TextStyle(
                                                  fontSize: 16,
                                                  color: Theme.of(context)
                                                      .textTheme
                                                      .bodyLarge
                                                      ?.color,
                                                ),
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
                                  elevation: 0,
                                  backgroundColor: Colors.transparent,
                                  actions: [closeButton()],
                                ),
                          body: LayoutBuilder(builder: (context, size) {
                            return Material(
                              child: ScaffoldBodyWrapper(
                                  isFullWidth: true,
                                  padding: EdgeInsets.symmetric(
                                      vertical: 0,
                                      horizontal:
                                          max((size.maxWidth - 768) / 2, 0) > 0
                                              ? max(
                                                  (size.maxWidth - 768) / 2, 0)
                                              : 0),
                                  builder: (context, size) {
                                    Widget bevel() {
                                      return Stack(
                                        clipBehavior: Clip.hardEdge,
                                        children: [
                                          Align(
                                            alignment: Alignment.bottomCenter,
                                            child: CustomPaint(
                                              size: const Size(
                                                  double.infinity, 90),
                                              painter: Waves(colorTheme),
                                            ),
                                          ),
                                          Align(
                                            alignment: Alignment.bottomCenter,
                                            child: Padding(
                                              padding: const EdgeInsets.only(
                                                  top: 11),
                                              child: CustomPaint(
                                                size: const Size(
                                                    double.infinity, 90),
                                                painter: Waves(
                                                  // Colors.red,
                                                  Theme.of(context).cardColor,
                                                ),
                                              ),
                                            ),
                                          ),
                                          LayoutBuilder(
                                              builder: (context, size) {
                                            return Align(
                                                alignment:
                                                    Alignment.bottomRight,
                                                child: Padding(
                                                  padding:
                                                      const EdgeInsets.fromLTRB(
                                                          20, 35, 15, 0),
                                                  child: Container(
                                                    width:
                                                        (size.maxWidth) * 0.50,
                                                    height: 60,
                                                    color: Colors.red
                                                        .withOpacity(0.0),
                                                    child: logoImage(),
                                                  ),
                                                ));
                                          }),
                                        ],
                                      );
                                    }

                                    return Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        ClipRRect(
                                          clipBehavior: Clip.hardEdge,
                                          child: Stack(
                                            clipBehavior: Clip.hardEdge,
                                            children: [
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                    bottom: 38),
                                                child: profileImage(),
                                              ),
                                              Positioned(
                                                bottom: 0,
                                                left: 0,
                                                right: 0,
                                                child: bevel(),
                                              ),
                                            ],
                                          ),
                                        ),
                                        if (!viewModel.editorMode)
                                          const CardInfo(),
                                        if (viewModel.editorMode)
                                          const CardForm(),
                                      ],
                                    );
                                  }),
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
