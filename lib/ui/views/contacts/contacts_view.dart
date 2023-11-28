import 'package:digicard/ui/views/dashboard/widgets/page_scaffold.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ez_core/widgets/ez_empty_display.dart';
import 'package:stacked/stacked.dart';
import 'contacts_viewmodel.dart';

class ContactsView extends StackedView<ContactsViewModel> {
  const ContactsView({Key? key}) : super(key: key);

  @override
  bool get disposeViewModel => false;

  @override
  bool get fireOnViewModelReadyOnce => false;

  @override
  Widget builder(
    BuildContext context,
    ContactsViewModel viewModel,
    Widget? child,
  ) {
    return const PageScaffold(
      title: "CONTACTS",
      body: EZEmptyDisplay(
        icon: Icon(Icons.error_rounded, size: 30),
        title: "Ooops! looks empty here",
      ),
    );
  }

  @override
  ContactsViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      ContactsViewModel();
}
