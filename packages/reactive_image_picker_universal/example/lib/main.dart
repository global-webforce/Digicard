import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:reactive_forms/reactive_forms.dart';
import 'package:reactive_image_picker_universal/reactive_image_picker_universal.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  late FormGroup form;

  @override
  void initState() {
    form = FormGroup(
      {
        'avatar': FormControl<Uint8List>(),
        'logo': FormControl<Uint8List>(),
      },
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'ReactiveImagePickerUniversal Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: ReactiveForm(
          formGroup: form,
          child: Scaffold(
            body: Column(
              children: [
                ReactiveImagePickerUniversal(
                  formControlName: 'avatar',
                ),
                ReactiveImagePickerUniversal(
                  formControlName: 'logo',
                )
              ],
            ),
          ),
        ));
  }
}
