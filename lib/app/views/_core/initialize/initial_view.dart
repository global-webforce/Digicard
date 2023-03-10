import 'package:digicard/app/ui/_shared/app_colors.dart';
import 'package:digicard/app/views/_core/initialize/initial_viewmodel.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import 'package:loader_overlay/loader_overlay.dart';
import 'package:stacked/stacked.dart';

class InitialView extends StatelessWidget {
  const InitialView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<InitialViewModel>.reactive(
        viewModelBuilder: () => InitialViewModel(),
        fireOnViewModelReadyOnce: true,
        builder: (context, viewModel, child) {
          final r = viewModel.appRouter.declarativeDelegate(
            routes: (handler) {
              return viewModel.isLoggedIn();
            },
            onPopRoute: (route, result) {
              print(route.path);
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
                cardTheme: CardTheme(
                  margin: const EdgeInsets.all(0),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                colorScheme: ColorScheme(
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
                ),
                brightness: Brightness.light,
                elevatedButtonTheme: ElevatedButtonThemeData(
                  style: ElevatedButton.styleFrom(
                    foregroundColor: Colors.white,
                  ),
                ),
                fontFamily: GoogleFonts.nunito().fontFamily,
                inputDecorationTheme: InputDecorationTheme(
                  isDense: true,
                  filled: true,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
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
