import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:reactive_forms/reactive_forms.dart';
import 'package:reactive_layout_picker/reactive_layout_picker.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      scrollBehavior: MyCustomScrollBehavior(),
      debugShowCheckedModeBanner: false,
      title: 'Reactive Layout Picker Working Demo',
      themeMode: ThemeMode.dark,
      theme: ThemeData(
        inputDecorationTheme: const InputDecorationTheme(
            isDense: true,
            border: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(12))),
            filled: true),
      ),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late FormGroup form;

  @override
  void initState() {
    form = FormGroup(
      {'layout': FormControl<int>()},
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ReactiveForm(
      formGroup: form,
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Reactive Layout Picker"),
          actions: [
            IconButton(
                onPressed: () {
                  debugPrint("FORM VALUE: ${form.value}");
                },
                icon: const Icon(Icons.send))
          ],
        ),
        body: ReactiveLayoutPicker(
          primaryColor: Colors.pink,
          secondaryColor: Colors.orange,
          selectedColor: Colors.green,
          formControlName: 'layout',
        ),
      ),
    );
  }
}

class MyCustomScrollBehavior extends MaterialScrollBehavior {
  // Override behavior methods and getters like dragDevices
  @override
  Set<PointerDeviceKind> get dragDevices => {
        PointerDeviceKind.touch,
        PointerDeviceKind.mouse,
      };
}
