import 'package:digicard/app/routes/app_router.dart';
import 'package:digicard/app/services/auth_service_supabase.dart';
import 'package:digicard/app/services/contacts_service.dart';
import 'package:digicard/app/services/deeplink_service.dart';
import 'package:digicard/app/services/digital_card_service.dart';
import 'package:digicard/app/services/native_contacts_service.dart';
import 'package:digicard/app/services/user_service.dart';
import 'package:digicard/app/views/login/login_viewmodel.dart';
import 'package:digicard/app/views/startup/startup_viewmodel.dart';
import 'package:digicard/app/ui/bottom_sheets/bs.card_share_viewmodel.dart';
import 'package:digicard/app/ui/bottom_sheets/bs.card_manager_viewmodel.dart';
import 'package:digicard/app/views/dashboard/dashboard_viewmodel.dart';
import 'package:digicard/app/views/card_editor/card_editor_viewmodel.dart';
import 'package:digicard/app/views/home/home_viewmodel.dart';
import 'package:digicard/app/views/contacts/contacts_view_model.dart';
import 'package:digicard/app/views/scan_qr_code/scan_viewmodel.dart';
import 'package:digicard/app/views/settings/settings_view_model.dart';
import 'package:stacked/stacked_annotations.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:stacked_themes/stacked_themes.dart';
import 'views/card_display/card_display_viewmodel.dart';

@StackedApp(
  logger: StackedLogger(),
  routes: [],
  dependencies: [
    LazySingleton(classType: UserService),
    LazySingleton(classType: AuthService),
    /*   Presolve(
      classType: LocalStorageService,
      presolveUsing: LocalStorageService.getInstance,
    ), */
    LazySingleton(
      classType: ThemeService,
      resolveUsing: ThemeService.getInstance,
    ),
    Singleton(classType: AppRouter),
    LazySingleton(classType: DeeplinkService),
    LazySingleton(classType: DialogService),
    LazySingleton(classType: SnackbarService),
    LazySingleton(classType: BottomSheetService),
    LazySingleton(classType: NavigationService),
    LazySingleton(classType: ContactsService),
    LazySingleton(classType: NativeContactsService),
    LazySingleton(classType: DigitalCardService),
    Singleton(classType: StartupViewModel),
    Singleton(classType: LoginViewModel),
    Singleton(classType: DashboardViewModel),
    Singleton(classType: HomeViewModel),
    Singleton(classType: CardManagerBottomSheetViewModel),
    Singleton(classType: CardShareBottomSheetViewModel),
    Singleton(classType: CardEditorViewModel),
    Singleton(classType: CardDisplayViewModel),
    Singleton(classType: ScanViewModel),
    Singleton(classType: ContactsViewModel),
    Singleton(classType: SettingsViewModel),
  ],
)
class App {}
