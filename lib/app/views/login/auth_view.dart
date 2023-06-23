import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

class AuthView extends StatelessWidget {
  const AuthView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AutoRouter(
        key: const GlobalObjectKey('welcome-router'),
        builder: (context, content) {
          final kContent = KeyedSubtree(
            key: const GlobalObjectKey('welcome-content-main'),
            child: content,
          );
          return kContent;
        });
  }
}
