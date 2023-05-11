import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

@RoutePage()
class CardWebView extends StatelessWidget {
  final String? id;
  const CardWebView({super.key, @PathParam('id') this.id});

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Text("Card View $id"));
  }
}
