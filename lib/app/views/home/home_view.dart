import 'package:digicard/app/app.locator.dart';
import 'package:digicard/app/ui/_shared/app_colors.dart';
import 'package:digicard/app/ui/_shared/dimensions.dart';
import 'package:digicard/app/constants/keys.dart';
import 'package:digicard/app/ui/_core/empty_display.dart';
import 'package:digicard/app/ui/_core/scaffold_list_wrapper.dart';
import 'package:digicard/app/ui/widgets/app_icon.dart';
import 'package:digicard/app/ui/widgets/digital_card_widget.dart';
import 'package:digicard/app/views/home/home_view_viewmodel.dart';
import 'package:ez_dashboard/ez_drawer_button.dart';
import 'package:ez_dashboard/screen_size_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
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
        createNewViewModelOnInsert: true,
        builder: (context, viewModel, child) {
          return Scaffold(
              appBar: AppBar(
                automaticallyImplyLeading: false,
                leading: ezDrawerButton(
                  context,
                  dashboardScaffoldKey,
                ),
                title: !isDesktop(context) ? appIcon() : null,
              ),
              floatingActionButton: FloatingActionButton(
                  backgroundColor: kcPrimaryColor,
                  child: const Icon(Icons.add),
                  onPressed: () {}),
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
                  return AlignedGridView.count(
                    crossAxisCount: isMobile(context) ? 2 : 3,
                    mainAxisSpacing: 16,
                    crossAxisSpacing: 16,
                    itemCount: viewModel.digitalCards.length,
                    padding: Dimens.sliverPadding1000(constraints),
                    addAutomaticKeepAlives: false,
                    addRepaintBoundaries: false,
                    itemBuilder: (context, index) {
                      return DigitalCardWidget(
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
