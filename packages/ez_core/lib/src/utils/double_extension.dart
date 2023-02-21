import 'package:intl/intl.dart';

extension DoubleExt on double {
  String moneyFormat() {
    final oCcy = NumberFormat("\$ #,##0.00", "en_AU");
    return oCcy.format(this);
  }
}
