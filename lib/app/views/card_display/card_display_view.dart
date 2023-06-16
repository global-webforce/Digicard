import 'dart:ui';

import 'package:auto_route/annotations.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:digicard/app/app.locator.dart';
import 'package:digicard/app/constants/dimensions.dart';
import 'package:digicard/app/constants/env.dart';
import 'package:digicard/app/extensions/color_extension.dart';
import 'package:digicard/app/extensions/custom_link_extension.dart';
import 'package:digicard/app/extensions/digital_card_extension.dart';
import 'package:digicard/app/extensions/string_extension.dart';
import 'package:digicard/app/helper/screen_size.dart';

import 'package:digicard/app/routes/app_router.dart';
import 'package:digicard/app/ui/_core/empty_display.dart';
import 'package:digicard/app/ui/_core/ez_button.dart';
import 'package:digicard/app/ui/_core/scaffold_body_wrapper.dart';
import 'package:digicard/app/ui/_core/spacer.dart';
import 'package:digicard/app/ui/overlays/loader_overlay_wrapper.dart';
import 'package:digicard/app/views/card_editor/widgets/card.wave_divider.dart';
import 'package:digicard/app/views/card_editor/widgets/icon_list_item.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';
import 'package:stacked/stacked.dart';
import 'package:url_launcher/url_launcher.dart';

import 'card_display_viewmodel.dart';
import 'package:digicard/app/models/digital_card.dart';

@RoutePage()
class CardDisplayView extends StatelessWidget {
  final DigitalCard? card;
  final String? uuid;
  final DisplayType? action;
  const CardDisplayView({
    Key? key,
    @PathParam('uuid') this.uuid,
    this.card,
    this.action,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<CardDisplayViewModel>.reactive(
        viewModelBuilder: () => locator<CardDisplayViewModel>(),
        disposeViewModel: false,
        onViewModelReady: (model) async {
          model.card = card ?? DigitalCard();
          model.action = action ?? DisplayType.public;
          if (uuid != null) {
            await model.loadCardbyUuid("$uuid");
          }
        },
        builder: (context, viewModel, child) {
          adPanel() {
            return InkWell(
              onTap: () async {
                final Uri url = Uri.parse('https://www.apple.com/app-store/');
                if (!await launchUrl(url)) {
                  throw Exception('Could not launch $url');
                }
              },
              child: Container(
                decoration: BoxDecoration(
                  color: viewModel.color.darken(0.2),
                  borderRadius: const BorderRadius.only(
                      topRight: Radius.circular(10.0),
                      topLeft: Radius.circular(10.0)),
                ),
                width: double.infinity,
                padding: const EdgeInsets.all(10),
                child: const Text(
                  "Create your own digital business card for FREE",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.white,
                  ),
                ),
              ),
            );
          }

          Widget youOwnButton() {
            return Card(
              color: Colors.black.withOpacity(0.6),
              child: const Padding(
                padding: EdgeInsets.all(8.0),
                child: Text(
                  "You own this card",
                  style: TextStyle(fontStyle: FontStyle.italic, fontSize: 14),
                ),
              ),
            );
          }

          Widget avatarField() {
            return CachedNetworkImage(
              imageUrl: "$avatarUrlPrefix${viewModel.card.avatarUrl}",
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
              imageUrl: "$logoUrlPrefix${viewModel.card.logoUrl}",
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
                viewModel.card.fullName().clean().toTitleCase(),
                overflow: TextOverflow.visible,
                style:
                    const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),
            );
          }

          Widget positionField() {
            return !"${viewModel.card.position}".isNotNullOrEmpty()
                ? const SizedBox.shrink()
                : Padding(
                    padding: const EdgeInsets.only(bottom: 8.0),
                    child: Text(
                      "${viewModel.card.position}".clean().toTitleCase(),
                      style: const TextStyle(),
                    ),
                  );
          }

          Widget departmentField() {
            return !"${viewModel.card.department}".isNotNullOrEmpty()
                ? const SizedBox.shrink()
                : Padding(
                    padding: const EdgeInsets.only(bottom: 8.0),
                    child: Text(
                      "${viewModel.card.department}".clean().toTitleCase(),
                      style: const TextStyle(),
                    ),
                  );
          }

          Widget companyField() {
            return !"${viewModel.card.company}".isNotNullOrEmpty()
                ? const SizedBox.shrink()
                : IconListItem(
                    icon: Icons.domain,
                    text: "${viewModel.card.company}".clean().toTitleCase(),
                    textStyle: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: viewModel.color,
                    ),
                  );
          }

          Widget headlineField() {
            return !"${viewModel.card.headline}".isNotNullOrEmpty()
                ? const SizedBox.shrink()
                : Padding(
                    padding: const EdgeInsets.only(bottom: 8.0),
                    child: Text(
                      "${viewModel.card.headline}".clean().toTitleCase(),
                      style: const TextStyle(),
                    ),
                  );
          }

          Widget pronounsField() {
            return !"${viewModel.card.preferredName}".isNotNullOrEmpty() &&
                    !"${viewModel.card.pronouns}".isNotNullOrEmpty()
                ? const SizedBox.shrink()
                : IconListItem(
                    color: Colors.transparent,
                    icon: Icons.chat_rounded,
                    text:
                        "Goes By ${viewModel.card.preferredName} ( ${viewModel.card.pronouns} )"
                            .clean()
                            .toTitleCase(),
                  );
          }

          Widget dateCreated() {
            return !"${viewModel.card.createdAt}".isNotNullOrEmpty()
                ? const SizedBox.shrink()
                : IconListItem(
                    color: Colors.transparent,
                    icon: FontAwesomeIcons.circleInfo,
                    text:
                        "Created ${DateFormat('MMM dd, yyyy hh:mm a').format(viewModel.card.createdAt ?? DateTime.now())}"
                            .clean(),
                  );
          }

          Widget dateAdded() {
            return !"${viewModel.card.createdAt}".isNotNullOrEmpty()
                ? const SizedBox.shrink()
                : IconListItem(
                    color: Colors.transparent,
                    icon: FontAwesomeIcons.handshake,
                    text:
                        "Added ${DateFormat('MMM dd, yyyy hh:mm a').format(viewModel.card.addedAt ?? DateTime.now())}"
                            .clean(),
                  );
          }

          Widget customLinks() {
            return Wrap(
              runSpacing: 8,
              spacing: 8,
              children: viewModel.card.customLinks.map((e) {
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
            child: LayoutBuilder(builder: (context, size) {
              final cardWidth = Dimens.computedWidth(
                  screenSize: size,
                  targetWidth: 480.000,
                  vPadding: 0,
                  hPadding: 0);

              return LoaderOverlayWrapper(
                  color: viewModel.color,
                  type: viewModel.busy(saveBusyKey)
                      ? LoadingType.save
                      : viewModel.busy(deleteBusyKey)
                          ? LoadingType.delete
                          : viewModel.busy(doneBusyKey)
                              ? LoadingType.done
                              : null,
                  builder: (context) {
                    return Scaffold(
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
                          if (viewModel.isCardInContacts())
                            Container(
                              margin: const EdgeInsets.only(right: 15),
                              child: IconButton(
                                onPressed: () {
                                  viewModel.showOptions();
                                },
                                icon: Icon(
                                  Icons.more_horiz,
                                  size: 40,
                                  color: viewModel.color,
                                ),
                              ),
                            ),
                          if (!kIsWeb || action == DisplayType.private)
                            closeButton(),
                        ],
                      ),
                      bottomSheet: Container(
                        padding: cardWidth,
                        child: Padding(
                          padding: const EdgeInsets.fromLTRB(8.0, 8.0, 8.0, 0),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              if (viewModel.action == DisplayType.public &&
                                  viewModel.isCardOwnedByUser())
                                youOwnButton(),
                              vSpaceSmall,
                              Row(
                                children: [
                                  if (!viewModel.isCardOwnedByUser() &&
                                      !viewModel.isCardInContacts())
                                    Expanded(
                                      child: EzButton.elevated(
                                        background: viewModel.color,
                                        title: "Add to Contacts",
                                        onTap: () async {
                                          await viewModel.saveToContacts();
                                        },
                                      ),
                                    ),
                                  hSpaceSmall,
                                  if (kIsWeb &&
                                      viewModel.action == DisplayType.public)
                                    Expanded(
                                      child: EzButton.elevated(
                                        background: viewModel.color,
                                        title: "Download Contact",
                                        onTap: () async {
                                          await viewModel.downloadVcf();
                                        },
                                      ),
                                    ),
                                ],
                              ),
                              vSpaceSmall,
                              if (kIsWeb &&
                                  viewModel.action == DisplayType.public)
                                adPanel()
                            ],
                          ),
                        ),
                      ),
                      body: ScaffoldBodyWrapper(
                          isBusy: viewModel.busy(loadingCardBusyKey),
                          isFullWidth: true,
                          isEmpty: viewModel.card.id == null,
                          emptyIndicatorWidget: const EmptyDisplay(
                              icon: Icons.error_rounded,
                              title: "Card not found"),
                          padding: cardWidth,
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
                                      width: screenWidth(context) > 480.000
                                          ? 2
                                          : 0,
                                    ),
                                  ),
                                  child: Padding(
                                    padding:
                                        const EdgeInsets.only(bottom: 100.0),
                                    child:
                                        LayoutBuilder(builder: (context, size) {
                                      return Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          Stack(
                                            children: [
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                    bottom: 18),
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
                                                  const EdgeInsets.fromLTRB(
                                                      15, 15, 15, 15),
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                mainAxisAlignment:
                                                    MainAxisAlignment.start,
                                                children: [
                                                  fullNameField(),
                                                  positionField(),
                                                  departmentField(),
                                                  companyField(),
                                                  headlineField(),
                                                  pronounsField(),
                                                  Padding(
                                                      padding:
                                                          const EdgeInsets.only(
                                                              top: 8.0,
                                                              bottom: 8.0),
                                                      child: customLinks()),
                                                  if (viewModel
                                                      .isCardOwnedByUser())
                                                    dateCreated(),
                                                  if (viewModel
                                                      .isCardInContacts())
                                                    dateAdded(),
                                                ],
                                              ),
                                            ),
                                          ),
                                        ],
                                      );
                                    }),
                                  ),
                                ),
                              ),
                            );
                          }),
                    );
                  });
            }),
          );
        });
  }
}
