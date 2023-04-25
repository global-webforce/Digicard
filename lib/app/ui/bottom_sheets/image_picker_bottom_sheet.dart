import 'dart:math';
import 'package:digicard/app/constants/colors.dart';
import 'package:digicard/app/ui/_core/spacer.dart';
import 'package:digicard/app/ui/bottom_sheets/image_picker_bottom_sheet_viewmodel.dart';
import 'package:digicard/app/ui/widgets/bottom_sheet_buttons.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

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
          return ClipRRect(
            borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(15.0),
                topRight: Radius.circular(15.0)),
            child: Container(
              decoration: BoxDecoration(
                color: Theme.of(context).scaffoldBackgroundColor,
              ),
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      color: kcPrimaryColor,
                      height: 25,
                      child: Center(
                        child: Container(
                          decoration: const BoxDecoration(
                              color: Colors.white,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(5))),
                          width: 50,
                          height: 5,
                        ),
                      ),
                    ),
                    Center(
                      child: Container(
                        padding: EdgeInsets.symmetric(
                            vertical: 16,
                            horizontal: max(
                                (MediaQuery.of(context).size.width - 500) / 2,
                                15)),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisSize: MainAxisSize.min,
                          children: <Widget>[
                            Row(
                              children: [
                                if (request.data["assetType"] == "avatar")
                                  const Text(
                                    "Pick Avatar Image",
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
                                  ),
                                if (request.data["assetType"] == "logo")
                                  const Text(
                                    "Pick Logo Image",
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
                                  ),
                              ],
                            ),
                            vSpaceSmall,
                            if (request.data["assetType"] == "avatar")
                              Padding(
                                padding: const EdgeInsets.only(bottom: 8.0),
                                child: Row(
                                  children: [
                                    MinButtons(
                                        color: kcPrimaryColor,
                                        onTap: () async {
                                          await viewModel.pickFromCamera();
                                        },
                                        icon:
                                            const Icon(FontAwesomeIcons.camera),
                                        title: "Take from Camera"),
                                  ],
                                ),
                              ),
                            Padding(
                              padding: const EdgeInsets.only(bottom: 8.0),
                              child: Row(
                                children: [
                                  MinButtons(
                                      color: kcPrimaryColor,
                                      onTap: () async {
                                        await viewModel.pickFromGallery();
                                      },
                                      icon: const Icon(FontAwesomeIcons.image),
                                      title: "Pick from Gallery"),
                                ],
                              ),
                            ),
                            if (request.data["removeOption"] == true)
                              Padding(
                                padding: const EdgeInsets.only(bottom: 8.0),
                                child: Row(
                                  children: [
                                    MinButtons(
                                        color: kcPrimaryColor,
                                        onTap: () async {
                                          viewModel.removeImage();
                                        },
                                        icon:
                                            const Icon(FontAwesomeIcons.xmark),
                                        title: "Remove image"),
                                  ],
                                ),
                              ),
                            Row(
                              children: [
                                MinButtons(
                                    color: kcPrimaryColor,
                                    onTap: () async {
                                      viewModel.cancel();
                                    },
                                    icon: const Icon(FontAwesomeIcons.ban),
                                    title: "Cancel"),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox.shrink(),
                  ],
                ),
              ),
            ),
          );
        });
  }
}
