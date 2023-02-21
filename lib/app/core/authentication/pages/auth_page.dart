import 'package:auto_route/auto_route.dart';
import 'package:digicard/app/app_view_model.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

class AuthPage extends StatelessWidget {
  AuthPage({Key? key}) : super(key: key);

  final PageController _pageViewController =
      PageController(initialPage: 1, keepPage: false);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<AppViewModel>.reactive(
        viewModelBuilder: () => AppViewModel(),
        onViewModelReady: (_) {},
        builder: (context, viewModel, child) {
          return Scaffold(
              body: AutoRouter(
                  key: const GlobalObjectKey('welcome-router'),
                  builder: (context, content) {
                    final kContent = KeyedSubtree(
                      key: const GlobalObjectKey('welcome-content-main'),
                      child: content,
                    );

                    return kContent;
                  }));
        });
  }
}
