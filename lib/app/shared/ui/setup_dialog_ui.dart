import 'package:digicard/app/app.locator.dart';
import 'package:flutter/material.dart';
import 'package:stacked_services/stacked_services.dart';

//1. Create name/alias of custom dialog
enum DialogType { error, confirmDelete, forgotPassword, scanned }

Future<void> setupDialogUI() async {
  final dialogService = locator<DialogService>();

//2. Add it on builders
  final builders = {
    DialogType.error: (context, sheetRequest, completer) =>
        _ErrorDialog(request: sheetRequest, completer: completer),
    DialogType.confirmDelete: (context, sheetRequest, completer) =>
        _ConfirmDeleteDialog(request: sheetRequest, completer: completer),
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
              const Text(
                "Error!",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                    color: Colors.orange),
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
                        style: TextStyle(fontSize: 16, color: Colors.orange),
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

class _ConfirmDeleteDialog extends StatelessWidget {
  final DialogRequest request;
  final Function(DialogResponse) completer;
  const _ConfirmDeleteDialog(
      {Key? key, required this.request, required this.completer})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      child: Container(
        width: 600,
        decoration: BoxDecoration(
          color: Theme.of(context).scaffoldBackgroundColor,
        ),
        child: SingleChildScrollView(
          padding: const EdgeInsets.fromLTRB(15, 15, 15, 0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              const Text(
                "Confirm Delete?",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                    color: Colors.red),
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
                      onPressed: () =>
                          completer(DialogResponse(confirmed: false)),
                      child: const Text("Cancel")),
                  const SizedBox(width: 5),
                  TextButton(
                      onPressed: () =>
                          completer(DialogResponse(confirmed: true)),
                      child: const Text(
                        "Delete",
                        style: TextStyle(color: Colors.red),
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
                        style: TextStyle(fontSize: 16, color: Colors.orange),
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
          variant: DialogType.confirmDelete,
          barrierDismissible: true,
          description: "Are you sure you want to delete item #1?"); 
  
  
  
  
 
 * ***/
