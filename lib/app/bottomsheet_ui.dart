import 'package:digicard/app/app.locator.dart';
import 'package:digicard/app/ui/bottom_sheets/bs.card_share.dart';
import 'package:digicard/app/ui/bottom_sheets/bs.card_manager.dart';
import 'package:digicard/app/ui/bottom_sheets/bs.image_picker.dart';
import 'package:stacked_services/stacked_services.dart';
import 'ui/bottom_sheets/bs.delete.dart';

enum BottomSheetType { digitalCard, send, imagepicker, delete }

Future<void> setupBottomSheetUI() async {
  final bottomSheetService = locator<BottomSheetService>();

  final builders = {
    BottomSheetType.digitalCard: (context, sheetRequest, completer) =>
        CardManagerBottomSheet(
          request: sheetRequest,
          completer: completer,
        ),
    BottomSheetType.send: (context, sheetRequest, completer) =>
        CardShareBottomSheet(
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
