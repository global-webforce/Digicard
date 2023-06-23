import 'package:digicard/app/app.locator.dart';
import 'package:reactive_image_picker/reactive_image_picker.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class ImagePickerBottomSheetViewModel extends ReactiveViewModel {
  final _bottomSheetService = locator<BottomSheetService>();

  pickFromComputer() {
    _bottomSheetService.completeSheet(
      SheetResponse(data: ImageSource.gallery),
    );
  }

  pickFromGallery() {
    _bottomSheetService.completeSheet(
      SheetResponse(data: ImageSource.gallery),
    );
  }

  pickFromCamera() {
    _bottomSheetService.completeSheet(
      SheetResponse(data: ImageSource.camera),
    );
  }

  removeImage() {
    _bottomSheetService.completeSheet(
      SheetResponse(data: false),
    );
  }

  cancel() {
    _bottomSheetService.completeSheet(
      SheetResponse(),
    );
  }
}
