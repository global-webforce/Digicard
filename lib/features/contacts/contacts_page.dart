import 'package:digicard/app/app.locator.dart';
import 'package:digicard/app/shared/ui/scaffold_body_wrapper.dart';
import 'package:digicard/dashboards/user_dashboard/pages/dashboard_view.dart';
import 'package:digicard/dashboards/user_dashboard/viewmodels/home_page_viewmodel.dart';
import 'package:ez_core/ez_core.dart';
import 'package:ez_dashboard/ez_dashboard.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

class ContactsView extends StatelessWidget {
  const ContactsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<HomeViewViewModel>.reactive(
        viewModelBuilder: () => locator<HomeViewViewModel>(),
        onViewModelReady: (viewModel) async {
          await viewModel.init();
        },
        disposeViewModel: false,
        builder: (context, viewModel, child) => Scaffold(
            appBar: AppBar(
              automaticallyImplyLeading: false,
              leading: ezDrawerButton(
                context,
                DashboardParts.scaffoldkey,
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
