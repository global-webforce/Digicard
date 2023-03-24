import 'package:alphabet_scroll_view/alphabet_scroll_view.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:digicard/app/app.locator.dart';
import 'package:digicard/app/constants/keys.dart';
import 'package:digicard/app/extensions/color.dart';
import 'package:digicard/app/ui/_shared/app_colors.dart';
import 'package:digicard/app/views/contacts/contacts_view_view_model.dart';
import 'package:ez_core/ez_core.dart';
import 'package:ez_dashboard/ez_dashboard.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

class ContactsView extends StatelessWidget {
  const ContactsView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<ContactsViewModel>.reactive(
        viewModelBuilder: () => locator<ContactsViewModel>(),
        onViewModelReady: (viewModel) {
          viewModel.clearFilter();
        },
        disposeViewModel: false,
        builder: (context, viewModel, child) => Scaffold(
              appBar: AppBar(
                automaticallyImplyLeading: false,
                leading: ezDrawerButton(context, dashboardScaffoldKey),
                title: Row(
                  children: const [
                    Icon(Icons.contacts_rounded),
                    hSpaceRegular,
                    Text("CONTACTS")
                  ],
                ),
              ),
              body: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(15, 15, 15, 0),
                    child: TextField(
                      onChanged: (value) {
                        viewModel.filter();
                      },
                      controller: viewModel.editingController,
                      decoration: InputDecoration(
                          floatingLabelBehavior: FloatingLabelBehavior.never,
                          labelText: "Search",
                          hintText: "Search",
                          prefixIcon: const Icon(
                            Icons.search,
                            size: 25,
                          ),
                          suffixIcon: GestureDetector(
                              onTap: () {
                                viewModel.clearFilter();
                              },
                              child: const Icon(
                                Icons.close,
                                size: 25,
                              )),
                          border: const OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10.0)))),
                    ),
                  ),
                  const SizedBox(height: 5),
                  Expanded(
                    child: AlphabetScrollView(
                      list: viewModel.cards
                          .map((e) => AlphaModel(
                              "${e.fullname?.firstName} ${e.fullname?.lastName}",
                              secondaryKey: "${e.fullname?.lastName}"))
                          .toList(),
                      // isAlphabetsFiltered: false,

                      alignment: LetterAlignment.right,
                      itemExtent: 70,

                      unselectedTextStyle: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.normal,
                      ),
                      selectedTextStyle: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: kcPrimaryColor),
                      overlayWidget: (value) => Stack(
                        alignment: Alignment.center,
                        children: [
                          const Icon(Icons.star,
                              size: 50, color: kcPrimaryColor),
                          Container(
                            height: 50,
                            width: 50,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: Theme.of(context).primaryColor,
                            ),
                            alignment: Alignment.center,
                            child: Text(
                              value.toUpperCase(),
                              style: const TextStyle(
                                  fontSize: 18, color: Colors.white),
                            ),
                          ),
                        ],
                      ),

                      itemBuilder: (_, k, id) {
                        return Padding(
                          padding: const EdgeInsets.only(right: 20, top: 10),
                          child: ListTile(
                              onTap: () {
                                FocusScopeNode currentFocus =
                                    FocusScope.of(context);

                                if (!currentFocus.hasPrimaryFocus) {
                                  currentFocus.unfocus();
                                }
                                viewModel.view(viewModel.cards[k]);
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
                                      imageUrl:
                                          "${viewModel.cards[k].profileImage}",
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
                                id,
                                style: const TextStyle(fontSize: 16),
                              ),
                              subtitle: Text(
                                "${viewModel.cards[k].position} @ ${viewModel.cards[k].company}",
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                                style: const TextStyle(),
                              ),
                              trailing: Padding(
                                padding: const EdgeInsets.only(right: 15.0),
                                child: CircleAvatar(
                                  radius: 6,
                                  backgroundColor: HexColor.fromHex(
                                          "${viewModel.cards[k].color}") ??
                                      kcPrimaryColor,
                                ),
                              )),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ));
  }
}
