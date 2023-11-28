import 'package:digicard/ui/common/app_colors.dart';
import 'package:flutter/material.dart';
import 'my_text.styles.dart';

class MyText extends StatelessWidget {
  final String text;
  final TextStyle style;

  const MyText.headingOne(this.text, {super.key}) : style = heading1Style;
  const MyText.headingTwo(this.text, {super.key}) : style = heading2Style;
  const MyText.headingThree(this.text, {super.key}) : style = heading3Style;
  const MyText.headline(this.text, {super.key}) : style = headlineStyle;
  const MyText.subheading(this.text, {super.key}) : style = subheadingStyle;
  const MyText.caption(this.text, {super.key}) : style = captionStyle;

  MyText.body(this.text, {super.key, Color color = kcMediumGrey})
      : style = bodyStyle.copyWith(color: color);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: style,
    );
  }
}
