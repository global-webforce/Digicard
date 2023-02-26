import 'package:digicard/app/views/_core/initialize/initial_view.dart';
import 'package:digicard/app/routes/app_router.gr.dart';
import 'package:digicard/app/app.bottomsheet_ui.dart';
import 'package:digicard/app/app.dialog_ui.dart';
import 'package:digicard/app/app.snackbar_ui.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:digicard/app/app.locator.dart';
import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:stacked_themes/stacked_themes.dart';

void main() async {
  // GoogleFonts.config.allowRuntimeFetching = false;
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  if (!kIsWeb) FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);

  setupLocator();
  locator.registerSingleton(AppRoute(StackedService.navigatorKey));
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
  runApp(const InitialView());
}

//locator.registerSingleton(AppRoute(StackedService.navigatorKey));
