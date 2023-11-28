import 'package:digicard/app/env/env.dart';
import 'package:digicard/app/views/00_startup/startup_view.dart';
import 'package:digicard/app/bottomsheet_ui.dart';
import 'package:digicard/app/dialog_ui.dart';
import 'package:digicard/app/snackbar_ui.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:digicard/app/app.locator.dart';
import 'package:flutter/material.dart';
import 'package:stacked_themes/stacked_themes.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

void main() async {
  // GoogleFonts.config.allowRuntimeFetching = false;
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  if (!kIsWeb) FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  try {
    await Supabase.initialize(
      url: Env.supabaseUrl,
      anonKey: Env.supabaseAnonKey,
    );
  } catch (e) {
    rethrow;
  }

  setupLocator();

  await ThemeManager.initialise();
  await setupSnackBarUI();
  await setupDialogUI();
  await setupBottomSheetUI();
  runApp(const StartupView());
}
