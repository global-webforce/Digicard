import 'package:digicard/app/app.locator.dart';
import 'package:digicard/app/views/card_open/card_open_viewmodel.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class ImagePickerBottomSheetViewModel extends ReactiveViewModel {
  final _bottomSheetService = locator<BottomSheetService>();

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
}
