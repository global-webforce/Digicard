import 'package:digicard/app/app.locator.dart';
import 'package:digicard/app/ui/bottom_sheets/card_send_bottom_sheet.dart';
import 'package:digicard/app/ui/bottom_sheets/card_tools_bottom_sheet.dart';

import 'package:stacked_services/stacked_services.dart';

//1. Create name/alias of custom dialog
enum BottomSheetType { codeVerification, digitalCard, send, z }

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
  };
  bottomSheetService.setCustomSheetBuilders(builders);
}
