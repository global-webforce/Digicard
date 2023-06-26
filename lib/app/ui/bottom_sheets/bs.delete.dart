import 'package:digicard/app/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:stacked_services/stacked_services.dart';
import 'bottom_sheet_wrapper.dart';

class DeleteBottomSheet extends StatelessWidget {
  final SheetRequest request;
  final Function(SheetResponse) completer;

  const DeleteBottomSheet({
    Key? key,
    required this.request,
    required this.completer,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BottomSheetWrapper(
      children: [
        Padding(
          padding: const EdgeInsets.only(bottom: 8.0),
          child: PanelButton(
              color: kcPrimaryColor,
              onTap: () async {
                completer(SheetResponse(confirmed: true));
              },
              icon: const Icon(FontAwesomeIcons.xmark),
              title: "Delete"),
        ),
        PanelButton(
            color: kcPrimaryColor,
            onTap: () async {
              completer(SheetResponse());
            },
            icon: const Icon(FontAwesomeIcons.ban),
            title: "Cancel"),
      ],
    );
  }
}
