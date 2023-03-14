import 'package:digicard/app/constants/color_pallette.dart';
import 'package:digicard/app/ui/_shared/app_colors.dart';
import 'package:digicard/app/ui/dialogs/color_picker_dialog_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class ColorPickerDialog extends StatelessWidget {
  final DialogRequest request;
  final Function(DialogResponse) completer;
  const ColorPickerDialog(
      {Key? key, required this.request, required this.completer})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<ColorPickerViewModel>.reactive(
        viewModelBuilder: () => ColorPickerViewModel(),
        builder: (context, viewModel, child) {
          Widget pickerLayoutBuilder(
              BuildContext context, List<Color> colors, PickerItem child) {
            Orientation orientation = MediaQuery.of(context).orientation;

            return Center(
              child: SizedBox(
                height: 200,
                child: GridView.count(
                  crossAxisCount: 5,
                  crossAxisSpacing: 5,
                  mainAxisSpacing: 5,
                  children: [for (Color color in colors) child(color)],
                ),
              ),
            );
          }

          Widget pickerItemBuilder(
              Color color, bool isCurrentColor, void Function() changeColor) {
            return Container(
              margin: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: color,
                boxShadow: [
                  BoxShadow(
                      color: color.withOpacity(0.8),
                      offset: const Offset(1, 2),
                      blurRadius: 10)
                ],
              ),
              child: Material(
                color: Colors.transparent,
                child: InkWell(
                  onTap: changeColor,
                  borderRadius: BorderRadius.circular(10),
                  child: AnimatedOpacity(
                    duration: const Duration(milliseconds: 250),
                    opacity: isCurrentColor ? 1 : 0,
                    child: Icon(
                      Icons.done,
                      color: useWhiteForeground(color)
                          ? Colors.white
                          : Colors.black,
                    ),
                  ),
                ),
              ),
            );
          }

          return Dialog(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            backgroundColor: Theme.of(context).scaffoldBackgroundColor,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: SizedBox(
                width: 600,
                child: SingleChildScrollView(
                  padding: const EdgeInsets.all(15),
                  child: Center(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        BlockPicker(
                          availableColors: cardColors,
                          pickerColor: request.data ?? kcPrimaryColor,
                          onColorChanged: (color) {
                            completer(DialogResponse(data: color));
                          },
                          layoutBuilder: pickerLayoutBuilder,
                          itemBuilder: pickerItemBuilder,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          );
        });
  }
}
