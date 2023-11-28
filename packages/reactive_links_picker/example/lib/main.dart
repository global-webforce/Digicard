import 'package:flutter/material.dart';
import 'package:reactive_forms/reactive_forms.dart';
import 'package:reactive_links_picker/reactive_links_picker.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Reactive Links Picker Working Demo',
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
      {
        'customLinks': FormControl<List<Map<String, dynamic>>>(
            value: <Map<String, dynamic>>[],
            validators: [const NotEmptyValidator()]),
      },
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ReactiveForm(
      formGroup: form,
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Reactive Links Picker"),
          actions: [
            IconButton(
                onPressed: () {
                  debugPrint("FORM VALUE: ${form.value}");
                },
                icon: const Icon(Icons.send))
          ],
        ),
        body: ReactiveLinksPicker(
          formControlName: 'customLinks',
        ),
      ),
    );
  }
}
