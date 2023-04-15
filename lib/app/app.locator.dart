// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// StackedLocatorGenerator
// **************************************************************************

// ignore_for_file: public_member_api_docs, implementation_imports, depend_on_referenced_packages

import 'package:digicard/app/services/_core/user_service.dart';
import 'package:stacked_services/src/bottom_sheet/bottom_sheet_service.dart';
import 'package:stacked_services/src/dialog/dialog_service.dart';
import 'package:stacked_services/src/navigation/navigation_service.dart';
import 'package:stacked_services/src/snackbar/snackbar_service.dart';
import 'package:stacked_shared/stacked_shared.dart';
import 'package:stacked_themes/src/theme_service.dart';

import 'services/_core/auth_service_supabase.dart';
import 'services/_core/local_storage_service.dart';
import 'services/contacts_service.dart';
import 'services/digital_card_service.dart';
import 'services/digital_card_service_supabase.dart';
import 'ui/bottom_sheets/card_send_bottom_sheet_viewmodel.dart';
import 'ui/bottom_sheets/card_tools_bottom_sheet_viewmodel.dart';
import 'views/_core/dashboard/dashboard_viewmodel.dart';
import 'views/_core/initialize/initial_viewmodel.dart';
import 'views/_core/login/login_viewmodel.dart';
import 'views/card_open/card_open_viewmodel.dart';
import 'views/contacts/contacts_view_model.dart';
import 'views/custom_link/custom_link_view_model.dart';
import 'views/home/home_viewmodel.dart';
import 'views/scan_qr_code/scan_viewmodel.dart';
import 'views/settings/settings_view_model.dart';

final locator = StackedLocator.instance;

Future<void> setupLocator({
  String? environment,
  EnvironmentFilter? environmentFilter,
}) async {
// Register environments
  locator.registerEnvironment(
      environment: environment, environmentFilter: environmentFilter);

// Register dependencies
  final localStorageService = await LocalStorageService.getInstance();
  locator.registerSingleton(localStorageService);

  locator.registerLazySingleton(() => ThemeService.getInstance());
  locator.registerLazySingleton(() => DialogService());
  locator.registerLazySingleton(() => SnackbarService());
  locator.registerLazySingleton(() => BottomSheetService());
  locator.registerLazySingleton(() => NavigationService());
  locator.registerLazySingleton(() => AuthService());
  locator.registerLazySingleton(() => UserService());
  locator.registerLazySingleton(() => ContactsService());
  locator.registerLazySingleton<DigitalCardService>(
      () => DigitalCardServiceSupabase());
  locator.registerSingleton(InitialViewModel());
  locator.registerSingleton(LoginViewModel());
  locator.registerSingleton(DashboardViewModel());
  locator.registerSingleton(HomeViewModel());
  locator.registerSingleton(CardToolsBottomSheetViewModel());
  locator.registerSingleton(CardSendBottomSheetViewModel());
  locator.registerSingleton(CardOpenViewModel());
  locator.registerSingleton(CustomLinkViewModel());
  locator.registerSingleton(ScanViewModel());
  locator.registerSingleton(ContactsViewModel());
  locator.registerSingleton(SettingsViewModel());
}
