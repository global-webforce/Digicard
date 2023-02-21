import 'package:flutter/material.dart';

class EzText extends StatelessWidget {
  final String text;
  final int? maxLines;
  final FontWeight fontWeight;
  final double fontSize;
  final Color? fontColor;
  final TextAlign? align;
  final TextOverflow? textOverflow;

  const EzText.h1(
    this.text, {
    Key? key,
    this.fontColor,
    this.align,
    this.textOverflow,
  })  : fontSize = 24,
        fontWeight = FontWeight.w600,
        maxLines = null,
        super(key: key);

  const EzText.title1(
    this.text, {
    Key? key,
    this.fontColor,
    this.align,
    this.textOverflow,
  })  : fontSize = 20,
        fontWeight = FontWeight.w600,
        maxLines = null,
        super(key: key);

  const EzText.title2(
    this.text, {
    Key? key,
    this.fontColor,
    this.align,
    this.textOverflow,
  })  : fontSize = 18,
        fontWeight = FontWeight.w600,
        maxLines = null,
        super(key: key);

  const EzText.title3(
    this.text, {
    Key? key,
    this.fontColor,
    this.align,
    this.textOverflow,
  })  : fontSize = 17,
        fontWeight = FontWeight.w600,
        maxLines = null,
        super(key: key);

  const EzText.body(
    this.text, {
    Key? key,
    this.fontColor,
    this.align,
  })  : fontSize = 15,
        fontWeight = FontWeight.normal,
        maxLines = null,
        textOverflow = TextOverflow.visible,
        super(key: key);

  const EzText.caption(
    this.text, {
    Key? key,
    this.align,
    this.fontColor,
    this.textOverflow = TextOverflow.ellipsis,
  })  : fontSize = 14,
        fontWeight = FontWeight.normal,
        maxLines = 2,
        super(key: key);

  const EzText.cardTitle1(
    this.text, {
    Key? key,
    this.fontColor,
    this.align,
    this.textOverflow,
  })  : fontSize = 18,
        fontWeight = FontWeight.w500,
        maxLines = 2,
        super(key: key);

  const EzText.cardTitle2(
    this.text, {
    Key? key,
    this.fontColor,
    this.align,
    this.textOverflow,
  })  : fontSize = 16,
        fontWeight = FontWeight.w500,
        maxLines = 2,
        super(key: key);

  const EzText.cardSubTitle(
    this.text, {
    Key? key,
    this.fontColor,
    this.align,
    this.textOverflow,
  })  : fontSize = 14,
        fontWeight = FontWeight.w400,
        maxLines = 3,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      maxLines: maxLines,
      overflow: textOverflow,
      textAlign: align,
      style: TextStyle(
        color: fontColor,
        fontSize: fontSize,
        fontWeight: fontWeight,
      ),
    );
  }
}
