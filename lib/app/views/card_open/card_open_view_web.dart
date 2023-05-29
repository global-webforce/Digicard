import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import '../../app.locator.dart';
import '../../routes/app_router.dart';

@RoutePage()
class CardWebView extends StatelessWidget {
  final String? id;
  const CardWebView({super.key, @PathParam('id') this.id});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: BackButton(
            onPressed: () => locator<AppRouter>().pop(),
          ),
          title: const Text("Card View"),
        ),
        body: Text("Card View $id"));
  }
}
