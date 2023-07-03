import 'package:digicard/app/views/card_display/card_display_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

class CardHolder extends StatelessWidget {
  final List<Widget> children;
  const CardHolder({
    super.key,
    required this.children,
  });

  @override
  Widget build(BuildContext context) {
    final viewModel =
        getParentViewModel<CardDisplayViewModel>(context, listen: false);
    const cardWidth = 440.000;
    return LayoutBuilder(builder: (context, size) {
      final isSmallScreen = size.maxWidth < cardWidth;
      final cardShape = RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(isSmallScreen ? 0 : 30),
        side: BorderSide(
          color: Colors.grey.withOpacity(0.2),
          width: isSmallScreen ? 0 : 2,
        ),
      );
      return SelectionArea(
        child: Container(
          margin: isSmallScreen ? EdgeInsets.zero : const EdgeInsets.all(15.0),
          child: Center(
            child: Card(
              margin: EdgeInsetsDirectional.zero,
              elevation: isSmallScreen ? 0.0 : 20.0,
              color: Colors.transparent,
              clipBehavior: Clip.hardEdge,
              shape: cardShape,
              child: Card(
                margin: EdgeInsetsDirectional.zero,
                elevation: 0,
                clipBehavior: Clip.hardEdge,
                shape: cardShape,
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 25.0),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: children),
                ),
              ),
            ),
          ),
        ),
      );
    });
  }
}
