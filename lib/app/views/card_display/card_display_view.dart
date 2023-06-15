import 'dart:ui';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:collection/collection.dart';
import 'package:digicard/app/app.locator.dart';
import 'package:digicard/app/constants/env.dart';
import 'package:digicard/app/extensions/color_extension.dart';
import 'package:digicard/app/extensions/custom_link_extension.dart';
import 'package:digicard/app/extensions/digital_card_extension.dart';
import 'package:digicard/app/extensions/string_extension.dart';
import 'package:digicard/app/helper/screen_size.dart';
import 'package:digicard/app/models/digital_card.dart';
import 'package:digicard/app/routes/app_router.dart';
import 'package:digicard/app/services/_core/user_service.dart';
import 'package:digicard/app/services/contacts_service.dart';
import 'package:digicard/app/ui/_core/scaffold_body_wrapper.dart';
import 'package:digicard/app/views/card_editor/widgets/icon_list_item.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';
import 'package:stacked/stacked.dart';
import 'package:url_launcher/url_launcher.dart';
import '../card_editor/widgets/card.wave_divider.dart';
import 'card_display_viewmodel.dart';

class CardDisplayView extends StatelessWidget {
  final DigitalCard card;
  final DisplayType action;
  const CardDisplayView({Key? key, required this.card, required this.action})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<CardDisplayViewModel>.reactive(
        viewModelBuilder: () => locator<CardDisplayViewModel>(),
        disposeViewModel: false,
        onViewModelReady: (model) {
          model.card = card;
        },
        builder: (context, viewModel, child) {
          Widget avatarField() {
            return CachedNetworkImage(
              imageUrl: "$avatarUrlPrefix${card.avatarUrl}",
              imageBuilder: (context, imageProvider) {
                return ConstrainedBox(
                  constraints: const BoxConstraints(
                    maxHeight: 450,
                    minWidth: double.infinity,
                  ),
                  child: AspectRatio(
                    aspectRatio: 1 / 1,
                    child: Container(
                      decoration: BoxDecoration(
                        color: viewModel.color.darken(0.2),
                        image: DecorationImage(
                            image: imageProvider, fit: BoxFit.cover),
                      ),
                      child: ClipRRect(
                        child: BackdropFilter(
                          filter: ImageFilter.blur(sigmaX: 20, sigmaY: 20),
                          child: Container(
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                  image: imageProvider, fit: BoxFit.contain),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                );
              },
              placeholder: (context, url) {
                return ConstrainedBox(
                  constraints: const BoxConstraints(
                    maxHeight: 450,
                    minWidth: double.infinity,
                  ),
                  child: AspectRatio(
                    aspectRatio: 1 / 1,
                    child: Container(
                      decoration:
                          BoxDecoration(color: viewModel.color.darken(0.2)),
                    ),
                  ),
                );
              },
              errorWidget: (context, url, error) {
                return Container(
                  height: 130,
                  decoration: BoxDecoration(color: viewModel.color.darken(0.2)),
                );
              },
            );
          }

          Widget logoField() {
            return CachedNetworkImage(
              imageUrl: "$logoUrlPrefix${card.logoUrl}",
              imageBuilder: (context, imageProvider) {
                return AspectRatio(
                  aspectRatio: 1 / 1,
                  child: ClipRRect(
                    child: Container(
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: imageProvider,
                          fit: BoxFit.contain,
                        ),
                      ),
                    ),
                  ),
                );
              },
              errorWidget: (context, url, error) {
                return const SizedBox.shrink();
              },
            );
          }

          Widget fullNameField() {
            return Padding(
              padding: const EdgeInsets.only(bottom: 8.0),
              child: Text(
                card.fullName().clean().toTitleCase(),
                overflow: TextOverflow.visible,
                style:
                    const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),
            );
          }

          Widget positionField() {
            return !"${card.position}".isNotNullOrEmpty()
                ? const SizedBox.shrink()
                : Padding(
                    padding: const EdgeInsets.only(bottom: 8.0),
                    child: Text(
                      "${card.position}".clean().toTitleCase(),
                      style: const TextStyle(),
                    ),
                  );
          }

          Widget departmentField() {
            return !"${card.department}".isNotNullOrEmpty()
                ? const SizedBox.shrink()
                : Padding(
                    padding: const EdgeInsets.only(bottom: 8.0),
                    child: Text(
                      "${card.department}".clean().toTitleCase(),
                      style: const TextStyle(),
                    ),
                  );
          }

          Widget companyField() {
            return !"${card.company}".isNotNullOrEmpty()
                ? const SizedBox.shrink()
                : IconListItem(
                    icon: Icons.domain,
                    text: "${card.company}".clean().toTitleCase(),
                    textStyle: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: viewModel.color,
                    ),
                  );
          }

          Widget headlineField() {
            return !"${card.headline}".isNotNullOrEmpty()
                ? const SizedBox.shrink()
                : Padding(
                    padding: const EdgeInsets.only(bottom: 8.0),
                    child: Text(
                      "${card.headline}".clean().toTitleCase(),
                      style: const TextStyle(),
                    ),
                  );
          }

          Widget pronounsField() {
            return !"${card.preferredName}".isNotNullOrEmpty() &&
                    !"${card.pronouns}".isNotNullOrEmpty()
                ? const SizedBox.shrink()
                : IconListItem(
                    color: Colors.transparent,
                    icon: Icons.chat_rounded,
                    text: "Goes By ${card.preferredName} ( ${card.pronouns} )"
                        .clean()
                        .toTitleCase(),
                  );
          }

          Widget dateCreated() {
            return !"${card.createdAt}".isNotNullOrEmpty()
                ? const SizedBox.shrink()
                : IconListItem(
                    color: Colors.transparent,
                    icon: FontAwesomeIcons.circleInfo,
                    text:
                        "Created ${DateFormat('MMM dd, yyyy hh:mm a').format(card.createdAt ?? DateTime.now())}"
                            .clean(),
                  );
          }

          Widget dateAdded() {
            return !"${card.createdAt}".isNotNullOrEmpty()
                ? const SizedBox.shrink()
                : IconListItem(
                    color: Colors.transparent,
                    icon: FontAwesomeIcons.handshake,
                    text:
                        "Added ${DateFormat('MMM dd, yyyy hh:mm a').format(card.addedAt ?? DateTime.now())}"
                            .clean(),
                  );
          }

          Widget customLinks() {
            return Wrap(
              runSpacing: 8,
              spacing: 8,
              children: card.customLinks.map((e) {
                return GestureDetector(
                    onTap: (e.extras().uri != null)
                        ? () async {
                            if (await launchUrl(e.extras().uri ?? Uri())) {
                              throw Exception(
                                  'Could not launch ${e.extras().uri}');
                            }
                          }
                        : null,
                    child: IconListItem(
                      icon: e.extras().icon,
                      color: viewModel.color,
                      text: e.text.clean(),
                    ));
              }).toList(),
            );
          }

          Widget closeButton() {
            return Padding(
              padding: const EdgeInsets.fromLTRB(0, 10, 8, 10),
              child: Container(
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: viewModel.color.withOpacity(0.8)),
                child: InkWell(
                  customBorder: const CircleBorder(),
                  onTap: () => locator<AppRouter>().popUntilRouteWithPath("/"),
                  child: const Padding(
                    padding: EdgeInsets.all(5),
                    child: Icon(Icons.close_rounded, color: Colors.white),
                  ),
                ),
              ),
            );
          }

          return SafeArea(
            top: false,
            child: Scaffold(
              extendBodyBehindAppBar: true,
              appBar: AppBar(
                leadingWidth: 15,
                toolbarHeight: 60,
                centerTitle: true,
                titleSpacing: 0,
                automaticallyImplyLeading: false,
                elevation: 0,
                backgroundColor: Colors.transparent,
                surfaceTintColor: Colors.transparent,
                actions: [
                  if (!viewModel.isCardOwnedByUser() &&
                      viewModel.isUserPresent())
                    IconButton(
                      onPressed: () {},
                      icon: Icon(
                        Icons.more_horiz,
                        size: 40,
                        color: viewModel.color,
                      ),
                    ),
                  if (!kIsWeb || action != DisplayType.private) closeButton(),
                ],
              ),
              body: ScaffoldBodyWrapper(
                  isFullWidth: true,
                  padding: EdgeInsets.zero,
                  builder: (context, size) {
                    return Padding(
                      padding: size.maxWidth > 480.000
                          ? const EdgeInsets.all(15.0)
                          : EdgeInsets.zero,
                      child: Center(
                        child: Card(
                          margin: EdgeInsetsDirectional.zero,
                          elevation: 0,
                          clipBehavior: Clip.hardEdge,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(
                                screenWidth(context) > 480.000
                                    ? 30
                                    : 0), // if you need this
                            side: BorderSide(
                              color: Colors.grey.withOpacity(0.2),
                              width: screenWidth(context) > 480.000 ? 2 : 0,
                            ),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Stack(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(bottom: 18),
                                    child: avatarField(),
                                  ),
                                  Positioned(
                                      left: 0,
                                      right: 0,
                                      bottom: 0,
                                      child: CardWaveDivider(
                                        context,
                                        color: viewModel.color,
                                        size: size,
                                        child: logoField(),
                                      )),
                                ],
                              ),
                              ConstrainedBox(
                                constraints: const BoxConstraints(
                                  minHeight: 450,
                                ),
                                child: Padding(
                                  padding:
                                      const EdgeInsets.fromLTRB(15, 15, 15, 15),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      fullNameField(),
                                      positionField(),
                                      departmentField(),
                                      companyField(),
                                      headlineField(),
                                      pronounsField(),
                                      Padding(
                                          padding: const EdgeInsets.only(
                                              top: 8.0, bottom: 8.0),
                                          child: customLinks()),
                                      if (locator<UserService>().id ==
                                          card.userId)
                                        dateCreated(),
                                      if (locator<ContactsService>()
                                              .contacts
                                              .firstWhereOrNull(
                                                  (e) => e.id == card.id) !=
                                          null)
                                        dateAdded(),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  }),
            ),
          );
        });
  }
}
