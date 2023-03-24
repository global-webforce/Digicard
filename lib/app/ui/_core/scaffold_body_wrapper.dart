import 'package:flutter/material.dart';
import 'package:digicard/app/ui/_shared/dimensions.dart';

class ScaffoldBodyWrapper extends StatelessWidget {
  final Future<void> Function()? onRefresh;
  final bool isBusy;
  final Widget busyIndicatorWidget;
  final bool isEmpty;
  final Widget emptyIndicatorWidget;
  final Widget Function(BuildContext, BoxConstraints) builder;
  final bool centered;
  final bool isFullWidth;
  final bool neverScroll;
  final bool disableScrollView;
  final EdgeInsets padding;
  const ScaffoldBodyWrapper({
    Key? key,
    this.onRefresh,
    this.isBusy = false,
    this.busyIndicatorWidget = const Center(
      child: CircularProgressIndicator(),
    ),
    this.isEmpty = false,
    this.emptyIndicatorWidget = const Text("Empty Result"),
    required this.builder,
    this.centered = false,
    this.isFullWidth = false,
    this.neverScroll = false,
    this.disableScrollView = false,
    this.padding = const EdgeInsets.all(15),
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
      Widget emptyScreen() {
        return CustomScrollView(
          primary: false,
          physics: neverScroll
              ? const NeverScrollableScrollPhysics()
              : const AlwaysScrollableScrollPhysics(),
          slivers: [
            SliverFillRemaining(
              child: Center(child: emptyIndicatorWidget),
            )
          ],
        );
      }

      Widget defaultScreen() {
        return disableScrollView
            ? Container(
                child: builder(context, constraints),
              )
            : SingleChildScrollView(
                primary: false,
                physics: neverScroll
                    ? const NeverScrollableScrollPhysics()
                    : const AlwaysScrollableScrollPhysics(),
                padding: isFullWidth
                    ? padding
                    : Dimens.sliverPadding1000(constraints),
                child: builder(context, constraints));
      }

      return onRefresh != null
          ? RefreshIndicator(
              strokeWidth: 3,
              triggerMode: RefreshIndicatorTriggerMode.onEdge,
              onRefresh: () => onRefresh!(),
              child: isBusy
                  ? busyIndicatorWidget
                  : isEmpty
                      ? emptyScreen()
                      : centered
                          ? Center(child: defaultScreen())
                          : SizedBox(
                              width: double.infinity,
                              height: double.infinity,
                              child: defaultScreen()),
            )
          : isBusy
              ? busyIndicatorWidget
              : isEmpty
                  ? emptyScreen()
                  : centered
                      ? Center(child: defaultScreen())
                      : SizedBox(
                          width: double.infinity,
                          height: double.infinity,
                          child: defaultScreen());
    });
  }
}
