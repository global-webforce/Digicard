import 'package:auto_route/auto_route.dart';
import 'package:digicard/app/app.locator.dart';
import 'package:digicard/app/routes/app_router.dart';
import 'package:flutter/material.dart';

@RoutePage()
class CardWebView extends StatelessWidget {
  final String? id;
  const CardWebView({super.key, @PathParam('id') this.id});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: BackButton(
            onPressed: () {
              locator<AppRouter>().back();
            },
          ),
          title: const Text("Card View"),
        ),
        body: Text("Card View $id"));
  }
}
