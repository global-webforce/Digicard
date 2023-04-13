import 'dart:math';

import 'package:digicard/app/app.locator.dart';
import 'package:digicard/app/models/digital_card.dart';
import 'package:digicard/app/ui/_core/scaffold_body_wrapper.dart';
import 'package:digicard/app/ui/overlays/custom_overlay.dart';
import 'package:digicard/app/views/card_open/widgets/2_card_profile_image.dart';
import 'package:digicard/app/views/card_open/card_open_viewmodel.dart';
import 'package:digicard/app/views/card_open/widgets/5_card_divider.dart';
import 'package:digicard/app/views/card_open/widgets/edit/card_form.dart';
import 'package:digicard/app/views/card_open/widgets/preview/card_info.dart';
import 'package:flutter/material.dart';
import 'package:loader_overlay/loader_overlay.dart';
import 'package:reactive_forms/reactive_forms.dart';
import 'package:stacked/stacked.dart';

import 'widgets/1_card_appbar.dart';

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
          model.formModel.reset();
          model.formModel.form.dispose();
        },
        onViewModelReady: (model) => model.initialize(card, actionType),
        builder: (context, viewModel, child) {
          return ReactiveDigitalCardForm(
            form: viewModel.formModel,
            child: ReactiveValueListenableBuilder<dynamic>(
                formControl: viewModel.formModel.colorControl,
                builder: (context, color, child) {
                  final colorTheme = color.value != null
                      ? Color(color.value)
                      : Theme.of(context).colorScheme.primary;

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

                    Widget avatarUrl() {
                      return ReactiveValueListenableBuilder<dynamic>(
                          formControl: formModel.avatarUrlControl,
                          builder: (context, image, child) {
                            return CardProfileImage(
                              readOnly: !viewModel.editorMode,
                              imagePath: image.value,
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

                    return WillPopScope(
                      onWillPop: () async {
                        return await viewModel.confirmExit();
                      },
                      child: SafeArea(
                        top: viewModel.editorMode ? false : false,
                        child: Scaffold(
                          extendBodyBehindAppBar: !viewModel.editorMode,
                          appBar: const CardAppBar(),
                          body: LayoutBuilder(builder: (context, size) {
                            return Material(
                              color: Theme.of(context).cardColor,
                              child: ScaffoldBodyWrapper(
                                  isFullWidth: true,
                                  padding: EdgeInsets.symmetric(
                                      vertical: 0,
                                      horizontal:
                                          max((size.maxWidth - 640) / 2, 0) > 0
                                              ? max(
                                                  (size.maxWidth - 640) / 2, 0)
                                              : 0),
                                  builder: (context, size) {
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
                                                    bottom: 18),
                                                child: avatarUrl(),
                                              ),
                                              Positioned(
                                                  bottom: 0,
                                                  left: 0,
                                                  right: 0,
                                                  child: CardDivider(
                                                    size: size,
                                                  )),
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
