import 'package:digicard/app/app.locator.dart';
import 'package:digicard/app/routes/app_router.dart';
import 'package:digicard/app/constants/colors.dart';
import 'package:digicard/app/views/startup/startup_viewmodel.dart';
import 'package:flutter/gestures.dart';
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
        fireOnViewModelReadyOnce: true,
        onViewModelReady: (viewModel) async {
          await viewModel.init();
        },
        onDispose: (viewModel) {
          viewModel.stop();
        },
        builder: (context, viewModel, child) {
          AppRouter appRouter = locator<AppRouter>();

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
                cardTheme: CardTheme(
                  margin: const EdgeInsets.all(0),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
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
                inputDecorationTheme: const InputDecorationTheme(
                  isDense: true,
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10))),
                  floatingLabelBehavior: FloatingLabelBehavior.auto,
                ),
              ),
              scrollBehavior: MyCustomScrollBehavior(),
              debugShowCheckedModeBanner: false,
              routerConfig: appRouter.config(
                includePrefixMatches: true,
              ),
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
