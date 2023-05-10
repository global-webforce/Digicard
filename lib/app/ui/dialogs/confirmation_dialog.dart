import 'package:digicard/app/constants/colors.dart';
import 'package:digicard/app/extensions/string_extension.dart';
import 'package:digicard/app/helper/screen_size.dart';
import 'package:flutter/material.dart';
import 'package:stacked_services/stacked_services.dart';

class ConfirmationDialog extends StatelessWidget {
  final DialogRequest request;
  final Function(DialogResponse) completer;
  const ConfirmationDialog(
      {Key? key, required this.request, required this.completer})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: SingleChildScrollView(
          padding: const EdgeInsets.fromLTRB(15, 15, 15, 13),
          child: Container(
            width: 500,
            constraints: BoxConstraints(
                minHeight: 0, maxHeight: screenHeight(context) * 0.7),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                if ("${request.title}".isNotNullOrEmpty())
                  Padding(
                    padding: const EdgeInsets.only(bottom: 5),
                    child: Text(
                      "${request.title}",
                      style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 17,
                          color: kcPrimaryColor),
                    ),
                  ),
                if ("${request.description}".isNotNullOrEmpty())
                  Padding(
                    padding: const EdgeInsets.only(bottom: 15),
                    child: Text(
                      "${request.description}",
                      style: const TextStyle(
                        fontSize: 16,
                      ),
                    ),
                  ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    TextButton(
                        style: TextButton.styleFrom(
                          minimumSize: Size.zero,
                          padding: const EdgeInsets.fromLTRB(10.0, 0, 10.0, 0),
                          tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                        ),
                        onPressed: () =>
                            completer(DialogResponse(confirmed: false)),
                        child: Text(request.secondaryButtonTitle ?? "Cancel",
                            style: const TextStyle(fontSize: 16))),
                    const SizedBox(width: 10),
                    TextButton(
                        style: TextButton.styleFrom(
                          minimumSize: Size.zero,
                          padding: const EdgeInsets.fromLTRB(10.0, 0, 10.0, 0),
                          tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                        ),
                        onPressed: () => completer(DialogResponse(
                              confirmed: true,
                            )),
                        child: Text(
                          request.mainButtonTitle ?? "Confirm",
                          style: const TextStyle(
                              color: kcPrimaryColor, fontSize: 16),
                        )),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
