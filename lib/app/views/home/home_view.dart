import 'package:digicard/app/app.locator.dart';
import 'package:digicard/app/helper/screen_size.dart';
import 'package:digicard/app/ui/_core/dashboard/ez_drawer_button.dart';
import 'package:digicard/app/ui/_core/sliver_grid_delegate.dart';
import 'package:digicard/app/ui/_shared/app_colors.dart';
import 'package:digicard/app/ui/_shared/dimensions.dart';
import 'package:digicard/app/constants/keys.dart';
import 'package:digicard/app/ui/_core/empty_display.dart';
import 'package:digicard/app/ui/_core/scaffold_list_wrapper.dart';
import 'package:digicard/app/ui/widgets/app_icon.dart';
import 'package:digicard/app/ui/widgets/digital_card_list_item.dart';
import 'package:digicard/app/views/home/home_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:stacked/stacked.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<HomeViewModel>.reactive(
        viewModelBuilder: () => locator<HomeViewModel>(),
        onViewModelReady: (viewModel) async {
          await viewModel.init();
        },
        fireOnViewModelReadyOnce: true,
        disposeViewModel: false,
        builder: (context, viewModel, child) {
          return Scaffold(
              bottomSheet: Text("${viewModel.appService.session?.user.email}"),
              appBar: AppBar(
                automaticallyImplyLeading: false,
                leading: EzDrawerMenu(context, scaffoldkey: scaffoldKey),
                title: !isDesktop(context) ? appIcon() : null,
              ),
              floatingActionButton: FloatingActionButton(
                  backgroundColor: kcPrimaryColor,
                  child: const Icon(Icons.add),
                  onPressed: () {
                    viewModel.create();
                  }),
              body: ScaffoldListWrapper(
                isBusy: viewModel.isBusy,
                emptyIndicatorWidget: const EmptyDisplay(
                  icon: FontAwesomeIcons.addressCard,
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
                            crossAxisCount: isMobile(context) ? 2 : 3,
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
              ));
        });
  }
}
