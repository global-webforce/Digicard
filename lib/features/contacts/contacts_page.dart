import 'package:digicard/app/app.locator.dart';
import 'package:digicard/app/shared/ui/scaffold_body_wrapper.dart';
import 'package:digicard/dashboards/user_dashboard/pages/scaffold_page.dart';
import 'package:digicard/dashboards/user_dashboard/viewmodels/home_page_viewmodel.dart';
import 'package:ez_core/ez_core.dart';
import 'package:ez_dashboard/ez_dashboard.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

class ContactsPage extends StatelessWidget {
  const ContactsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<HomePageViewModel>.reactive(
        viewModelBuilder: () => locator<HomePageViewModel>(),
        onViewModelReady: (viewModel) async {
          await viewModel.init();
        },
        builder: (context, viewModel, child) => Scaffold(
            appBar: AppBar(
              automaticallyImplyLeading: false,
              leading: ezDrawerButton(
                context,
                AppScaffold.scaffoldkey,
              ),
              title: Row(
                children: const [
                  Icon(Icons.contacts_rounded),
                  hSpaceRegular,
                  Text("CONTACTS")
                ],
              ),
            ),
            floatingActionButton: FloatingActionButton(
                backgroundColor: Colors.orange,
                child: const Icon(Icons.add),
                onPressed: () {}),
            body: ScaffoldBodyWrapper(builder: (context, constrains) {
              return const Text("DIGICARD");
            })));
  }
}
