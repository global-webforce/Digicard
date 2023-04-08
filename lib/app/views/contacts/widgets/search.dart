import 'package:digicard/app/views/contacts/contacts_view_model.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

class SearchField extends StatelessWidget with PreferredSizeWidget {
  const SearchField({super.key});

  @override
  Size get preferredSize => const Size(0, 40);

  @override
  Widget build(BuildContext context) {
    final viewModel = getParentViewModel<ContactsViewModel>(context);

    return PreferredSize(
      preferredSize: const Size(0, 70),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(12, 0, 12, 10),
        child: Container(
          height: 20,
          decoration: BoxDecoration(
            color: Colors.white.withOpacity(0.2),
            borderRadius: BorderRadius.circular(0),
          ),
          child: Center(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(20, 4, 0, 0),
              child: TextField(
                onChanged: (value) {
                  viewModel.filter();
                },
                controller: viewModel.editingController,
                textAlign: TextAlign.left,
                decoration: const InputDecoration(
                    filled: false,
                    border: InputBorder.none,
                    errorBorder: InputBorder.none,
                    enabledBorder: InputBorder.none,
                    hintText: 'Searchx'),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
