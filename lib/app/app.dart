import 'package:digicard/app/services/_core/auth_service_supabase.dart';
import 'package:digicard/app/services/contacts_service.dart';
import 'package:digicard/app/services/digital_card_service_supabase.dart';
import 'package:digicard/app/views/_core/login/login_viewmodel.dart';
import 'package:digicard/app/views/_core/initialize/initial_viewmodel.dart';
import 'package:digicard/app/services/_core/local_storage_service.dart';
import 'package:digicard/app/services/digital_card_service.dart';
import 'package:digicard/app/ui/bottom_sheets/card_send_bottom_sheet_viewmodel.dart';
import 'package:digicard/app/ui/bottom_sheets/card_tools_bottom_sheet_viewmodel.dart';
import 'package:digicard/app/views/_core/dashboard/dashboard_viewmodel.dart';
import 'package:digicard/app/views/card_open/card_open_viewmodel.dart';
import 'package:digicard/app/views/home/home_viewmodel.dart';
import 'package:digicard/app/views/contacts/contacts_view_model.dart';
import 'package:digicard/app/views/scan_qr_code/scan_viewmodel.dart';
import 'package:digicard/app/views/settings/settings_view_model.dart';
import 'package:stacked/stacked_annotations.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:stacked_themes/stacked_themes.dart';

import 'views/custom_link/custom_link_view_model.dart';

@StackedApp(
  logger: StackedLogger(),
  routes: [],
  dependencies: [
    Presolve(
      classType: LocalStorageService,
      presolveUsing: LocalStorageService.getInstance,
    ),
    LazySingleton(
      classType: ThemeService,
      resolveUsing: ThemeService.getInstance,
    ),
    LazySingleton(classType: DialogService),
    LazySingleton(classType: SnackbarService),
    LazySingleton(classType: BottomSheetService),
    LazySingleton(classType: NavigationService),
    LazySingleton(classType: AuthService),
    LazySingleton(classType: ContactsService),
    LazySingleton(
      classType: DigitalCardServiceSupabase,
      asType: DigitalCardService,
    ),
    Singleton(classType: InitialViewModel),
    Singleton(classType: LoginViewModel),
    Singleton(classType: DashboardViewModel),
    Singleton(classType: HomeViewModel),
    Singleton(classType: CardToolsBottomSheetViewModel),
    Singleton(classType: CardSendBottomSheetViewModel),
    Singleton(classType: CardOpenViewModel),
    Singleton(classType: CustomLinkViewModel),
    Singleton(classType: ScanViewModel),
    Singleton(classType: ContactsViewModel),
    Singleton(classType: SettingsViewModel),
  ],
)
class App {}
