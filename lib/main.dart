import 'package:digicard/app/app.router.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:digicard/app/app.locator.dart';
import 'package:digicard/app/app_view_model.dart';
import 'package:digicard/app/shared/ui/setup_bottomsheet_ui.dart';
import 'package:digicard/app/shared/ui/setup_dialog_ui.dart';
import 'package:digicard/app/shared/ui/setup_snackbar_ui.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:loader_overlay/loader_overlay.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:stacked_themes/stacked_themes.dart';

void main() async {
//  GoogleFonts.config.allowRuntimeFetching = false;
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  if (!kIsWeb) FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  setupLocator();
  await ThemeManager.initialise();
  await setupSnackBarUI();
  await setupDialogUI();
  await setupBottomSheetUI();
  ResponsiveSizingConfig.instance.setCustomBreakpoints(
    const ScreenBreakpoints(
      desktop: 1100,
      tablet: 650,
      watch: 300,
    ),
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<AppViewModel>.reactive(
        viewModelBuilder: () => locator<AppViewModel>(),
        onViewModelReady: (viewModel) async {
          await viewModel.fetchUser();
          Future.delayed(const Duration(seconds: 1));
          if (viewModel.user != null) {
            await locator<NavigationService>()
                .pushNamedAndRemoveUntil(Routes.dashboardView);
          } else {
            await locator<NavigationService>()
                .pushNamedAndRemoveUntil(Routes.authView);
          }
        },
        builder: (context, viewModel, child) {
          return GlobalLoaderOverlay(
            duration: const Duration(milliseconds: 250),
            reverseDuration: const Duration(milliseconds: 250),
            useDefaultLoading: false,
            overlayColor: Colors.black,
            overlayOpacity: 0.6,
            overlayWidget: const Center(
                child: CircularProgressIndicator(
              color: Colors.orange,
            )),
            child: MaterialApp(
              title: "Digicard",
              theme: ThemeData(
                cardTheme: CardTheme(
                  margin: const EdgeInsets.all(0),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                colorSchemeSeed: Colors.orange,
                brightness: Brightness.dark,
                /*            colorScheme: const ColorScheme(
                      brightness: Brightness.dark,
                      primary: Colors.orange,
                      onPrimary: Colors.white,
                      secondary: Colors.orangeAccent,
                      onSecondary: Colors.white,
                      error: Colors.red,
                      onError: Colors.white,
                      background: Colors.pink,
                      onBackground: Colors.white,
                      surface: Colors.orangeAccent,
                      onSurface: Colors.white), */
                elevatedButtonTheme: ElevatedButtonThemeData(
                  style: ElevatedButton.styleFrom(
                    foregroundColor: Colors.white, // Text color
                  ),
                ),
                fontFamily: GoogleFonts.nunito().fontFamily,
                inputDecorationTheme: InputDecorationTheme(
                  isDense: true,
                  filled: true,
                  //  fillColor: HexColor("#EDE5F3"),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
              scrollBehavior: MyCustomScrollBehavior(),
              localizationsDelegates: const [FormBuilderLocalizations.delegate],
              debugShowCheckedModeBanner: false,
              navigatorKey: StackedService.navigatorKey,
              //  initialRoute: Routes.initialView,
              // home: const Text("FDSFSF"),
              onGenerateRoute: StackedRouter().onGenerateRoute,
            ),
          );
        });
  }
}

class MyCustomScrollBehavior extends MaterialScrollBehavior {
  @override
  Set<PointerDeviceKind> get dragDevices => {
        PointerDeviceKind.touch,
        PointerDeviceKind.mouse,
      };
}

class InitialView extends ViewModelWidget<AppViewModel> {
  const InitialView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, AppViewModel viewModel) {
    return const Scaffold(body: Center(child: CircularProgressIndicator()));
  }
}
