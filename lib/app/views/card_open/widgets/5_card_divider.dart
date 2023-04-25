import 'package:digicard/app/constants/colors.dart';
import 'package:digicard/app/models/digital_card.dart';
import 'package:digicard/app/views/card_open/card_open_viewmodel.dart';
import 'package:digicard/app/views/card_open/widgets/3_card_waves.dart';
import 'package:digicard/app/views/card_open/widgets/4_card_logo.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

class CardDivider extends StatelessWidget {
  final BoxConstraints size;
  const CardDivider({super.key, required this.size});

  @override
  Widget build(BuildContext context) {
    final viewModel = getParentViewModel<CardOpenViewModel>(
      context,
      listen: false,
    );

    final formModel = ReactiveDigitalCardForm.of(
      context,
      listen: true,
    );

    final colorTheme =
        Color(formModel?.colorControl?.value ?? kcPrimaryColorInt);

    const waveHeight = 90.0;
    const waveBorderThickness = 8.0;
    const logoPadding = EdgeInsets.fromLTRB(20, 40, 15, 0);
    final logoMaxWidth = (size.maxWidth) * 0.20;
    const logoMaxHeight = 55.0;

    return Stack(
      clipBehavior: Clip.hardEdge,
      children: [
        Align(
          alignment: Alignment.bottomCenter,
          child: CustomPaint(
            size: const Size(double.infinity, waveHeight),
            painter: CardWaves(colorTheme),
          ),
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: Padding(
            padding: const EdgeInsets.only(top: waveBorderThickness),
            child: CustomPaint(
              size: const Size(double.infinity, waveHeight),
              painter: CardWaves(
                // Colors.red,
                Theme.of(context).cardColor,
              ),
            ),
          ),
        ),
        Align(
            alignment: Alignment.bottomRight,
            child: Padding(
              padding: logoPadding,
              child: Container(
                width: logoMaxWidth,
                height: logoMaxHeight,
                color: Colors.red.withOpacity(0.0),
                child: ReactiveLogoPicker(
                  formControl: formModel?.logoUrlControl,
                  readOnly: !viewModel.editMode,
                  backgroundColor: colorTheme,
                  onTap: !viewModel.editMode
                      ? null
                      : () async {
                          formModel?.form.unfocus();
                          await viewModel.showLogoPicker();
                        },
                ),
              ),
            )),
      ],
    );
  }
}
