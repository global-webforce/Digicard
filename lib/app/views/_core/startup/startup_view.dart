import 'package:digicard/app/routes/app_router.gr.dart';
import 'package:digicard/app/constants/colors.dart';
import 'package:digicard/app/views/_core/startup/startup_viewmodel.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/material.dart';
import 'package:loader_overlay/loader_overlay.dart';
import 'package:stacked/stacked.dart';

class StartupView extends StatelessWidget {
  const StartupView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<StartupViewModel>.reactive(
        viewModelBuilder: () => StartupViewModel(),
        onViewModelReady: (viewModel) async {},
        onDispose: (viewModel) {},
        builder: (context, viewModel, child) {
          final r = viewModel.appRouter.declarativeDelegate(
            navigatorObservers: () => [HeroController()],
            routes: (handler) {
              if (!kIsWeb) FlutterNativeSplash.remove();
              return [
                if (viewModel.isPresent) const DashboardRoute(),
                if (!viewModel.isPresent) const WelcomeRoute(),
              ];
            },
          );

          return GlobalLoaderOverlay(
            duration: const Duration(milliseconds: 250),
            reverseDuration: const Duration(milliseconds: 250),
            useDefaultLoading: false,
            overlayColor: Colors.black,
            overlayOpacity: 0.6,
            overlayWidget: const Center(
                child: CircularProgressIndicator(
              color: kcPrimaryColor,
            )),
            child: MaterialApp.router(
              title: "Digicard",
              theme: ThemeData(
                useMaterial3: true,
                /*  cardTheme: CardTheme(
                  margin: const EdgeInsets.all(0),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ), */
                colorSchemeSeed: kcPrimaryColor,
                /*      colorScheme: ColorScheme(
                    primary: Colors.orange,
                    secondary: Colors.orangeAccent,
                    surface: Colors.grey.shade800,
                    background: Colors.grey.shade900,
                    error: Colors.red,
                    onPrimary: Colors.white,
                    onSecondary: Colors.white,
                    onSurface: Colors.white,
                    onBackground: Colors.white,
                    onError: Colors.white,
                    brightness: Brightness.light,
                  ), */

                brightness: Brightness.dark,
                elevatedButtonTheme: ElevatedButtonThemeData(
                  style: ElevatedButton.styleFrom(
                    foregroundColor: Colors.white,
                  ),
                ),
                fontFamily: GoogleFonts.poppins().fontFamily,
                inputDecorationTheme: InputDecorationTheme(
                  isDense: true,
                  filled: true,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(1016),
                  ),
                ),
              ),
              scrollBehavior: MyCustomScrollBehavior(),
              debugShowCheckedModeBanner: false,
              routeInformationParser: viewModel.appRouter.defaultRouteParser(),
              routerDelegate: r,
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
