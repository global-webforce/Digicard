import 'package:digicard/ui/bottom_sheets/bottom_sheet_wrapper.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'delete_sheet_model.dart';

class DeleteSheet extends StackedView<DeleteSheetModel> {
  final Function(SheetResponse response)? completer;
  final SheetRequest request;
  const DeleteSheet({
    Key? key,
    required this.completer,
    required this.request,
  }) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    DeleteSheetModel viewModel,
    Widget? child,
  ) {
    final Color colorTheme = request.data;
    return BottomSheetWrapper(
      notchColor: colorTheme,
      children: [
        Padding(
          padding: const EdgeInsets.only(bottom: 8.0),
          child: PanelButton(
              color: colorTheme,
              onTap: () async {
                completer!(SheetResponse(confirmed: true));
              },
              icon: const Icon(FontAwesomeIcons.xmark),
              title: "Delete"),
        ),
        PanelButton(
            color: colorTheme,
            onTap: () async {
              completer!(SheetResponse());
            },
            icon: const Icon(FontAwesomeIcons.ban),
            title: "Cancel"),
      ],
    );
  }

  @override
  DeleteSheetModel viewModelBuilder(BuildContext context) => DeleteSheetModel();
}
