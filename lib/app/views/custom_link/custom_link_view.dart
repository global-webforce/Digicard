import 'package:digicard/app/app.locator.dart';
import 'package:digicard/app/models/custom_link.dart';
import 'package:digicard/app/ui/_core/scaffold_body_wrapper.dart';
import 'package:digicard/app/views/custom_link/custom_link_view_model.dart';
import 'package:digicard/app/views/custom_link/widgets/card_form.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

class CustomLinkView extends StatelessWidget {
  final CustomLink customLink;
  final int? index;
  const CustomLinkView(this.customLink, {Key? key, this.index})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<CustomLinkViewModel>.reactive(
        viewModelBuilder: () => locator<CustomLinkViewModel>(),
        onViewModelReady: (viewModel) {
          viewModel.initialize(customLink);
        },
        disposeViewModel: false,
        builder: (context, viewModel, child) => Scaffold(
              appBar: AppBar(
                leading: const BackButton(),
              ),
              body: ScaffoldBodyWrapper(
                  neverScroll: true,
                  centered: true,
                  builder: (context, size) {
                    return const CLForm();
                  }),
            ));
  }
}
