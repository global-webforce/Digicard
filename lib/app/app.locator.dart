// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// StackedLocatorGenerator
// **************************************************************************

// ignore_for_file: public_member_api_docs, implementation_imports, depend_on_referenced_packages

import 'package:stacked_services/src/bottom_sheet/bottom_sheet_service.dart';
import 'package:stacked_services/src/dialog/dialog_service.dart';
import 'package:stacked_services/src/navigation/router_service.dart';
import 'package:stacked_shared/stacked_shared.dart';

import '../ui/views/contacts/contacts_viewmodel.dart';
import '../ui/views/dashboard/dashboard_viewmodel.dart';
import '../ui/views/home/home_viewmodel.dart';
import '../ui/views/scan/scan_viewmodel.dart';
import '../ui/views/settings/settings_viewmodel.dart';
import 'services/auth_service.dart';
import 'services/authentication_service.supabase.dart';
import 'services/contacts_service.dart';
import 'services/digital_card_service.dart';
import 'services/local_storage_service.dart';
import 'services/native_contacts_service.dart';
import 'services/permission_handler_service.dart';
import 'services/user_service.dart';
import 'app.router.dart';

final locator = StackedLocator.instance;

Future<void> setupLocator({
  String? environment,
  EnvironmentFilter? environmentFilter,
  StackedRouterWeb? stackedRouter,
}) async {
// Register environments
  locator.registerEnvironment(
      environment: environment, environmentFilter: environmentFilter);

// Register dependencies
  locator.registerLazySingleton(() => RouterService());
  locator.registerLazySingleton(() => UserService());
  final supabaseAuthService = SupabaseAuthService();
  await supabaseAuthService.initialise();
  locator.registerSingleton<AuthService>(supabaseAuthService);

  locator.registerLazySingleton(() => BottomSheetService());
  locator.registerLazySingleton(() => DialogService());
  locator.registerLazySingleton(() => DigitalCardService());
  locator.registerLazySingleton(() => ContactsService());
  locator.registerLazySingleton(() => LocalStorageService());
  locator.registerLazySingleton(() => NativeContactsService());
  locator.registerLazySingleton(() => PermissionHandlerService());
  locator.registerSingleton(DashboardViewModel());
  locator.registerSingleton(HomeViewModel());
  locator.registerSingleton(ScanViewModel());
  locator.registerSingleton(ContactsViewModel());
  locator.registerSingleton(SettingsViewModel());
  if (stackedRouter == null) {
    throw Exception(
        'Stacked is building to use the Router (Navigator 2.0) navigation but no stackedRouter is supplied. Pass the stackedRouter to the setupLocator function in main.dart');
  }

  locator<RouterService>().setRouter(stackedRouter);
}
