import 'package:flutter/widgets.dart';

class GrayscaleColorFiltered extends StatelessWidget {
  final bool enabled;
  final Widget child;

  const GrayscaleColorFiltered(
      {Key? key, required this.child, this.enabled = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return enabled
        ? ColorFiltered(
            colorFilter: const ColorFilter.matrix(<double>[
              0.2126, 0.7152, 0.0722, 0, 0, //
              0.2126, 0.7152, 0.0722, 0, 0,
              0.2126, 0.7152, 0.0722, 0, 0,
              0, 0, 0, 1, 0,
            ]),
            child: child,
          )
        : child;
  }
}
