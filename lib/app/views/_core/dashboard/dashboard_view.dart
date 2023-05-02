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

class DashboardView extends StatelessWidget {
  const DashboardView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<DashboardViewModel>.reactive(
        disposeViewModel: false,
        onDispose: (viewModel) {
          viewModel.visited = false;
        },
        viewModelBuilder: () => DashboardViewModel(),
        builder: (context, viewModel, child) {
          return viewModel.component()?.view ?? const SizedBox();
        });
  }
}

class DashboardPart {
  final Widget? drawer;
  final Widget? bottomNavBar;
  final Function() onLeave;

  DashboardPart({
    this.bottomNavBar,
    this.drawer,
    required this.onLeave,
  });
}

class DashboardBuilder extends StatelessWidget {
  final Widget Function(
    BuildContext context,
    DashboardPart parts,
  ) builder;
  const DashboardBuilder({super.key, required this.builder});

  @override
  Widget build(BuildContext context) {
    final viewModel =
        getParentViewModel<DashboardViewModel>(context, listen: false);

    final drawer = Builder(builder: (context) {
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
            icon: FontAwesomeIcons.idCard,
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
    });

    final part = DashboardPart(
        onLeave: () async => await viewModel
            .confirmExit()
            .then((value) => value?.confirmed ?? false),
        drawer: null, //isDesktop(context) ? null : drawer,
        bottomNavBar: Builder(builder: (context) {
          return EZBottomNavbar(
            colorTheme: kcPrimaryColor,
            currentIndex: viewModel.currentIndex,
            onTap: (i) {
              viewModel.setIndex(i);
            },
            items: [
              EZBottomNavbarItem(
                icon: FontAwesomeIcons.idCard,
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
        }));
    return (isDesktop(context))
        ? Row(
            children: [
              SizedBox(
                width: 300,
                child: Scaffold(body: drawer),
              ),
              Expanded(
                child: LayoutBuilder(builder: (context, size) {
                  return SizedBox(
                      width: size.maxWidth,
                      height: size.maxHeight,
                      child: builder(context, part));
                }),
              ),
            ],
          )
        : builder(context, part);
  }
}
