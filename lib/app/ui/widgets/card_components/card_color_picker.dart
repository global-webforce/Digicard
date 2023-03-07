import 'package:flutter/material.dart';

class CardColorPicker extends StatelessWidget {
  final Function()? onTap;
  const CardColorPicker({Key? key, this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Material(
        color: Colors.black.withOpacity(0.7),
        borderRadius: BorderRadius.circular(10),
        child: InkWell(
          borderRadius: BorderRadius.circular(10),
          onTap: onTap != null
              ? () {
                  // FocusScope.of(context).requestFocus(FocusNode());
                  onTap!();
                }
              : null,
          child: Container(
            padding: const EdgeInsets.all(2),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: Colors.white)),
            child: const RadiantGradientMask(
              child: Icon(
                Icons.color_lens_rounded,
                size: 40,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class RadiantGradientMask extends StatelessWidget {
  const RadiantGradientMask({super.key, required this.child});
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return ShaderMask(
      shaderCallback: (bounds) => const LinearGradient(
        colors: [
          Colors.yellow,
          Colors.red,
          Colors.indigo,
          Colors.teal,
        ],
        tileMode: TileMode.mirror,
      ).createShader(bounds),
      child: child,
    );
  }
}
