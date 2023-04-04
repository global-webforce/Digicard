import 'package:digicard/app/app.locator.dart';
import 'package:digicard/app/ui/dialogs/confirmation_dialog.dart';
import 'package:digicard/app/ui/dialogs/error_dialog.dart';
import 'package:digicard/app/ui/dialogs/simple_dialog.dart';
import 'package:stacked_services/stacked_services.dart';

enum DialogType { simple, confirmation, error }

Future<void> setupDialogUI() async {
  final dialogService = locator<DialogService>();

  final builders = {
    DialogType.simple: (context, sheetRequest, completer) =>
        SimpleDialog(request: sheetRequest, completer: completer),
    DialogType.confirmation: (context, sheetRequest, completer) =>
        ConfirmationDialog(request: sheetRequest, completer: completer),
    DialogType.error: (context, sheetRequest, completer) =>
        ErrorDialog(request: sheetRequest, completer: completer),
  };
  dialogService.registerCustomDialogBuilders(builders);
}
