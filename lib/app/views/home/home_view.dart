import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:digicard/app/app.locator.dart';
import 'package:digicard/app/constants/colors.dart';
import 'package:digicard/app/helper/screen_size.dart';
import 'package:digicard/app/ui/_core/empty_display.dart';
import 'package:digicard/app/ui/_core/scaffold_list_wrapper.dart';
import 'package:digicard/app/ui/_core/sliver_grid_delegate.dart';
import 'package:digicard/app/constants/dimensions.dart';
import 'package:digicard/app/views/home/widgets/app_icon.dart';
import 'package:digicard/app/views/home/widgets/digital_card_list_item.dart';
import 'package:digicard/app/views/dashboard/dashboard_view.dart';
import 'package:digicard/app/views/home/home_viewmodel.dart';

class HomeFloatingActionButton extends StatelessWidget {
  const HomeFloatingActionButton({
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    final viewModel = getParentViewModel<HomeViewModel>(context, listen: false);
    return FloatingActionButton(
        backgroundColor: kcPrimaryColor,
        onPressed: () {
          viewModel.create();
        },
        child: const Icon(Icons.add));
  }
}

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<HomeViewModel>.reactive(
        viewModelBuilder: () => locator<HomeViewModel>(),
        disposeViewModel: false,
        builder: (context, viewModel, child) {
          return DashboardBuilder(
            onReady: (v) async {
              if (!v.visited) {
                await viewModel.init();
                v.visited = true;
              }
            },
            onPop: (viewModel) async {
              return await viewModel.confirmExit();
            },
            builder: (context, child) {
              return Scaffold(
                drawer: child.drawer,
                bottomNavigationBar: child.bottomNavBar,
                appBar: AppBar(
                  automaticallyImplyLeading: false,
                  title: isDesktop(context) ? null : appIcon(),
                ),
                floatingActionButton: const HomeFloatingActionButton(),
                body: ScaffoldListWrapper(
                  isBusy: viewModel.isBusy,
                  emptyIndicatorWidget: const EmptyDisplay(
                    icon: Icons.card_giftcard_rounded,
                    title: "No Cards",
                  ),
                  onRefresh: () async {
                    await viewModel.init();
                  },
                  itemCount: viewModel.digitalCards.length,
                  builder: (context, constraints) {
                    return GridView.builder(
                      gridDelegate:
                          SliverGridDelegateWithFixedCrossAxisCountAndFixedHeight(
                              crossAxisCount: isMobile(context) ? 2 : 4,
                              crossAxisSpacing: 10,
                              mainAxisSpacing: 10,
                              height: 242),
                      itemCount: viewModel.digitalCards.length,
                      padding: Dimens.sliverPadding1000(constraints),
                      addAutomaticKeepAlives: false,
                      addRepaintBoundaries: false,
                      itemBuilder: (context, index) {
                        return DigitalCardListItem(
                          onTap: () {
                            viewModel.show(viewModel.digitalCards[index]);
                          },
                          card: viewModel.digitalCards[index],
                        );
                      },
                    );
                  },
                ),
              );
            },
          );
        });
  }
}
