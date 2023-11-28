import 'package:digicard/app/app.locator.dart';
import 'package:digicard/ui/common/app_colors.dart';
import 'package:digicard/ui/views/dashboard/widgets/page_scaffold.dart';
import 'package:digicard/ui/widgets/digital_card_list_item/digital_card_list_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ez_core/flutter_ez_core.dart';
import 'package:stacked/stacked.dart';
import 'home_viewmodel.dart';

class HomeView extends StackedView<HomeViewModel> {
  const HomeView({Key? key}) : super(key: key);

  @override
  Future<void> onViewModelReady(HomeViewModel viewModel) async {
    await viewModel.init();
    super.onViewModelReady(viewModel);
  }

  @override
  bool get createNewViewModelOnInsert => false;

  @override
  bool get disposeViewModel => false;

  @override
  bool get fireOnViewModelReadyOnce => true;

  @override
  Widget builder(
    BuildContext context,
    HomeViewModel viewModel,
    Widget? child,
  ) {
    Widget floatActionButton() {
      return FloatingActionButton(
          heroTag: "add",
          backgroundColor: kcPrimaryColor,
          onPressed: () {
            viewModel.create();
          },
          child: const Icon(Icons.add));
    }

    return PageScaffold(
      floatingActionButton: floatActionButton(),
      title: 'CARDS',
      body: ScaffoldListWrapper(
        isBusy: (viewModel.isBusy && viewModel.digitalCards.isEmpty),
        emptyIndicatorWidget: const EZEmptyDisplay(
          icon: Icon(Icons.error_rounded, size: 30),
          title: "Ooops! looks empty here",
        ),
        onRefresh: () async {
          await viewModel.init();
        },
        itemCount: viewModel.digitalCards.length,
        builder: (context, constraints) {
          return GridView.builder(
            gridDelegate: ListItemHeightDelegate(
                crossAxisCount: (constraints.maxWidth <= 500 + 280)
                    ? 2
                    : (constraints.maxWidth <= 1024)
                        ? 3
                        : 7,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                height: 242),
            itemCount: viewModel.digitalCards.length,
            padding: const EdgeInsets.all(15),
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
  }

  @override
  HomeViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      locator<HomeViewModel>();
}
