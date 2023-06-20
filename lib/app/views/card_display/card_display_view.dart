import 'dart:ui';

import 'package:auto_route/annotations.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:digicard/app/app.locator.dart';
import 'package:digicard/app/constants/dimensions.dart';
import 'package:digicard/app/constants/env.dart';
import 'package:digicard/app/extensions/color_extension.dart';
import 'package:digicard/app/extensions/custom_link_extension.dart';
import 'package:digicard/app/extensions/digital_card_extension.dart';
import 'package:digicard/app/extensions/string_extension.dart';

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
import 'package:google_fonts/google_fonts.dart';
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

          Widget heading0(BoxConstraints size) {
            Widget logoField() {
              return CachedNetworkImage(
                imageUrl: "$logoUrlPrefix${viewModel.card.logoUrl}",
                imageBuilder: (context, imageProvider) {
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 16.0),
                    child: Container(
                      height: 56,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          alignment: Alignment.centerLeft,
                          image: imageProvider,
                          fit: BoxFit.contain,
                        ),
                      ),
                    ),
                  );
                },
                placeholder: (context, url) {
                  return const Padding(
                    padding: EdgeInsets.only(bottom: 16.0),
                    child: SizedBox(height: 56),
                  );
                },
                errorWidget: (context, url, error) {
                  return const SizedBox.shrink();
                },
              );
            }

            Widget fullNameField() {
              return !viewModel.card.fullName().isNotNullOrEmpty()
                  ? const SizedBox.shrink()
                  : Padding(
                      padding: const EdgeInsets.only(bottom: 16.0),
                      child: AutoSizeText(
                        viewModel.card.fullName().clean().toTitleCase(),
                        style: GoogleFonts.poppins(
                          fontWeight: FontWeight.w800,
                          fontSize: 30,
                          height: 1.2,
                        ),
                        maxLines: 2,
                        maxFontSize: 30,
                        minFontSize: 14,
                        overflow: TextOverflow.ellipsis,
                      ),
                    );
            }

            Widget positionField() {
              return !"${viewModel.card.position}".isNotNullOrEmpty()
                  ? const SizedBox.shrink()
                  : AutoSizeText(
                      viewModel.card.position.clean().toTitleCase(),
                      style: GoogleFonts.poppins(
                        fontSize: 16,
                        fontStyle: FontStyle.italic,
                        fontWeight: FontWeight.bold,
                      ),
                      maxLines: 2,
                      maxFontSize: 16,
                      minFontSize: 12,
                    );
            }

            Widget companyField() {
              return !"${viewModel.card.company}".isNotNullOrEmpty()
                  ? const SizedBox.shrink()
                  : AutoSizeText(
                      viewModel.card.company.clean().toTitleCase(),
                      style: GoogleFonts.poppins(
                        fontSize: 16,
                        fontStyle: FontStyle.italic,
                      ),
                      maxLines: 2,
                      maxFontSize: 16,
                      minFontSize: 12,
                    );
            }

            const avatarSize = 160.0;
            Widget avatarFieldCircle() {
              return CachedNetworkImage(
                imageUrl: "$avatarUrlPrefix${viewModel.card.avatarUrl}",
                imageBuilder: (context, imageProvider) {
                  return Container(
                    height: avatarSize,
                    width: avatarSize,
                    decoration: BoxDecoration(
                      border: Border.all(
                          color: viewModel.color.darken(0.1), width: 5),
                      borderRadius:
                          const BorderRadius.all(Radius.circular(100)),
                      image: DecorationImage(
                        image: imageProvider,
                        fit: BoxFit.cover,
                      ),
                    ),
                  );
                },
                placeholder: (context, url) {
                  return const SizedBox.shrink();
                },
                errorWidget: (context, url, error) {
                  return const SizedBox.shrink();
                },
              );
            }

            return Padding(
              padding: const EdgeInsets.only(bottom: (avatarSize / 2) - 15),
              child: Stack(
                clipBehavior: Clip.none,
                children: [
                  Container(
                    width: size.maxWidth,
                    constraints: const BoxConstraints(minHeight: 160),
                    decoration: BoxDecoration(
                      color: viewModel.color.darken(0.1),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(
                        15.0,
                        56,
                        15,
                        (avatarSize / 2),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          logoField(),
                          fullNameField(),
                          SizedBox(
                            width: size.maxWidth - (avatarSize + 30),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                positionField(),
                                companyField(),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Positioned(
                    right: 15,
                    bottom: 0 - (avatarSize / 2) + 20,
                    child: avatarFieldCircle(),
                  ),
                ],
              ),
            );
          }

          Widget heading1(BoxConstraints size) {
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
              return !viewModel.card.fullName().isNotNullOrEmpty()
                  ? const SizedBox.shrink()
                  : Padding(
                      padding: const EdgeInsets.only(bottom: 16.0),
                      child: AutoSizeText(
                        viewModel.card.fullName().clean().toTitleCase(),
                        style: GoogleFonts.poppins(
                          fontWeight: FontWeight.w800,
                          fontSize: 30,
                          height: 1.2,
                        ),
                        maxLines: 2,
                        maxFontSize: 30,
                        minFontSize: 14,
                        overflow: TextOverflow.ellipsis,
                      ),
                    );
            }

            Widget positionField() {
              return !"${viewModel.card.position}".isNotNullOrEmpty()
                  ? const SizedBox.shrink()
                  : AutoSizeText(
                      viewModel.card.position.clean().toTitleCase(),
                      style: GoogleFonts.poppins(
                        fontSize: 16,
                        fontStyle: FontStyle.italic,
                        fontWeight: FontWeight.bold,
                      ),
                      maxLines: 2,
                      maxFontSize: 16,
                      minFontSize: 12,
                    );
            }

            Widget companyField() {
              return !"${viewModel.card.company}".isNotNullOrEmpty()
                  ? const SizedBox.shrink()
                  : AutoSizeText(
                      viewModel.card.company.clean().toTitleCase(),
                      style: GoogleFonts.poppins(
                        fontSize: 16,
                        fontStyle: FontStyle.italic,
                      ),
                      maxLines: 2,
                      maxFontSize: 16,
                      minFontSize: 12,
                    );
            }

            const avatarSize = 160.0;
            Widget avatarFieldCircle() {
              return CachedNetworkImage(
                imageUrl: "$avatarUrlPrefix${viewModel.card.avatarUrl}",
                imageBuilder: (context, imageProvider) {
                  return Container(
                    height: avatarSize,
                    width: avatarSize,
                    decoration: BoxDecoration(
                      border: Border.all(
                          color: viewModel.color.darken(0.1), width: 5),
                      borderRadius:
                          const BorderRadius.all(Radius.circular(100)),
                      image: DecorationImage(
                        image: imageProvider,
                        fit: BoxFit.cover,
                      ),
                    ),
                  );
                },
                placeholder: (context, url) {
                  return const SizedBox.shrink();
                },
                errorWidget: (context, url, error) {
                  return const SizedBox.shrink();
                },
              );
            }

            return Padding(
              padding: const EdgeInsets.only(bottom: 0),
              child: Stack(
                clipBehavior: Clip.none,
                children: [
                  CachedNetworkImage(
                    imageUrl: "$avatarUrlPrefix${viewModel.card.avatarUrl}",
                    imageBuilder: (context, imageProvider) {
                      return Container(
                        width: size.maxWidth,
                        height: size.maxWidth,
                        constraints: const BoxConstraints(minHeight: 160),
                        decoration: BoxDecoration(
                          color: viewModel.color.darken(0.1),
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
                      );
                    },
                    placeholder: (context, url) {
                      return Container(
                        color: viewModel.color.darken(0.1),
                        height: 130,
                      );
                    },
                    errorWidget: (context, url, error) {
                      return Container(
                        color: viewModel.color.darken(0.1),
                        height: 130,
                      );
                    },
                  ),
                  Positioned(
                    bottom: 0,
                    width: size.maxWidth,
                    child: CardWaveDivider(
                      context,
                      color: viewModel.color,
                      size: size,
                      child: logoField(),
                    ),
                  )
                ],
              ),
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

          Widget body0() {
            return Padding(
              padding: const EdgeInsets.fromLTRB(15, 15, 15, 15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  headlineField(),
                  pronounsField(),
                  customLinks(),
                  if (viewModel.isCardOwnedByUser()) dateCreated(),
                  if (viewModel.isCardInContacts()) dateAdded(),
                ],
              ),
            );
          }

          Widget body1() {
            return Padding(
              padding: const EdgeInsets.fromLTRB(15, 15, 15, 15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  fullNameField(),
                  positionField(),
                  departmentField(),
                  companyField(),
                  headlineField(),
                  pronounsField(),
                  customLinks(),
                  if (viewModel.isCardOwnedByUser()) dateCreated(),
                  if (viewModel.isCardInContacts()) dateAdded(),
                ],
              ),
            );
          }

          Widget bottomSheet(BoxConstraints size) {
            final cardWidth = Dimens.computedWidth(
                screenSize: size,
                targetWidth: 480.000,
                vPadding: 0,
                hPadding: 0);
            return Container(
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
                        if (kIsWeb && viewModel.action == DisplayType.public)
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
                    if (kIsWeb && viewModel.action == DisplayType.public)
                      adPanel()
                  ],
                ),
              ),
            );
          }

          PreferredSizeWidget appBar() {
            return AppBar(
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
                if (!kIsWeb || action == DisplayType.private) closeButton(),
              ],
            );
          }

          Widget empty() {
            return const EmptyDisplay(
                icon: Icons.error_rounded, title: "Card not found");
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
                      appBar: appBar(),
                      bottomSheet: bottomSheet(size),
                      body: ScaffoldBodyWrapper(
                          isBusy: viewModel.busy(loadingCardBusyKey),
                          isFullWidth: true,
                          isEmpty: viewModel.card.id == null,
                          emptyIndicatorWidget: empty(),
                          padding: cardWidth,
                          builder: (context, size) {
                            return CardHolder(
                              size: size,
                              children: [
                                if (viewModel.card.layout == 0) heading0(size),
                                if (viewModel.card.layout == 1) heading1(size),
                                if (viewModel.card.layout == 0) body0(),
                                if (viewModel.card.layout == 1) body1(),
                              ],
                            );
                          }),
                    );
                  });
            }),
          );
        });
  }
}

class CardHolder extends StatelessWidget {
  final BoxConstraints size;
  final List<Widget> children;
  const CardHolder({
    super.key,
    required this.size,
    required this.children,
  });

  @override
  Widget build(BuildContext context) {
    const cardWidth = 480.000;
    final isSmallScreen = size.maxWidth < cardWidth;
    final cardShape = RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(isSmallScreen ? 0 : 30),
      side: BorderSide(
        color: Colors.grey.withOpacity(0.2),
        width: isSmallScreen ? 0 : 2,
      ),
    );
    return Container(
      margin: isSmallScreen ? EdgeInsets.zero : const EdgeInsets.all(15.0),
      child: Center(
        child: Card(
          margin: EdgeInsetsDirectional.zero,
          elevation: 0,
          clipBehavior: Clip.hardEdge,
          shape: cardShape,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Stack(
                alignment: Alignment.centerLeft,
                clipBehavior: Clip.none,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: children,
                  ),
                ],
              ),
              const SizedBox(height: 100.0)
            ],
          ),
        ),
      ),
    );
  }
}
