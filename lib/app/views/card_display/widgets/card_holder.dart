import 'package:flutter/material.dart';

class CardHolder extends StatelessWidget {
  final List<Widget> children;
  const CardHolder({
    super.key,
    required this.children,
  });

  @override
  Widget build(BuildContext context) {
    const cardWidth = 480.000;
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
              elevation: 0,
              clipBehavior: Clip.hardEdge,
              shape: cardShape,
              child: Padding(
                padding: const EdgeInsets.only(bottom: 120.0),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: children),
              ),
            ),
          ),
        ),
      );
    });
  }
}
