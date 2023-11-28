import 'dart:math';
import 'package:flutter/material.dart';

class ScaffoldListWrapper extends StatelessWidget {
  final int itemCount;
  final Widget Function(BuildContext, BoxConstraints) builder;
  final Future<void> Function() onRefresh;
  final bool isBusy;
  final Widget busyIndicatorWidget;
  final Widget emptyIndicatorWidget;
  final EdgeInsets padding;
  final double? maxWidth;

  const ScaffoldListWrapper({
    Key? key,
    required this.onRefresh,
    this.isBusy = false,
    this.busyIndicatorWidget = const Center(
      child: CircularProgressIndicator(),
    ),
    required this.itemCount,
    this.emptyIndicatorWidget = const SizedBox.shrink(),
    required this.builder,
    this.padding = const EdgeInsets.all(8.0),
    this.maxWidth,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
      return ConstrainedBox(
          constraints: BoxConstraints(
            minWidth: constraints.maxWidth,
            minHeight: constraints.maxHeight,
          ),
          child: RefreshIndicator(
            strokeWidth: 3,
            triggerMode: RefreshIndicatorTriggerMode.onEdge,
            onRefresh: () => onRefresh(),
            child: isBusy
                ? busyIndicatorWidget
                : !(itemCount > 0)
                    ? CustomScrollView(slivers: [
                        ...[
                          SliverFillRemaining(
                            child: Center(
                                child: SingleChildScrollView(
                                    padding: EdgeInsets.symmetric(
                                        vertical: padding.vertical,
                                        horizontal: maxWidth != null
                                            ? max(
                                                (constraints.maxWidth -
                                                        maxWidth!) /
                                                    2,
                                                padding.horizontal)
                                            : padding.horizontal),
                                    child: emptyIndicatorWidget)),
                          )
                        ]
                      ])
                    : builder(context, constraints),
          ));
    });
  }
}
