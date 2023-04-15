import 'package:digicard/app/views/_core/initialize/initial_view.dart';
import 'package:digicard/app/routes/app_router.gr.dart';
import 'package:digicard/app/app.bottomsheet_ui.dart';
import 'package:digicard/app/app.dialog_ui.dart';
import 'package:digicard/app/app.snackbar_ui.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:digicard/app/app.locator.dart';
import 'package:flutter/material.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:stacked_themes/stacked_themes.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

void main() async {
  // GoogleFonts.config.allowRuntimeFetching = false;
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  if (!kIsWeb) FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  try {
    await Supabase.initialize(
      url: "https://kbetklswsjdfouluglbr.supabase.co",
      anonKey:
          "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImtiZXRrbHN3c2pkZm91bHVnbGJyIiwicm9sZSI6ImFub24iLCJpYXQiOjE2NzczNTU3NDcsImV4cCI6MTk5MjkzMTc0N30.8Ce3XIm1bQco_ntU4ssnnnfdvASNZOIsyQrxanvEVVk",
    );
  } catch (e) {
    rethrow;
  }

  setupLocator();

  locator.registerSingleton(AppRoute(StackedService.navigatorKey));
  await ThemeManager.initialise();
  await setupSnackBarUI();
  await setupDialogUI();
  await setupBottomSheetUI();

  runApp(const InitialView());
}
//locator.registerSingleton(AppRoute(StackedService.navigatorKey));
