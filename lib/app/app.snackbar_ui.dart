import 'package:digicard/app/app.locator.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:stacked_services/stacked_services.dart';

enum SnackbarType { successful, error }

Future<void> setupSnackBarUI() async {
  await locator.allReady();
  final service = locator<SnackbarService>();
  service.registerCustomSnackbarConfig(
    variant: SnackbarType.successful,
    config: SnackbarConfig(
      padding: const EdgeInsets.all(18),
      backgroundColor: Colors.deepOrangeAccent,
      textColor: Colors.white,
      snackPosition: SnackPosition.BOTTOM,
      snackStyle: SnackStyle.FLOATING,
      borderRadius: 10,
      margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
      icon: const Icon(
        FontAwesomeIcons.download,
        color: Colors.white,
        size: 20,
      ),
    ),
  );
  service.registerCustomSnackbarConfig(
    variant: SnackbarType.error,
    config: SnackbarConfig(
      padding: const EdgeInsets.all(18),
      backgroundColor: Colors.red,
      textColor: Colors.white,
      snackPosition: SnackPosition.TOP,
      margin: const EdgeInsets.all(15),

      snackStyle: SnackStyle.FLOATING,
      borderRadius: 10,
      //borderRadius: 48,
      icon: const Icon(
        Icons.info,
        color: Colors.white,
        size: 20,
      ),
    ),
  );
}
