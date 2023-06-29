import 'package:digicard/app/app.locator.dart';
import 'package:digicard/app/routes/app_router.dart';
import 'package:digicard/app/constants/colors.dart';
import 'package:digicard/app/views/startup/startup_viewmodel.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:loader_overlay/loader_overlay.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_themes/stacked_themes.dart';

import 'themes.dart';

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

          return ThemeBuilder(
              defaultThemeMode: ThemeMode.system,
              darkTheme: darkTheme,
              lightTheme: lightTheme,
              builder: (context, regularTheme, darkTheme, themeMode) {
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
                    theme: regularTheme,
                    darkTheme: darkTheme,
                    themeMode: themeMode,
                    scrollBehavior: MyCustomScrollBehavior(),
                    debugShowCheckedModeBanner: false,
                    routerConfig: appRouter.config(
                      includePrefixMatches: true,
                    ),
                  ),
                );
              });
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
