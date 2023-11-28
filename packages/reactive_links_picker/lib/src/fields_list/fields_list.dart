import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart' hide ReorderableList;
import 'package:reactive_forms/reactive_forms.dart';
import 'package:reactive_links_picker/reactive_links_picker.dart';
import 'package:reactive_links_picker/src/fields_list/field_item.dart';

import 'fields_list.sorter_list.dart';

class FieldsList extends StatefulWidget {
  final Function(int index, CustomLink link) onUpdateAt;
  final Function(List<Map<String, dynamic>> value) onReorder;
  final Function(List<Map<String, dynamic>> value) onRemoveAt;
  const FieldsList({
    super.key,
    required this.onReorder,
    required this.onRemoveAt,
    required this.onUpdateAt,
  });

  @override
  State<FieldsList> createState() => _LinksListState();
}

class _LinksListState extends State<FieldsList> {
  late FormGroup form;
  late FormArray formArray;

  DraggingMode draggingMode = DraggingMode.iOS;

  @override
  Widget build(BuildContext context) {
    form = ReactiveForm.of(context) as FormGroup;
    formArray = form.control('customLinks') as FormArray<Map<String, dynamic>>;

    Widget emptyPlaceholder() {
      return const SizedBox(
        height: 150,
        child: Center(
          child: Text("Tap a field to add in your card."),
        ),
      );
    }

    return ReactiveFormArray(
        formArray: formArray,
        builder: (context, forms, _) {
          List<FieldItem> items = [];
          for (var i = 0; i < forms.controls.length; i++) {
            items.add(
              FieldItem(
                index: i,
                orderKey: ValueKey(i),
                formGroup: forms.controls[i] as FormGroup,
                customLink: forms.controls[i].value,
                isFirst: i == 0,
                isLast: i == forms.controls.length - 1,
                draggingMode: DraggingMode.iOS,
                onRemove: (index) {
                  List<Map<String, dynamic>> reorderedItems =
                      items.map((e) => e.customLink).toList();
                  reorderedItems.removeAt(index);

                  widget.onRemoveAt(reorderedItems.map((e) => e).toList());
                },
                onUpdate: (index, value) {
                  widget.onUpdateAt(index, value);
                },
              ),
            );
          }

          return DottedBorder(
            color: Theme.of(context).primaryColorLight,
            dashPattern: const [9, 3],
            borderPadding: const EdgeInsets.all(8.0),
            strokeCap: StrokeCap.butt,
            radius: const Radius.circular(12.0),
            strokeWidth: 1,
            child: items.isEmpty
                ? emptyPlaceholder()
                : SorterList(
                    items: items,
                    onReorder: (value) {
                      widget.onReorder(value);
                    },
                  ),
          );
        });
  }
}
