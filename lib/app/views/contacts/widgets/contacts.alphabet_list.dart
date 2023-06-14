import 'package:alphabet_list_view/alphabet_list_view.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:digicard/app/constants/env.dart';
import 'package:digicard/app/constants/typography.dart';
import 'package:digicard/app/ui/_core/spacer.dart';
import 'package:digicard/app/constants/colors.dart';
import 'package:digicard/app/views/contacts/contacts_view_model.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

class AlphabetList extends StatelessWidget {
  const AlphabetList({super.key});

  @override
  Widget build(BuildContext context) {
    final viewModel =
        getParentViewModel<ContactsViewModel>(context, listen: true);

    final AlphabetListViewOptions options = AlphabetListViewOptions(
      listOptions: ListOptions(
        topOffset: 0,
        stickySectionHeader: false,
        afterList: vSpaceRegular,
        listHeaderBuilder: (context, symbol) {
          return Container(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 0),
            decoration: BoxDecoration(
              color: null,
              borderRadius: BorderRadius.circular(100),
            ),
            child: Text(
              symbol,
              style: headline,
            ),
          );
        },
      ),
      scrollbarOptions: ScrollbarOptions(
        width: 30,
        backgroundColor: Colors.transparent,
        symbols: DefaultScrollbarSymbols.alphabet,
        jumpToSymbolsWithNoEntries: false,
        padding: const EdgeInsets.all(5),
        mainAxisAlignment: MainAxisAlignment.center,
        symbolBuilder: (context, symbol, state) {
          return state.name == "deactivated"
              ? const SizedBox.shrink()
              : Text(
                  symbol,
                  overflow: TextOverflow.clip,
                  style: TextStyle(
                      color: state.name == "active"
                          ? kcPrimaryColor
                          : state.name == "inactive"
                              ? null
                              : Colors.grey),
                );
        },
      ),
      overlayOptions: const OverlayOptions(
        showOverlay: true,
      ),
    );

    return AlphabetListView(
        options: options,
        items: viewModel.contacts.entries.map((entry) {
          return AlphabetListViewItemGroup(
              tag: entry.key,
              children: entry.value.map((card) {
                return InkWell(
                  onTap: () {
                    viewModel.view(card);
                  },
                  child: Ink(
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(18, 7, 15, 7),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(top: 12.0),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(5),
                              child: Container(
                                  height: 25,
                                  width: 5,
                                  color:
                                      Color(card.color ?? kcPrimaryColorInt)),
                            ),
                          ),
                          hSpaceSmall,
                          ClipRRect(
                            borderRadius: BorderRadius.circular(5),
                            child: CachedNetworkImage(
                              width: 50,
                              height: 50,
                              imageUrl: "$avatarUrlPrefix${card.avatarUrl}",
                              imageBuilder: (context, imageProvider) {
                                return Center(
                                  child: Container(
                                    decoration: BoxDecoration(
                                        image: DecorationImage(
                                            fit: BoxFit.cover,
                                            image: imageProvider)),
                                  ),
                                );
                              },
                              placeholder: (context, url) {
                                return Container(
                                  color: Colors.grey,
                                );
                              },
                              errorWidget: (context, url, error) {
                                return Container(
                                  color: Colors.grey,
                                );
                              },
                            ),
                          ),
                          hSpaceRegular,
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Text(
                                  "${card.firstName ?? ""} ${card.lastName ?? ""}",
                                  maxLines: 1,
                                  style: const TextStyle(fontSize: 16),
                                ),
                                Text(
                                  "${card.position ?? ''} ${card.company != null ? '@ ${card.company}' : ''}"
                                      .trim(),
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                  style: const TextStyle(fontSize: 14),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              }));
        }).toList());
  }
}
