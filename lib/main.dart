import 'dart:ui';
import 'package:digicard/app/env/env.dart';
import 'package:digicard/ui/common/app_colors.dart';
import 'package:digicard/ui/common/theme.dark.dart';
import 'package:digicard/ui/common/theme.light.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:digicard/app/app.bottomsheets.dart';
import 'package:digicard/app/app.dialogs.dart';
import 'package:digicard/app/app.locator.dart';
import 'package:digicard/app/app.router.dart';
import 'package:flutter/services.dart';
import 'package:flutter_ez_core/flutter_ez_core.dart';
import 'package:flutter_intro/flutter_intro.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:loader_overlay/loader_overlay.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:stacked_themes/stacked_themes.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

Future<void> main() async {
  GoogleFonts.config.allowRuntimeFetching = false;
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(
    widgetsBinding: widgetsBinding,
  );
  //await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  await Supabase.initialize(
    url: Env.supabaseUrl,
    anonKey: Env.supabaseAnonKey,
  );

  await setupLocator(stackedRouter: stackedRouter);
  await ThemeManager.initialise();
  setupDialogUi();
  setupBottomSheetUi();
  LicenseRegistry.addLicense(() async* {
    final license = await rootBundle.loadString('google_fonts/OFL.txt');
    yield LicenseEntryWithLineBreaks(['google_fonts'], license);
  });
  ResponsiveSizingConfig.instance.setCustomBreakpoints(
    const ScreenBreakpoints(desktop: 1280, tablet: 768, watch: 200),
  );
  runApp(Intro(

      /// The padding of the highlighted area and the widget
      padding: const EdgeInsets.all(8),

      /// Border radius of the highlighted area
      borderRadius: const BorderRadius.all(Radius.circular(4)),

      /// The mask color of step page
      maskColor: const Color.fromRGBO(0, 0, 0, .6),

      /// No animation
      noAnimation: false,

      /// Click on whether the mask is allowed to be closed.
      maskClosable: false,

      /// Custom button text
      buttonTextBuilder: (order) => order == 3 ? 'Custom Button Text' : 'Next',
      child: const MainApp()));
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return LifeCycleManager(
        child: ThemeBuilder(
            defaultThemeMode: ThemeMode.dark,
            darkTheme: darkTheme,
            lightTheme: lightTheme,
            builder: (context, regularTheme, darkTheme, themeMode) {
              return GlobalLoaderOverlay(
                duration: const Duration(milliseconds: 250),
                reverseDuration: const Duration(milliseconds: 250),
                useDefaultLoading: false,
                overlayColor: Colors.black.withOpacity(0.6),
                overlayWidget: const Center(
                    child: CircularProgressIndicator(
                  color: kcPrimaryColor,
                )),
                child: MaterialApp.router(
                  title: "Digicard",
                  theme: regularTheme,
                  darkTheme: darkTheme,
                  themeMode: ThemeMode.light,
                  scrollBehavior: MyCustomScrollBehavior(),
                  debugShowCheckedModeBanner: false,
                  routerDelegate: stackedRouter.delegate(),
                  routeInformationParser: stackedRouter.defaultRouteParser(
                    includePrefixMatches: true,
                  ),
                ),
              );
            }));
  }
}

class MyCustomScrollBehavior extends MaterialScrollBehavior {
  // Override behavior methods and getters like dragDevices
  @override
  Set<PointerDeviceKind> get dragDevices => {
        PointerDeviceKind.touch,
        PointerDeviceKind.mouse,
      };
}
