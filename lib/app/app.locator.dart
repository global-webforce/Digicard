// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// StackedLocatorGenerator
// **************************************************************************

// ignore_for_file: public_member_api_docs, implementation_imports, depend_on_referenced_packages

import 'package:stacked_services/src/bottom_sheet/bottom_sheet_service.dart';
import 'package:stacked_services/src/dialog/dialog_service.dart';
import 'package:stacked_services/src/navigation/navigation_service.dart';
import 'package:stacked_services/src/snackbar/snackbar_service.dart';
import 'package:stacked_shared/stacked_shared.dart';
import 'package:stacked_themes/src/theme_service.dart';

import 'routes/app_router.dart';
import 'services/auth_service_supabase.dart';
import 'services/contacts_service.dart';
import 'services/deeplink_service.dart';
import 'services/digital_card_service.dart';
import 'services/native_contacts_service.dart';
import 'services/user_service.dart';
import 'ui/bottom_sheets/bs.card_manager_viewmodel.dart';
import 'ui/bottom_sheets/bs.card_share_viewmodel.dart';
import 'views/00_startup/startup_viewmodel.dart';
import 'views/00_startup_login/login_viewmodel.dart';
import 'views/01_home/home_viewmodel.dart';
import 'views/02_scan_qr_code/scan_viewmodel.dart';
import 'views/03_contacts/contacts_view_model.dart';
import 'views/04_settings/settings_view_model.dart';
import 'views/card_editor/card_editor_viewmodel.dart';
import 'views/card_preview/card_display_viewmodel.dart';
import 'views/dashboard/dashboard_viewmodel.dart';

final locator = StackedLocator.instance;

Future<void> setupLocator({
  String? environment,
  EnvironmentFilter? environmentFilter,
}) async {
// Register environments
  locator.registerEnvironment(
      environment: environment, environmentFilter: environmentFilter);

// Register dependencies
  locator.registerLazySingleton(() => UserService());
  locator.registerLazySingleton(() => AuthService());
  locator.registerLazySingleton(() => ThemeService.getInstance());
  locator.registerSingleton(AppRouter());
  locator.registerLazySingleton(() => DeeplinkService());
  locator.registerLazySingleton(() => DialogService());
  locator.registerLazySingleton(() => SnackbarService());
  locator.registerLazySingleton(() => BottomSheetService());
  locator.registerLazySingleton(() => NavigationService());
  locator.registerLazySingleton(() => ContactsService());
  locator.registerLazySingleton(() => NativeContactsService());
  locator.registerLazySingleton(() => DigitalCardService());
  locator.registerSingleton(StartupViewModel());
  locator.registerSingleton(LoginViewModel());
  locator.registerSingleton(DashboardViewModel());
  locator.registerSingleton(HomeViewModel());
  locator.registerSingleton(CardManagerBottomSheetViewModel());
  locator.registerSingleton(CardShareBottomSheetViewModel());
  locator.registerSingleton(CardEditorViewModel());
  locator.registerSingleton(CardDisplayViewModel());
  locator.registerSingleton(ScanViewModel());
  locator.registerSingleton(ContactsViewModel());
  locator.registerSingleton(SettingsViewModel());
}
