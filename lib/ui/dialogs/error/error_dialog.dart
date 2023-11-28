import 'package:flutter/material.dart';
import 'package:stacked_services/stacked_services.dart';

class ErrorDialog extends StatelessWidget {
  final DialogRequest request;
  final Function(DialogResponse) completer;
  const ErrorDialog({Key? key, required this.request, required this.completer})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Wrap(
        alignment: WrapAlignment.start,
        crossAxisAlignment: WrapCrossAlignment.center,
        runSpacing: 8.0,
        spacing: 8.0,
        children: [
          Text(
            request.title ?? "Error",
          ),
        ],
      ),
      content: Text(
        "${request.description}",
        style: const TextStyle(
          fontSize: 14,
        ),
      ),
      actions: <Widget>[
        TextButton(
          child: Text(
            request.mainButtonTitle ?? "Close",
          ),
          onPressed: () {
            completer(DialogResponse(
              confirmed: true,
            ));
          },
        ),
      ],
    );
  }
}
