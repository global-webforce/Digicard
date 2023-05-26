import 'package:auto_route/auto_route.dart';
import 'package:digicard/app/app.locator.dart';
import 'package:digicard/app/routes/app_router.dart';
import 'package:digicard/app/constants/colors.dart';
import 'package:digicard/app/routes/app_router.gr.dart';
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
    final appRouter = locator<AppRouter>();
    return ViewModelBuilder<StartupViewModel>.reactive(
        viewModelBuilder: () => StartupViewModel(),
        onViewModelReady: (viewModel) async {},
        onDispose: (viewModel) {},
        builder: (context, viewModel, child) {
          Widget _waiting() {
            return const Material(
              child: Center(child: CircularProgressIndicator()),
            );
          }

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
              key: UniqueKey(),
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
                bottomSheetTheme: const BottomSheetThemeData(
                    elevation: 0, backgroundColor: Colors.transparent),
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
              routerConfig: appRouter.config(
                  includePrefixMatches: true,
                  rebuildStackOnDeepLink: true,
                  deepLinkBuilder: (deepLink) {
                    if (!kIsWeb) FlutterNativeSplash.remove();
                    if (deepLink.path.startsWith('/p/')) {
                      // continute with the platfrom link
                      return DeepLink.path(deepLink.path);
                    } else {
                      if (viewModel.isPresent) {
                        return const DeepLink([DashboardRoute()]);
                      }
                      return const DeepLink([WelcomeRoute()]);
                    }
                  }),
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
