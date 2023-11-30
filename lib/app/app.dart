import 'package:digicard/ui/bottom_sheets/notice/notice_sheet.dart';
import 'package:digicard/ui/views/card_viewer/card_viewer_view.dart';
import 'package:digicard/ui/views/contacts/contacts_viewmodel.dart';
import 'package:digicard/ui/views/dashboard/dashboard_viewmodel.dart';
import 'package:digicard/ui/views/home/home_view.dart';
import 'package:digicard/ui/views/home/home_viewmodel.dart';
import 'package:digicard/ui/views/scan/scan_viewmodel.dart';
import 'package:digicard/ui/views/settings/settings_viewmodel.dart';
import 'package:digicard/ui/views/startup/startup_view.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked/stacked_annotations.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:digicard/ui/views/contacts/contacts_view.dart';
import 'package:digicard/ui/views/settings/settings_view.dart';
import 'package:digicard/ui/views/auth/auth_view.dart';
import 'package:digicard/ui/views/card_editor/card_editor_view.dart';
import 'package:digicard/ui/bottom_sheets/card_manager/card_manager_sheet.dart';
import 'package:digicard/ui/bottom_sheets/card_share/card_share_sheet.dart';
import 'package:digicard/ui/bottom_sheets/delete/delete_sheet.dart';
import 'package:digicard/ui/dialogs/confirm/confirm_dialog.dart';
import 'package:digicard/ui/dialogs/error/error_dialog.dart';
import 'package:digicard/ui/dialogs/info/info_dialog.dart';
import 'package:digicard/ui/views/forgot_password/forgot_password_view.dart';
import 'services/auth_service.dart';
import 'services/authentication_service.supabase.dart';
import 'services/contacts_service.dart';
import 'services/digital_card_service.dart';
import 'services/local_storage_service.dart';
import 'services/native_contacts_service.dart';
import 'services/permission_handler_service.dart';

import 'services/user_service.dart';
import 'package:digicard/ui/views/scan/scan_view.dart';
import 'package:digicard/ui/views/dashboard/dashboard_view.dart';
import 'package:digicard/ui/views/card_viewer_web/card_viewer_web_view.dart';
// @stacked-import

@StackedApp(
  logger: StackedLogger(),
  routes: [
    MaterialRoute(
      initial: true,
      path: '/',
      page: StartupView,
    ),
    MaterialRoute(
      fullMatch: true,
      path: "/p/:uuid",
      page: CardViewerWebView,
    ),
    MaterialRoute(page: AuthView),
    CustomRoute(
      page: HomeView,
      transitionsBuilder: TransitionsBuilders.noTransition,
    ),
    CustomRoute(
      page: ContactsView,
      transitionsBuilder: TransitionsBuilders.noTransition,
    ),
    CustomRoute(
      page: SettingsView,
      transitionsBuilder: TransitionsBuilders.noTransition,
    ),
    CustomRoute(
      page: ScanView,
      maintainState: false,
      transitionsBuilder: TransitionsBuilders.noTransition,
    ),
    MaterialRoute(page: CardEditorView),
    MaterialRoute(page: CardViewerView),
    MaterialRoute(page: ForgotPasswordView),
    MaterialRoute(page: DashboardView),

// @stacked-route
  ],
  dependencies: [
    LazySingleton(classType: RouterService),
    LazySingleton(classType: UserService),
    InitializableSingleton(
      classType: SupabaseAuthService,
      asType: AuthService,
    ),
    LazySingleton(classType: BottomSheetService),
    LazySingleton(classType: DialogService),
    LazySingleton(classType: DigitalCardService),
    LazySingleton(classType: ContactsService),

    LazySingleton(classType: LocalStorageService),
    LazySingleton(classType: NativeContactsService),
    LazySingleton(classType: PermissionHandlerService),

    Singleton(classType: DashboardViewModel),
    Singleton(classType: HomeViewModel),
    Singleton(classType: ScanViewModel),
    Singleton(classType: ContactsViewModel),
    Singleton(classType: SettingsViewModel),

// @stacked-service
  ],
  bottomsheets: [
    StackedBottomsheet(classType: NoticeSheet),
    StackedBottomsheet(classType: CardManagerSheet),
    StackedBottomsheet(classType: CardShareSheet),
    StackedBottomsheet(classType: DeleteSheet),
// @stacked-bottom-sheet
  ],
  dialogs: [
    StackedDialog(classType: ConfirmDialog),
    StackedDialog(classType: ErrorDialog),
    StackedDialog(classType: InfoDialog),
// @stacked-dialog
  ],
)
class App {}
