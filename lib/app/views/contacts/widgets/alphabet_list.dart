import 'package:alphabet_list_view/alphabet_list_view.dart';
import 'package:cached_network_image/cached_network_image.dart';
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
        topOffset: 15,
        stickySectionHeader: false,
        afterList: vSpaceRegular,
        listHeaderBuilder: (context, symbol) {
          return Container(
            padding: const EdgeInsets.symmetric(horizontal: 15),
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
        symbolBuilder: (context, symbol, state) {
          return state.name == "deactivated"
              ? const SizedBox.shrink()
              : Center(
                  child: Text(
                  symbol,
                  style: TextStyle(
                      color: state.name == "active"
                          ? kcPrimaryColor
                          : state.name == "inactive"
                              ? null
                              : Colors.grey),
                ));
        },
      ),
      overlayOptions: const OverlayOptions(
        showOverlay: true,
      ),
    );

    return AlphabetListView(
        options: options,
        items: viewModel.cards.entries.map((entry) {
          return AlphabetListViewItemGroup(
              tag: entry.key,
              children: entry.value.map((card) {
                return ListTile(
                    onTap: () {
                      viewModel.view(card);
                    },
                    leading: Ink(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: ClipRRect(
                          borderRadius: BorderRadius.circular(5),
                          child: CachedNetworkImage(
                            width: 50,
                            height: 50,
                            imageUrl: "${card.profileImage}",
                            imageBuilder: (context, imageProvider) {
                              return Center(
                                child: Container(
                                  decoration: BoxDecoration(
                                      image: DecorationImage(
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
                          )),
                    ),
                    title: Text(
                      "${card.firstName} ${card.lastName}",
                      style: const TextStyle(fontSize: 16),
                    ),
                    subtitle: Text(
                      "${card.position} @ ${card.company}",
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(),
                    ),
                    trailing: Padding(
                      padding: const EdgeInsets.only(right: 15.0),
                      child: CircleAvatar(
                          radius: 6,
                          backgroundColor:
                              Color(card.color ?? kcPrimaryColorInt)),
                    ));
              }));
        }).toList());
  }
}
