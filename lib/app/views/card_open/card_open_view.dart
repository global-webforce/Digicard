import 'package:digicard/app/app.locator.dart';
import 'package:digicard/app/models/digital_card.model.dart';
import 'package:digicard/app/views/card_open/card_open_viewmodel.dart';
import 'package:ez_core/ez_core.dart';
import 'package:ez_ui/ez_ui.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

import 'package:stacked/stacked.dart';

class CardOpenView extends StatelessWidget {
  final DigitalCard card;
  const CardOpenView({Key? key, required this.card}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<CardOpenViewModel>.reactive(
        viewModelBuilder: () => locator<CardOpenViewModel>(),
        disposeViewModel: false,
        onViewModelReady: (viewModel) {},
        builder: (context, viewModel, child) {
          return Scaffold(
              extendBodyBehindAppBar: true,
              appBar: AppBar(
                automaticallyImplyLeading: false,
                backgroundColor: Colors.transparent,
                elevation: 0,
                leading: const BackButton(),
                actions: const [],
              ),
              bottomSheet: Container(
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(15, 15, 15, 15),
                  child: EzButton.elevated(
                    background: HexColor("${card.color}"),
                    leading: Icons.save_rounded,
                    title: "Save Contact",
                    onLongPress: () {},
                  ),
                ),
              ),
              body: SizedBox(
                width: double.infinity,
                height: double.infinity,
                child: SingleChildScrollView(
                    primary: false,
                    physics: const BouncingScrollPhysics(),
                    padding: const EdgeInsets.fromLTRB(0, 0, 0, 100),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Stack(
                          clipBehavior: Clip.none,
                          alignment: Alignment.center,
                          children: [
                            Container(
                              margin: const EdgeInsets.only(bottom: 5),
                              decoration: BoxDecoration(
                                border: Border(
                                  bottom: BorderSide(
                                    //                    <--- top side
                                    color: HexColor("${card.color}"),
                                    width: 8.0,
                                  ),
                                ),
                              ),
                              child: Image.network(
                                "${card.image}",
                                width: double.infinity,
                                height: 350,
                                fit: BoxFit.cover,
                              ),
                            ),
                            vSpaceRegular,
                            Positioned(
                              bottom: -30,
                              child: Center(
                                child: Container(
                                  decoration: const BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(50))),
                                  padding: const EdgeInsets.all(15),
                                  child: Image.network(
                                    "https://globalwebforce.com/wp-content/uploads/2021/06/cropped-nav-logo.png",
                                    width: 200,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.all(15),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const SizedBox(
                                height: 40,
                              ),
                              Text(
                                "${card.name}",
                                style: const TextStyle(
                                    fontSize: 24, fontWeight: FontWeight.bold),
                              ),
                              Text(
                                "${card.title}",
                                style: const TextStyle(
                                  fontSize: 16,
                                ),
                              ),
                              vSpaceSmall,
                              Text(
                                "${card.company}",
                                style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                    color: HexColor("${card.color}")),
                              ),
                              vSpaceMedium,
                              const Text(
                                "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nulla porttitor accumsan tincidunt. Vivamus magna justo, lacinia eget consectetur sed, convallis at tellus. Quisque velit nisi, pretium ut lacinia in, elementum id enim. Lorem ipsum dolor sit amet, consectetur adipiscing elit.",
                                style: TextStyle(
                                  fontSize: 16,
                                ),
                              ),
                              const Text(
                                "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nulla porttitor accumsan tincidunt. Vivamus magna justo, lacinia eget consectetur sed, convallis at tellus. Quisque velit nisi, pretium ut lacinia in, elementum id enim. Lorem ipsum dolor sit amet, consectetur adipiscing elit.",
                                style: TextStyle(
                                  fontSize: 16,
                                ),
                              ),
                            ],
                          ),
                        )
                      ],
                    )),
              ));
        });
  }
}
