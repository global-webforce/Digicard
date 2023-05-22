import 'package:digicard/app/constants/colors.dart';
import 'package:digicard/app/extensions/string_extension.dart';
import 'package:flutter/material.dart';
import 'package:stacked_services/stacked_services.dart';

class SimpleDialog extends StatelessWidget {
  final DialogRequest request;
  final Function(DialogResponse) completer;
  const SimpleDialog({Key? key, required this.request, required this.completer})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: SizedBox(
          width: 500,
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
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
                Text(
                  "${request.description}",
                  style: const TextStyle(
                    fontSize: 16,
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    TextButton(
                        style: TextButton.styleFrom(
                            minimumSize: Size.zero,
                            padding: EdgeInsets.zero,
                            tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                            alignment: Alignment.centerLeft),
                        onPressed: () =>
                            completer(DialogResponse(confirmed: false)),
                        child: Text(
                          request.mainButtonTitle ?? "Close",
                          style: const TextStyle(
                              fontSize: 16, color: kcPrimaryColor),
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
