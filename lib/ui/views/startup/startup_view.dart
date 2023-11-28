import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_ez_core/helpers/ui_helpers.dart';
import 'package:stacked/stacked.dart';

import 'startup_viewmodel.dart';

class StartupView extends StackedView<StartupViewModel> {
  const StartupView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    StartupViewModel viewModel,
    Widget? child,
  ) {
    return const Scaffold(
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            hSpaceSmall,
            SizedBox(
              width: 16,
              height: 16,
              child: CircularProgressIndicator(
                color: Colors.black,
                strokeWidth: 6,
              ),
            ),
            Text('Loading ...', style: TextStyle(fontSize: 16)),
          ],
        ),
      ),
    );
  }

  @override
  void onDispose(StartupViewModel viewModel) {
    viewModel.streamSubscription?.cancel();
    super.onDispose(viewModel);
  }

  @override
  StartupViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      StartupViewModel();

  @override
  void onViewModelReady(StartupViewModel viewModel) => SchedulerBinding.instance
      .addPostFrameCallback((timeStamp) => viewModel.runStartupLogic());
}
