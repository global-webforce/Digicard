import 'package:digicard/app/app.locator.dart';
import 'package:digicard/app/helper/screen_size.dart';
import 'package:digicard/app/ui/_core/spacer.dart';
import 'package:digicard/app/views/_core/dashboard/dashboard_view.dart';
import 'package:digicard/app/views/contacts/contacts_view_model.dart';
import 'package:digicard/app/views/contacts/widgets/alphabet_list.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

class ContactsView extends StatelessWidget {
  const ContactsView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<ContactsViewModel>.reactive(
        viewModelBuilder: () => locator<ContactsViewModel>(),
        onViewModelReady: (viewModel) async {
          await viewModel.init();
        },
        fireOnViewModelReadyOnce: true,
        onDispose: (viewModel) {
          viewModel.clearFilter();
        },
        disposeViewModel: false,
        builder: (context, viewModel, child) {
          PreferredSizeWidget searchField() {
            return AppBar(
              toolbarHeight: 60,
              automaticallyImplyLeading: false,
              title: Center(
                child: ClipRRect(
                  borderRadius: const BorderRadius.all(Radius.circular(5.0)),
                  child: TextField(
                    onChanged: (value) {
                      viewModel.filter();
                    },
                    controller: viewModel.editingController,
                    textAlign: TextAlign.left,
                    decoration: const InputDecoration(
                      contentPadding: EdgeInsets.fromLTRB(16, 12, 16, 12),
                      hintText: 'Search',
                      border: InputBorder.none,
                    ),
                  ),
                ),
              ),
            );
          }

          return Scaffold(
              appBar:
                  AppBar(title: const Text("CONTACTS"), bottom: searchField()),
              drawer: isDesktop(context) ? null : const $EzDrawer(),
              bottomNavigationBar: const $EZBottomNavbar(),
              body: const AlphabetList());
        });
  }
}
