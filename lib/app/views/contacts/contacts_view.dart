import 'package:digicard/app/app.locator.dart';
import 'package:digicard/app/ui/_core/empty_display.dart';
import 'package:digicard/app/views/dashboard/dashboard_view.dart';
import 'package:digicard/app/views/contacts/contacts_view_model.dart';
import 'package:digicard/app/views/contacts/widgets/contacts.alphabet_list.dart';
import 'package:digicard/app/views/contacts/widgets/contacts.search_delegate.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
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
          return DashboardBuilder(onPop: (v) {
            v.setIndex(0);
            return Future.value(false);
          }, builder: (context, child) {
            return Scaffold(
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
              ),
              drawer: child.drawer,
              bottomNavigationBar: child.bottomNavBar,
              body: viewModel.isBusy
                  ? const Expanded(
                      child: Center(
                        child: CircularProgressIndicator(),
                      ),
                    )
                  : viewModel.cards.isEmpty
                      ? const EmptyDisplay(
                          icon: FontAwesomeIcons.addressBook,
                          title: "You have no contacts yet.")
                      : RefreshIndicator(
                          onRefresh: () async {}, child: const AlphabetList()),
            );
          });
        });
  }
}
