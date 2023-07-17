import 'package:digicard/app/app.locator.dart';
import 'package:digicard/app/constants/colors.dart';
import 'package:digicard/app/constants/keys.dart';
import 'package:digicard/app/models/digital_card.dart';
import 'package:digicard/app/ui/overlays/loader_overlay_wrapper.dart';
import 'package:digicard/app/views/card_display/card_display_view.dart';
import 'package:digicard/app/views/card_editor/card_editor_viewmodel.dart';
import 'package:digicard/app/views/card_editor/widgets/card_form.dart';
import 'package:flutter/material.dart';
import 'package:reactive_forms/reactive_forms.dart';
import 'package:stacked/stacked.dart';

class CardEditorView extends StatelessWidget {
  final DigitalCard card;
  final ActionType actionType;
  const CardEditorView({Key? key, required this.card, required this.actionType})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<CardEditorViewModel>.reactive(
        viewModelBuilder: () => locator<CardEditorViewModel>(),
        disposeViewModel: false,
        onViewModelReady: (model) {
          model.initialize(card, actionType);
          model.context = context;
        },
        onDispose: (model) {
          model.model = DigitalCard();
          model.formModel.reset();
          model.formModel.form.dispose();
          model.formModel.customLinksCustomLinkForm
              .map((e) => e.form.dispose());
        },
        builder: (context, viewModel, child) {
          return ReactiveDigitalCardForm(
            form: viewModel.formModel,
            child: ReactiveValueListenableBuilder<dynamic>(
                formControl: viewModel.formModel.colorControl,
                builder: (context, color, child) {
                  final colorTheme = Color(color.value ?? kcPrimaryColorInt);

                  return WillPopScope(
                    onWillPop: () async {
                      return await viewModel.confirmExit();
                    },
                    child: LoaderOverlayWrapper(
                        color: colorTheme,
                        type: viewModel.busy(saveBusyKey)
                            ? LoadingType.save
                            : viewModel.busy(doneBusyKey)
                                ? LoadingType.done
                                : null,
                        builder: (context) {
                          return Row(
                            children: [
                              const Expanded(child: CardForm()),
                              const VerticalDivider(
                                width: 1,
                                thickness: 1,
                              ),
                              Expanded(
                                child: ReactiveDigitalCardFormConsumer(
                                    builder: (context, f, c) {
                                  return CardDisplayView(
                                    key: UniqueKey(),
                                    card: f.model,
                                    action: DisplayType.private,
                                  );
                                }),
                              )
                            ],
                          );
                        }),
                  );
                }),
          );
        });
  }
}
