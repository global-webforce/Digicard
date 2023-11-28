enum DisplayMode {
  edit,
  view,
}

enum ActionType {
  view,
  create,
  edit,
  duplicate,
  externalView,
}

enum ImagePickerType { gallery, camera, computer, remove }

const String saveBusyKey = 'saveBusyKey';
const String doneBusyKey = 'doneBusyKey';
const String deleteBusyKey = 'deleteBusyKey';
const String loadingCardBusyKey = 'loadingCardBusyKey';
const String loadingImagesBusyKey = 'loadingImagesBusyKey';

const String duplicateBusyKey = 'duplicateBusyKey';
const String downloadQRBusyKey = 'downloadQRBusyKey';
const String shareBusyKey = 'shareBusyKey';
const String saveToContactsBusyKey = 'saveToContactsBusyKey';
