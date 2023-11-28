import 'package:flutter/material.dart' hide ReorderableList;
import 'package:flutter_reorderable_list/flutter_reorderable_list.dart';
import 'package:reactive_forms/reactive_forms.dart';
import 'package:reactive_links_picker/src/fields_list/dialog.dart';
import 'package:reactive_links_picker/src/models/custom_link.dart';

enum DraggingMode {
  iOS,
  android,
}

class FieldItem extends StatelessWidget {
  const FieldItem({
    Key? key,
    required this.isFirst,
    required this.isLast,
    required this.draggingMode,
    required this.index,
    required this.orderKey,
    required this.onRemove,
    required this.onUpdate,
    required this.customLink,
    required this.formGroup,
  }) : super(key: key);

  final int index;
  final Key orderKey;
  final Map<String, dynamic> customLink;
  final bool isFirst;
  final bool isLast;
  final DraggingMode draggingMode;
  final FormGroup formGroup;

  final Function(int) onRemove;
  final Function(int, CustomLink) onUpdate;

  Widget buildChild(BuildContext context, ReorderableItemState state) {
    Widget dragHandle = draggingMode == DraggingMode.iOS
        ? ReorderableListener(
            child: const Center(
              child: Icon(Icons.reorder, color: Color(0xFF888888)),
            ),
          )
        : Container();

    const textDecoration = InputDecoration(
      isDense: true,
      filled: false,
      contentPadding: EdgeInsets.symmetric(vertical: 12, horizontal: 12),
    );

    Widget remove() {
      return GestureDetector(
          child: const Icon(Icons.clear_rounded),
          onTap: () async {
            await showDeleteDialog(context).then((value) {
              if (value == true) {
                onRemove(index);
              }
            });
          });
    }

    Widget label() {
      return Wrap(
        alignment: WrapAlignment.center,
        crossAxisAlignment: WrapCrossAlignment.center,
        runAlignment: WrapAlignment.center,
        spacing: 0,
        children: [
          dragHandle,
          const SizedBox(width: 12),
          Text("${customLink['label']}")
        ],
      );
    }

    Widget value() {
      return ReactiveTextField(
        key: ValueKey("value-${formGroup.control('id').value}"),
        formControl: formGroup.control('value') as FormControl,
        showErrors: (control) => false,
        decoration: textDecoration.copyWith(
            /*        prefixIcon: const Padding(
            padding: EdgeInsets.only(left: 12),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "",
                  // customLink.prefixLink.toString().replaceFirst("https://", ""),
                  style: TextStyle(fontSize: 15),
                ),
              ],
            ),
          ), */
            ),
        onChanged: (control) {
          onUpdate(
            index,
            CustomLink.fromJson(control.parent?.value as Map<String, dynamic>),
          );
        },
      );
    }

    Widget custom() {
      return ReactiveTextField(
        key: ValueKey("custom-${formGroup.control('id').value}"),
        formControl: formGroup.control('custom') as FormControl,
        showErrors: (control) => false,
        decoration: textDecoration.copyWith(labelText: "Label"),
        onChanged: (control) {
          onUpdate(
            index,
            CustomLink.fromJson(control.parent?.value as Map<String, dynamic>),
          );
        },
      );
    }

    Widget placeholder(Widget child) {
      return Opacity(
        // hide content while dragging
        opacity: state == ReorderableItemState.placeholder ? 0.0 : 1.0,
        child: Card(
          margin: EdgeInsets.zero,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8.0),
            side: BorderSide(
              color: formGroup.valid ? Colors.transparent : Colors.red,
              width: 2.0,
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: child,
          ),
        ),
      );
    }

    Widget content = placeholder(
      Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [label(), remove()],
          ),
          const SizedBox(height: 8.0),
          value(),
          const SizedBox(height: 8.0),
          custom(),
        ],
      ),
    );

    // For android dragging mode, wrap the entire content in DelayedReorderableListener
    if (draggingMode == DraggingMode.android) {
      content = DelayedReorderableListener(
        child: content,
      );
    }

    return content;
  }

  @override
  Widget build(BuildContext context) {
    return ReorderableItem(key: orderKey, childBuilder: buildChild);
  }
}
