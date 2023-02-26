import 'package:digicard/app/app.locator.dart';
import 'package:digicard/app/constants/keys.dart';
import 'package:digicard/app/ui/_core/scaffold_body_wrapper.dart';
import 'package:digicard/app/views/contacts/contacts_view_view_model.dart';
import 'package:ez_core/ez_core.dart';
import 'package:ez_dashboard/ez_dashboard.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

class ContactsView extends StatelessWidget {
  const ContactsView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<ContactsViewModel>.reactive(
        viewModelBuilder: () => locator<ContactsViewModel>(),
        disposeViewModel: false,
        builder: (context, viewModel, child) => Scaffold(
            appBar: AppBar(
              automaticallyImplyLeading: false,
              leading: ezDrawerButton(context, dashboardScaffoldKey),
              title: Row(
                children: const [
                  Icon(Icons.contacts_rounded),
                  hSpaceRegular,
                  Text("CONTACTS")
                ],
              ),
            ),
            body: ScaffoldBodyWrapper(builder: (context, constrains) {
              return const Text("DIGICARD");
            })));
  }
}
