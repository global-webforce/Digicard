import 'package:digicard/app/constants/colors.dart';
import 'package:digicard/app/ui/_core/spacer.dart';
import 'package:digicard/app/ui/bottom_sheets/bs.image_picker_viewmodel.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'bottom_sheet_wrapper.dart';

class ImagePickerBottomSheet extends StatelessWidget {
  final SheetRequest request;
  final Function(SheetResponse) completer;

  const ImagePickerBottomSheet({
    Key? key,
    required this.request,
    required this.completer,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<ImagePickerBottomSheetViewModel>.reactive(
        viewModelBuilder: () => ImagePickerBottomSheetViewModel(),
        builder: (context, viewModel, child) {
          final bool avatarMode = request.data["assetType"] == "avatar";
          final bool logoMode = request.data["assetType"] == "logo";
          final bool enableRemove = request.data["removeOption"] == true;

          return BottomSheetWrapper(
            children: <Widget>[
              if (avatarMode)
                const Text(
                  "Pick Avatar Image",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              if (logoMode)
                const Text(
                  "Pick Logo Image",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              vSpaceSmall,
              if (kIsWeb)
                Padding(
                  padding: const EdgeInsets.only(bottom: 8.0),
                  child: PanelButton(
                      color: kcPrimaryColor,
                      onTap: () async {
                        await viewModel.pickFromComputer();
                      },
                      icon: const Icon(FontAwesomeIcons.folder),
                      title: "Select from Computer"),
                ),
              if (avatarMode && !kIsWeb)
                Padding(
                  padding: const EdgeInsets.only(bottom: 8.0),
                  child: PanelButton(
                      color: kcPrimaryColor,
                      onTap: () async {
                        await viewModel.pickFromCamera();
                      },
                      icon: const Icon(FontAwesomeIcons.camera),
                      title: "Take from Camera"),
                ),
              if (!kIsWeb)
                Padding(
                  padding: const EdgeInsets.only(bottom: 8.0),
                  child: PanelButton(
                      color: kcPrimaryColor,
                      onTap: () async {
                        await viewModel.pickFromGallery();
                      },
                      icon: const Icon(FontAwesomeIcons.image),
                      title: "Pick from Gallery"),
                ),
              if (enableRemove)
                Padding(
                  padding: const EdgeInsets.only(bottom: 8.0),
                  child: PanelButton(
                      color: kcPrimaryColor,
                      onTap: () async {
                        viewModel.removeImage();
                      },
                      icon: const Icon(FontAwesomeIcons.xmark),
                      title: "Remove image"),
                ),
              PanelButton(
                color: kcPrimaryColor,
                onTap: () async {
                  viewModel.cancel();
                },
                icon: const Icon(FontAwesomeIcons.ban),
                title: "Cancel",
              ),
            ],
          );
        });
  }
}
