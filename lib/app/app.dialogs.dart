// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// StackedDialogGenerator
// **************************************************************************

import 'package:stacked_services/stacked_services.dart';

import 'app.locator.dart';
import '../ui/dialogs/confirm/confirm_dialog.dart';
import '../ui/dialogs/error/error_dialog.dart';
import '../ui/dialogs/info/info_dialog.dart';

enum DialogType {
  confirm,
  error,
  info,
}

void setupDialogUi() {
  final dialogService = locator<DialogService>();

  final Map<DialogType, DialogBuilder> builders = {
    DialogType.confirm: (context, request, completer) =>
        ConfirmDialog(request: request, completer: completer),
    DialogType.error: (context, request, completer) =>
        ErrorDialog(request: request, completer: completer),
    DialogType.info: (context, request, completer) =>
        InfoDialog(request: request, completer: completer),
  };

  dialogService.registerCustomDialogBuilders(builders);
}
