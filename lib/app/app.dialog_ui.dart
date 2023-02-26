import 'package:digicard/app/app.locator.dart';
import 'package:digicard/app/ui/_shared/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:stacked_services/stacked_services.dart';

//1. Create name/alias of custom dialog
enum DialogType { error, confirmation, forgotPassword, scanned }

Future<void> setupDialogUI() async {
  final dialogService = locator<DialogService>();

//2. Add it on builders
  final builders = {
    DialogType.error: (context, sheetRequest, completer) =>
        _ErrorDialog(request: sheetRequest, completer: completer),
    DialogType.confirmation: (context, sheetRequest, completer) =>
        _ConfirmationDialog(request: sheetRequest, completer: completer),
    DialogType.forgotPassword: (context, sheetRequest, completer) =>
        _ForgotPassword(request: sheetRequest, completer: completer),
    DialogType.scanned: (context, sheetRequest, completer) =>
        _Scanned(request: sheetRequest, completer: completer),
  };
  dialogService.registerCustomDialogBuilders(builders);
}

//3. Create the widget that represents the custom dialog
class _ErrorDialog extends StatelessWidget {
  final DialogRequest request;
  final Function(DialogResponse) completer;
  const _ErrorDialog({Key? key, required this.request, required this.completer})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: SizedBox(
        width: 500,
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Text(
                request.title ?? "Error!",
                style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                    color: kcPrimaryColor),
              ),
              const SizedBox(
                height: 10,
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
                      child: const Text(
                        "Close",
                        style: TextStyle(fontSize: 16, color: kcPrimaryColor),
                      )),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _ConfirmationDialog extends StatelessWidget {
  final DialogRequest request;
  final Function(DialogResponse) completer;
  const _ConfirmationDialog(
      {Key? key, required this.request, required this.completer})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: Container(
          width: 600,
          decoration: BoxDecoration(
            color: Theme.of(context).scaffoldBackgroundColor,
          ),
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Text(
                  request.title ?? "Confirm",
                  style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                      color: kcPrimaryColor),
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  "${request.description}",
                  style: const TextStyle(
                    fontSize: 16,
                  ),
                ),
                const SizedBox(
                  height: 30,
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
                        child: Text(request.mainButtonTitle ?? "Cancel")),
                    const SizedBox(width: 10),
                    TextButton(
                        style: TextButton.styleFrom(
                          minimumSize: Size.zero,
                          padding: const EdgeInsets.fromLTRB(10.0, 0, 10.0, 0),
                          tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                        ),
                        onPressed: () =>
                            completer(DialogResponse(confirmed: true)),
                        child: Text(
                          request.secondaryButtonTitle ?? "Confirm",
                          style: const TextStyle(color: kcPrimaryColor),
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

class _ForgotPassword extends StatelessWidget {
  final DialogRequest request;
  final Function(DialogResponse) completer;
  const _ForgotPassword(
      {Key? key, required this.request, required this.completer})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: SizedBox(
        width: 500,
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              const Text(
                "To reset your password, enter your account email above, then tap Forgot Password again.",
                style: TextStyle(
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
                      child: const Text(
                        "Close",
                        style: TextStyle(fontSize: 16, color: kcPrimaryColor),
                      )),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _Scanned extends StatelessWidget {
  final DialogRequest request;
  final Function(DialogResponse) completer;
  const _Scanned({Key? key, required this.request, required this.completer})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: SizedBox(
        width: 500,
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              const Text("SCANNED IMAGE"),
              Text(
                request.data["image"].toString(),
                maxLines: 2,
              ),
              Image(image: MemoryImage(request.data["image"])),
            ],
          ),
        ),
      ),
    );
  }
}

/***

SHOW GENERAL ERROR

    _dialogService.showCustomDialog(
          variant: DialogType.error,
          barrierDismissible: true,
          description: e.toString()); 


CONFIRM DELETE

         _dialogService.showCustomDialog(
          variant: DialogType.confirmation,
          barrierDismissible: true,
          description: "Are you sure you want to delete item #1?"); 
  
  
  
  
 
 * ***/
