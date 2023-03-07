import 'package:digicard/app/app.logger.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

class ColorPickerViewModel extends BaseViewModel {
  final log = getLogger('ColorPickerViewModel');

  List<Color> colors = [
    Colors.red,
    Colors.pink,
    Colors.purple,
    Colors.deepPurple,
    Colors.indigo,
    Colors.blue,
    Colors.lightBlue,
    Colors.cyan,
    Colors.teal,
    Colors.green,
    Colors.lightGreen,
    Colors.lime,
    Colors.yellow,
    Colors.amber,
    Colors.orange,
    Colors.deepOrange,
    Colors.brown,
    Colors.grey,
    Colors.blueGrey,
    Colors.black,
  ];
}
