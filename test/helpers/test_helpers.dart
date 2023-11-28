import 'package:digicard/app/services/auth_service.dart';
import 'package:digicard/app/services/contacts_service.dart';

import 'package:digicard/app/services/digital_card_service.dart';
import 'package:digicard/app/services/local_storage_service.dart';
import 'package:digicard/app/services/native_contacts_service.dart';
import 'package:digicard/app/services/permission_handler_service.dart';
import 'package:digicard/app/services/user_service.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:digicard/app/app.locator.dart';
import 'package:stacked_services/stacked_services.dart';

// @stacked-import

import 'test_helpers.mocks.dart';

@GenerateMocks([], customMocks: [
  MockSpec<NavigationService>(onMissingStub: OnMissingStub.returnDefault),
  MockSpec<BottomSheetService>(onMissingStub: OnMissingStub.returnDefault),
  MockSpec<DialogService>(onMissingStub: OnMissingStub.returnDefault),
  MockSpec<DigitalCardService>(onMissingStub: OnMissingStub.returnDefault),
  MockSpec<ContactsService>(onMissingStub: OnMissingStub.returnDefault),

  MockSpec<LocalStorageService>(onMissingStub: OnMissingStub.returnDefault),
  MockSpec<NativeContactsService>(onMissingStub: OnMissingStub.returnDefault),
  MockSpec<PermissionHandlerService>(
      onMissingStub: OnMissingStub.returnDefault),
  MockSpec<AuthService>(onMissingStub: OnMissingStub.returnDefault),
  MockSpec<UserService>(onMissingStub: OnMissingStub.returnDefault),
// @stacked-mock-spec
])
void registerServices() {
  getAndRegisterNavigationService();
  getAndRegisterBottomSheetService();
  getAndRegisterDialogService();
  getAndRegisterDigitalCardService();
  getAndRegisterContactsService();
  getAndRegisterLocalStorageService();
  getAndRegisterNativeContactsService();
  getAndRegisterPermissionHandlerService();
  getAndRegisterAuthService();
  getAndRegisterUserService();
// @stacked-mock-register
}

MockNavigationService getAndRegisterNavigationService() {
  _removeRegistrationIfExists<NavigationService>();
  final service = MockNavigationService();
  locator.registerSingleton<NavigationService>(service);
  return service;
}

MockBottomSheetService getAndRegisterBottomSheetService<T>({
  SheetResponse<T>? showCustomSheetResponse,
}) {
  _removeRegistrationIfExists<BottomSheetService>();
  final service = MockBottomSheetService();

  when(service.showCustomSheet<T, T>(
    enableDrag: anyNamed('enableDrag'),
    enterBottomSheetDuration: anyNamed('enterBottomSheetDuration'),
    exitBottomSheetDuration: anyNamed('exitBottomSheetDuration'),
    ignoreSafeArea: anyNamed('ignoreSafeArea'),
    isScrollControlled: anyNamed('isScrollControlled'),
    barrierDismissible: anyNamed('barrierDismissible'),
    additionalButtonTitle: anyNamed('additionalButtonTitle'),
    variant: anyNamed('variant'),
    title: anyNamed('title'),
    hasImage: anyNamed('hasImage'),
    imageUrl: anyNamed('imageUrl'),
    showIconInMainButton: anyNamed('showIconInMainButton'),
    mainButtonTitle: anyNamed('mainButtonTitle'),
    showIconInSecondaryButton: anyNamed('showIconInSecondaryButton'),
    secondaryButtonTitle: anyNamed('secondaryButtonTitle'),
    showIconInAdditionalButton: anyNamed('showIconInAdditionalButton'),
    takesInput: anyNamed('takesInput'),
    barrierColor: anyNamed('barrierColor'),
    barrierLabel: anyNamed('barrierLabel'),
    customData: anyNamed('customData'),
    data: anyNamed('data'),
    description: anyNamed('description'),
  )).thenAnswer((realInvocation) =>
      Future.value(showCustomSheetResponse ?? SheetResponse<T>()));

  locator.registerSingleton<BottomSheetService>(service);
  return service;
}

MockDialogService getAndRegisterDialogService() {
  _removeRegistrationIfExists<DialogService>();
  final service = MockDialogService();
  locator.registerSingleton<DialogService>(service);
  return service;
}

MockDigitalCardService getAndRegisterDigitalCardService() {
  _removeRegistrationIfExists<DigitalCardService>();
  final service = MockDigitalCardService();
  locator.registerSingleton<DigitalCardService>(service);
  return service;
}

MockContactsService getAndRegisterContactsService() {
  _removeRegistrationIfExists<ContactsService>();
  final service = MockContactsService();
  locator.registerSingleton<ContactsService>(service);
  return service;
}

MockLocalStorageService getAndRegisterLocalStorageService() {
  _removeRegistrationIfExists<LocalStorageService>();
  final service = MockLocalStorageService();
  locator.registerSingleton<LocalStorageService>(service);
  return service;
}

MockNativeContactsService getAndRegisterNativeContactsService() {
  _removeRegistrationIfExists<NativeContactsService>();
  final service = MockNativeContactsService();
  locator.registerSingleton<NativeContactsService>(service);
  return service;
}

MockPermissionHandlerService getAndRegisterPermissionHandlerService() {
  _removeRegistrationIfExists<PermissionHandlerService>();
  final service = MockPermissionHandlerService();
  locator.registerSingleton<PermissionHandlerService>(service);
  return service;
}

MockAuthService getAndRegisterAuthService() {
  _removeRegistrationIfExists<AuthService>();
  final service = MockAuthService();
  locator.registerSingleton<AuthService>(service);
  return service;
}

MockUserService getAndRegisterUserService() {
  _removeRegistrationIfExists<UserService>();
  final service = MockUserService();
  locator.registerSingleton<UserService>(service);
  return service;
}
// @stacked-mock-create

void _removeRegistrationIfExists<T extends Object>() {
  if (locator.isRegistered<T>()) {
    locator.unregister<T>();
  }
}
