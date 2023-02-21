// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// StackedLocatorGenerator
// **************************************************************************

// ignore_for_file: public_member_api_docs, implementation_imports, depend_on_referenced_packages

import 'package:digicard/app/core/authentication/pages/auth_view_model.dart';
import 'package:digicard/features/create_card/services/digital_card_service.dart';
import 'package:digicard/features/create_card/services/digital_card_service_laravel.dart';
import 'package:digicard/features/create_card/viewmodels/digital_card_view_model.dart';
import 'package:digicard/features/create_card/viewmodels/send_view_model.dart';
import 'package:digicard/features/scan/scan_view_model.dart';
import 'package:stacked_core/stacked_core.dart';
import 'package:stacked_services/src/bottom_sheet/bottom_sheet_service.dart';
import 'package:stacked_services/src/dialog/dialog_service.dart';
import 'package:stacked_services/src/navigation/navigation_service.dart';
import 'package:stacked_services/src/snackbar/snackbar_service.dart';

import 'package:digicard/app/api/api_service.dart';
import 'package:stacked_themes/stacked_themes.dart';
import '../dashboards/user_dashboard/viewmodels/home_page_viewmodel.dart';
import '../dashboards/user_dashboard/viewmodels/scaffold_page_viewmodel.dart';

import 'core/local_storage/local_storage_service.dart';
import 'app_service.dart';
import 'app_view_model.dart';

final locator = StackedLocator.instance;

Future<void> setupLocator(
    {String? environment, EnvironmentFilter? environmentFilter}) async {
  locator.registerEnvironment(
      environment: environment, environmentFilter: environmentFilter);
  final localStorageService = await LocalStorageService.getInstance();
  locator.registerSingleton(localStorageService);
  locator.registerSingleton(NavigationService());
  locator.registerLazySingleton(() => ThemeService.getInstance());
  locator.registerLazySingleton(() => DialogService());
  locator.registerLazySingleton(() => SnackbarService());
  locator.registerLazySingleton(() => BottomSheetService());
  locator.registerLazySingleton(() => ApiService());
  locator.registerLazySingleton(() => AppService());

  locator.registerLazySingleton<DigitalCardService>(
      () => DigitalCardServiceLaravel());

  locator.registerFactory(() => AppViewModel());
  locator.registerFactory(() => AuthViewModel());

  locator.registerFactory(() => ScaffoldPageViewModel());
  locator.registerFactory(() => HomePageViewModel());
  locator.registerFactory(() => DigitalCardViewModel());

  locator.registerFactory(() => ScanViewModel());
  locator.registerFactory(() => SendViewModel());
}
