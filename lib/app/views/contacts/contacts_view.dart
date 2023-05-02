import 'package:digicard/app/app.locator.dart';
import 'package:digicard/app/views/_core/dashboard/dashboard_view.dart';
import 'package:digicard/app/views/_core/dashboard/dashboard_viewmodel.dart';
import 'package:digicard/app/views/contacts/contacts_view_model.dart';
import 'package:digicard/app/views/contacts/widgets/contacts.alphabet_list.dart';
import 'package:digicard/app/views/contacts/widgets/contacts.search_delegate.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

class ContactsView extends StatelessWidget {
  const ContactsView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<ContactsViewModel>.reactive(
        viewModelBuilder: () => locator<ContactsViewModel>(),
        onViewModelReady: (viewModel) async {},
        disposeViewModel: false,
        builder: (context, viewModel, child) {
          return DashboardBuilder(builder: (context, parts) {
            return WillPopScope(
              onWillPop: () async {
                getParentViewModel<DashboardViewModel>(context, listen: false)
                    .setIndex(0);
                return false;
              },
              child: Scaffold(
                appBar: AppBar(
                  title: const Text("CONTACTS"),
                  actions: [
                    IconButton(
                      onPressed: () {
                        showSearch(
                          useRootNavigator: true,
                          context: context,
                          delegate: MySearchDelegate(viewModel.cardList),
                        );
                      },
                      icon: const Icon(
                        Icons.search_rounded,
                      ),
                    )
                  ],
                  //   bottom: searchField(),
                ),
                drawer: parts.drawer,
                bottomNavigationBar: parts.bottomNavBar,
                body: viewModel.isBusy
                    ? const Center(
                        child: CircularProgressIndicator(),
                      )
                    : RefreshIndicator(
                        onRefresh: () async {}, child: const AlphabetList()),
              ),
            );
          });
        });
  }
}
