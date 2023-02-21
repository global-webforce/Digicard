/* import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';

class DataGridWidgets {
  Widget pill(String title,
      {Color? foreground, Color background = Colors.transparent}) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 5),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15), color: background),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            title,
            textAlign: TextAlign.center,
            style: TextStyle(
                color: foreground,
                fontSize: 14,
                fontWeight: FontWeight.w600,
                fontFamily: "Poppins"),
          ),
        ],
      ),
    );
  }

  Widget rowCellBuilder(DataGridCell<dynamic> e,
      {AlignmentGeometry alignment = Alignment.center,
      Function(DataGridCell<dynamic> e)? customBuilder}) {
    return (customBuilder == null)
        ? Container(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            alignment: alignment,
            child: Text(
              e.value.toString(),
              style: const TextStyle(
                fontFamily: "Poppins",
              ),
            ),
          )
        : Container(
            alignment: alignment,
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: customBuilder(e),
          );
  }

  GridColumn columnCellBuilder(String colName, String colTitle,
      {AlignmentGeometry alignment = Alignment.center,
      double maxWidth = double.nan,
      double minWidth = 150}) {
    return GridColumn(
      minimumWidth: minWidth,
      maximumWidth: maxWidth,
      columnName: colName,
      label: Container(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        alignment: alignment,
        child: Text(
          colTitle,
          style: const TextStyle(
            fontFamily: "Poppins",
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }
}
 */
