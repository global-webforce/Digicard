import 'package:digicard/app/helper/screen_size.dart';
import 'package:digicard/app/ui/_core/dashboard/ez_appbar.dart';
import 'package:digicard/app/ui/_core/dashboard/ez_bottom_navbar.dart';
import 'package:digicard/app/ui/_core/dashboard/ez_drawer.dart';
import 'package:digicard/app/constants/colors.dart';
import 'package:digicard/app/ui/widgets/app_icon.dart';
import 'package:digicard/app/views/_core/dashboard/dashboard_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:stacked/stacked.dart';

class $EZBottomNavbar extends StatelessWidget {
  const $EZBottomNavbar({super.key});

  @override
  Widget build(BuildContext context) {
    final viewModel = getParentViewModel<DashboardViewModel>(context);
    return EZBottomNavbar(
      colorTheme: kcPrimaryColor,
      currentIndex: viewModel.currentIndex,
      onTap: (i) {
        viewModel.setIndex(i);
      },
      items: [
        EZBottomNavbarItem(
          icon: FontAwesomeIcons.solidIdCard,
          title: "CARDS",
        ),
        EZBottomNavbarItem(
          icon: FontAwesomeIcons.camera,
          title: "SCAN",
        ),
        EZBottomNavbarItem(
          icon: FontAwesomeIcons.addressBook,
          title: "CONTACTS",
        ),
        EZBottomNavbarItem(
          icon: Icons.settings_rounded,
          title: "SETTINGS",
        ),
      ],
    );
  }
}

class $EzDrawer extends StatelessWidget {
  const $EzDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    final viewModel = getParentViewModel<DashboardViewModel>(context);
    return EZDrawer(
      colorTheme: kcPrimaryColor,
      currentIndex: viewModel.currentIndex,
      onTap: (i) {
        viewModel.setIndex(i);
        Scaffold.of(context).closeDrawer();
      },
      appBar: EZAppBar(
        appName: appIcon(),
      ),
      items: [
        EZDrawerMenuItem(
          icon: FontAwesomeIcons.solidIdCard,
          title: "CARDS",
        ),
        EZDrawerMenuItem(
          icon: FontAwesomeIcons.camera,
          title: "SCAN",
        ),
        EZDrawerMenuItem(
          icon: FontAwesomeIcons.addressBook,
          title: "CONTACTS",
        ),
        EZDrawerMenuItem(
          icon: Icons.settings_rounded,
          title: "SETTINGS",
        ),
      ],
    );
  }
}

class DashboardView extends StatelessWidget {
  const DashboardView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<DashboardViewModel>.reactive(
      disposeViewModel: false,
      viewModelBuilder: () => DashboardViewModel(),
      onViewModelReady: (viewModel) {},
      builder: (context, viewModel, child) => WillPopScope(
          onWillPop: () async {
            return await viewModel
                .confirmExit()
                .then((value) => value!.confirmed);
          },
          child: isDesktop(context)
              ? Row(
                  children: [
                    const SizedBox(
                      width: 300,
                      child: Scaffold(
                        body: $EzDrawer(),
                      ),
                    ),
                    const VerticalDivider(width: 0),
                    Expanded(
                      child: LayoutBuilder(builder: (context, size) {
                        return SizedBox(
                          width: size.maxWidth,
                          height: size.maxHeight,
                          child:
                              viewModel.component()?.view ?? const SizedBox(),
                        );
                      }),
                    ),
                  ],
                )
              : viewModel.component()?.view ?? const SizedBox()),
    );
  }
}
