import 'package:digicard/app/app.locator.dart';
import 'package:digicard/app/views/card_editor/card_editor_viewmodel.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class ImagePickerBottomSheetViewModel extends ReactiveViewModel {
  final _bottomSheetService = locator<BottomSheetService>();

  pickFromComputer() {
    _bottomSheetService.completeSheet(
      SheetResponse(data: ImagePickerType.computer),
    );
  }

  pickFromGallery() {
    _bottomSheetService.completeSheet(
      SheetResponse(data: ImagePickerType.gallery),
    );
  }

  pickFromCamera() {
    _bottomSheetService.completeSheet(
      SheetResponse(data: ImagePickerType.camera),
    );
  }

  removeImage() {
    _bottomSheetService.completeSheet(
      SheetResponse(data: ImagePickerType.remove),
    );
  }

  cancel() {
    _bottomSheetService.completeSheet(
      SheetResponse(),
    );
  }
}
