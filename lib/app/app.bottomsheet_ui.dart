import 'package:digicard/app/app.locator.dart';
import 'package:digicard/app/ui/bottom_sheets/bs.card_send.dart';
import 'package:digicard/app/ui/bottom_sheets/bs.card_tools.dart';
import 'package:digicard/app/ui/bottom_sheets/bs.image_picker.dart';

import 'package:stacked_services/stacked_services.dart';

import 'ui/bottom_sheets/bs.delete_card.dart';

//1. Create name/alias of custom dialog
enum BottomSheetType { digitalCard, send, imagepicker, delete }

Future<void> setupBottomSheetUI() async {
  final bottomSheetService = locator<BottomSheetService>();

//2. Add it on builders
  final builders = {
    BottomSheetType.digitalCard: (context, sheetRequest, completer) =>
        CardToolsBottomSheet(
          request: sheetRequest,
          completer: completer,
        ),
    BottomSheetType.send: (context, sheetRequest, completer) =>
        CardSendBottomSheet(
          request: sheetRequest,
          completer: completer,
        ),
    BottomSheetType.imagepicker: (context, sheetRequest, completer) =>
        ImagePickerBottomSheet(
          request: sheetRequest,
          completer: completer,
        ),
    BottomSheetType.delete: (context, sheetRequest, completer) =>
        DeleteBottomSheet(
          request: sheetRequest,
          completer: completer,
        ),
  };
  bottomSheetService.setCustomSheetBuilders(builders);
}
