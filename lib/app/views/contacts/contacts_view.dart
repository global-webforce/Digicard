import 'package:alphabet_list_view/alphabet_list_view.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:digicard/app/app.locator.dart';
import 'package:digicard/app/constants/keys.dart';
import 'package:digicard/app/constants/typography.dart';
import 'package:digicard/app/extensions/color_extension.dart';
import 'package:digicard/app/ui/_core/dashboard/ez_drawer_button.dart';
import 'package:digicard/app/ui/_core/scaffold_list_wrapper.dart';
import 'package:digicard/app/ui/_core/spacer.dart';
import 'package:digicard/app/ui/_shared/app_colors.dart';
import 'package:digicard/app/views/contacts/contacts_view_model.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

class ItemModel {
  ItemModel({required this.name});
  String name;
}

class GroupModel {
  GroupModel({required this.name, required this.items});
  String name;
  List<ItemModel> items;
}

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
          final inputStyle = InputDecoration(
              alignLabelWithHint: true,
              filled: true,
              border: const UnderlineInputBorder(),
              enabledBorder: const UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.grey),
              ),
              prefixIcon: const Padding(
                  padding: EdgeInsets.fromLTRB(15, 14, 15, 0),
                  child: Icon(
                    Icons.search,
                    size: 25,
                  )),
              suffixIcon: Padding(
                  padding: const EdgeInsets.fromLTRB(15, 14, 15, 0),
                  child: InkWell(
                      onTap: () {
                        viewModel.clearFilter();
                      },
                      child: const Icon(
                        Icons.close_rounded,
                        size: 25,
                      ))),
              prefixIconConstraints:
                  const BoxConstraints(minWidth: 0, minHeight: 0),
              suffixIconConstraints:
                  const BoxConstraints(minWidth: 0, minHeight: 0),
              floatingLabelBehavior: FloatingLabelBehavior.never);

          Widget searchField() {
            return TextField(
                onChanged: (value) {
                  viewModel.filter();
                },
                controller: viewModel.editingController,
                decoration: inputStyle.copyWith(
                  labelText: "Search",
                  hintText: "Search",
                ));
          }

          final AlphabetListViewOptions options = AlphabetListViewOptions(
            listOptions: ListOptions(
              topOffset: 15,
              physics: const BouncingScrollPhysics(),
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
              backgroundColor: Colors.transparent,
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

          Widget list() {
            return AlphabetListView(
                options: options,
                items: viewModel.cards.entries.map((entry) {
                  return AlphabetListViewItemGroup(
                      tag: entry.key,
                      children: entry.value.map((card) {
                        return ListTile(
                            onTap: () {},
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
                              "${card.fullname?.firstName} ${card.fullname?.lastName}",
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
                                    ColorExtension.fromHex("${card.color}") ??
                                        kcPrimaryColor,
                              ),
                            ));
                      }));
                }).toList());
          }

          return Scaffold(
              appBar: AppBar(
                automaticallyImplyLeading: false,
                leading:
                    EzDrawerMenu(context, scaffoldkey: scaffoldKey, onTap: () {
                  final FocusScopeNode currentScope = FocusScope.of(context);
                  if (!currentScope.hasPrimaryFocus && currentScope.hasFocus) {
                    FocusManager.instance.primaryFocus?.unfocus();
                  }
                }),
                title: Row(
                  children: const [
                    Icon(Icons.contacts_rounded),
                    hSpaceRegular,
                    Text("CONTACTS")
                  ],
                ),
              ),
              body: ScaffoldListWrapper(
                  isBusy: viewModel.isBusy,
                  onRefresh: () async {
                    await viewModel.init();
                  },
                  itemCount: viewModel.cards.length,
                  builder: (context, size) {
                    return Column(
                      children: [
                        searchField(),
                        Expanded(child: list()),
                      ],
                    );
                  }));
        });
  }
}
