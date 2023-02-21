import 'package:digicard/app/app.locator.dart';
import 'package:digicard/app/shared/constants/dimensions.dart';
import 'package:digicard/app/shared/ui/empty_display.dart';
import 'package:digicard/app/shared/ui/list_and_grid_view_wrapper.dart';
import 'package:digicard/dashboards/user_dashboard/pages/scaffold_page.dart';
import 'package:digicard/dashboards/user_dashboard/viewmodels/home_page_viewmodel.dart';
import 'package:digicard/features/create_card/widgets/digital_card_widget.dart';
import 'package:ez_dashboard/ez_drawer_button.dart';
import 'package:ez_dashboard/screen_size_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:stacked/stacked.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Builder(builder: (context1) {
      return ViewModelBuilder<HomePageViewModel>.reactive(
          viewModelBuilder: () => locator<HomePageViewModel>(),
          onViewModelReady: (viewModel) async {
            await viewModel.init();
          },
          builder: (context, viewModel, child) {
            return Scaffold(
                appBar: AppBar(
                  automaticallyImplyLeading: false,
                  leading: ezDrawerButton(
                    context,
                    AppScaffold.scaffoldkey,
                  ),
                  title: !isDesktop(context) ? AppScaffold.appIcon : null,
                ),
                floatingActionButton: FloatingActionButton(
                    backgroundColor: Colors.orange,
                    child: const Icon(Icons.add),
                    onPressed: () {}),
                body: ListAndGridViewWrapper(
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
                      padding: Dimens.sliverPadding(constraints),
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
    });
  }
}
