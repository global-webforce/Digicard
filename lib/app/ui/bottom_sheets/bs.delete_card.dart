import 'dart:math';
import 'package:digicard/app/constants/colors.dart';
import 'package:digicard/app/ui/widgets/bottom_sheet_buttons.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:stacked_services/stacked_services.dart';

class DeleteBottomSheet extends StatelessWidget {
  final SheetRequest request;
  final Function(SheetResponse) completer;

  const DeleteBottomSheet({
    Key? key,
    required this.request,
    required this.completer,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(15.0), topRight: Radius.circular(15.0)),
      child: Container(
        decoration: BoxDecoration(
          color: Theme.of(context).scaffoldBackgroundColor,
        ),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                color: kcPrimaryColor,
                height: 25,
                child: Center(
                  child: Container(
                    decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(Radius.circular(5))),
                    width: 50,
                    height: 5,
                  ),
                ),
              ),
              Center(
                child: Container(
                  padding: EdgeInsets.symmetric(
                      vertical: 16,
                      horizontal: max(
                          (MediaQuery.of(context).size.width - 500) / 2, 15)),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.only(bottom: 8.0),
                        child: Row(
                          children: [
                            MinButtons(
                                color: kcPrimaryColor,
                                onTap: () async {
                                  completer(SheetResponse(confirmed: true));
                                },
                                icon: const Icon(FontAwesomeIcons.xmark),
                                title: "Delete"),
                          ],
                        ),
                      ),
                      Row(
                        children: [
                          MinButtons(
                              color: kcPrimaryColor,
                              onTap: () async {
                                completer(SheetResponse());
                              },
                              icon: const Icon(FontAwesomeIcons.ban),
                              title: "Cancel"),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox.shrink(),
            ],
          ),
        ),
      ),
    );
  }
}
