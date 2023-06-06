import 'package:digicard/app/app.locator.dart';
import 'package:digicard/app/extensions/string_extension.dart';
import 'package:digicard/app/views/card_open/card_open_view.dart';
import 'package:flutter/material.dart';
import 'package:stacked_services/stacked_services.dart';

import '../../../models/digital_card.dart';
import '../../card_open/card_open_viewmodel.dart';

class MySearchDelegate extends SearchDelegate<String> {
  final List<DigitalCard> items;

  MySearchDelegate(this.items);

  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        icon: const Icon(Icons.clear),
        onPressed: () {
          query = '';
        },
      ),
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    // Icon to the left of the search bar (e.g. back button)
    return IconButton(
      icon: const Icon(Icons.arrow_back),
      onPressed: () {
        close(context, '');
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    if (query.isEmpty) {
      // Return an empty container if the search bar is empty
      return Container();
    } else {
      final List<DigitalCard> suggestions = items
          .where((e) =>
              "${e.firstName} ${e.lastName}"
                  .toLowerCase()
                  .contains(query.toLowerCase()) ||
              "${e.position} ${e.company}"
                  .toLowerCase()
                  .contains(query.toLowerCase()))
          .toList();

      return ListView.builder(
        itemCount: suggestions.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text("${suggestions[index]} @"),
            onTap: () {
              close(context, "${suggestions[index].firstName}");
            },
          );
        },
      );
    }
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    if (query.isEmpty) {
      // Return an empty container if the search bar is empty
      return Container();
    } else {
      final List<DigitalCard> contacts = items
          .where((e) =>
              "${e.firstName} ${e.lastName}"
                  .toLowerCase()
                  .contains(query.toLowerCase()) ||
              "${e.position} ${e.company}"
                  .toLowerCase()
                  .contains(query.toLowerCase()))
          .toList();

      return ListView.builder(
        itemCount: contacts.length,
        itemBuilder: (context, index) {
          final contact = contacts[index];
          return ListTile(
            title: Text(
                "${contact.firstName ?? ''} ${contact.lastName ?? ''}".clean()),
            subtitle: Row(
              children: [
                if (contact.position.isNotNullOrEmpty())
                  Text("${contact.position}"),
                if (contact.company.isNotNullOrEmpty()) const Text(" @ "),
                if (contact.company.isNotNullOrEmpty())
                  Text("${contact.company}"),
              ],
            ),
            onTap: () {
              close(context, "");
              locator<NavigationService>().navigateToView(CardOpenView(
                actionType: ActionType.view,
                card: contact,
              ));
            },
          );
        },
      );
    }
  }
}
