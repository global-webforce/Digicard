// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// StackedBottomsheetGenerator
// **************************************************************************

import 'package:stacked_services/stacked_services.dart';

import 'app.locator.dart';
import '../ui/bottom_sheets/card_manager/card_manager_sheet.dart';
import '../ui/bottom_sheets/card_share/card_share_sheet.dart';
import '../ui/bottom_sheets/delete/delete_sheet.dart';
import '../ui/bottom_sheets/notice/notice_sheet.dart';

enum BottomSheetType {
  notice,
  cardManager,
  cardShare,
  delete,
}

void setupBottomSheetUi() {
  final bottomsheetService = locator<BottomSheetService>();

  final Map<BottomSheetType, SheetBuilder> builders = {
    BottomSheetType.notice: (context, request, completer) =>
        NoticeSheet(request: request, completer: completer),
    BottomSheetType.cardManager: (context, request, completer) =>
        CardManagerSheet(request: request, completer: completer),
    BottomSheetType.cardShare: (context, request, completer) =>
        CardShareSheet(request: request, completer: completer),
    BottomSheetType.delete: (context, request, completer) =>
        DeleteSheet(request: request, completer: completer),
  };

  bottomsheetService.setCustomSheetBuilders(builders);
}
