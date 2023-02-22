import 'package:digicard/app/api/api_service.dart';
import 'package:digicard/app/app_service.dart';
import 'package:digicard/app/app_view_model.dart';
import 'package:digicard/app/core/authentication/pages/auth_page.dart';
import 'package:digicard/app/core/authentication/pages/auth_view_model.dart';
import 'package:digicard/app/core/authentication/pages/login_page.dart';
import 'package:digicard/app/core/authentication/pages/welcome_page.dart';
import 'package:digicard/app/core/local_storage/local_storage_service.dart';
import 'package:digicard/dashboards/user_dashboard/pages/home_page.dart';
import 'package:digicard/dashboards/user_dashboard/pages/dashboard_view.dart';
import 'package:digicard/dashboards/user_dashboard/viewmodels/home_page_viewmodel.dart';
import 'package:digicard/dashboards/user_dashboard/viewmodels/scaffold_page_viewmodel.dart';
import 'package:digicard/features/contacts/contacts_page.dart';
import 'package:digicard/features/create_card/services/digital_card_service.dart';
import 'package:digicard/features/create_card/viewmodels/digital_card_view_model.dart';
import 'package:digicard/features/create_card/viewmodels/send_view_model.dart';
import 'package:digicard/features/scan/scan_page.dart';
import 'package:digicard/features/scan/scan_view_model.dart';
import 'package:digicard/features/settings/pages/settings_page.dart';
import 'package:digicard/main.dart';
import 'package:stacked/stacked_annotations.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:stacked_themes/stacked_themes.dart';
import '../features/create_card/services/digital_card_service_laravel.dart';

@StackedApp(
  logger: StackedLogger(),
  routes: [
    MaterialRoute(page: InitialView, initial: true),
    MaterialRoute(
      page: AuthView,
      children: [
        MaterialRoute(page: WelcomeView, initial: true),
        MaterialRoute(
          page: LoginView,
        ),
      ],
    ),
    MaterialRoute(
      page: DashboardView,
      path: "",
      children: [
        MaterialRoute(
          page: HomeView,
          initial: true,
        ),
        MaterialRoute(
          page: ScanView,
        ),
        MaterialRoute(
          page: ContactsView,
        ),
        MaterialRoute(
          page: SettingsView,
        ),
      ],
    ),
  ],
  dependencies: [
    //stacked services
    LazySingleton(
      classType: ThemeService,
      resolveUsing: ThemeService.getInstance,
    ),
    LazySingleton(classType: DialogService),
    LazySingleton(classType: SnackbarService),
    LazySingleton(classType: BottomSheetService),
    LazySingleton(classType: NavigationService),
    //my-services
    Presolve(
      classType: LocalStorageService,
      presolveUsing: LocalStorageService.getInstance,
    ),
    LazySingleton(classType: ApiService),
    LazySingleton(classType: AppService),

    LazySingleton(
      classType: DigitalCardServiceLaravel,
      asType: DigitalCardService,
    ),
    //my-viewmodels
    Singleton(classType: AppViewModel),
    Singleton(classType: AuthViewModel),
    Singleton(classType: DashboardViewViewModel),
    Singleton(classType: HomeViewViewModel),
    Singleton(classType: DigitalCardViewModel),
    Singleton(classType: ScanViewModel),
    Singleton(classType: SendViewModel),
  ],
)
class App {}
