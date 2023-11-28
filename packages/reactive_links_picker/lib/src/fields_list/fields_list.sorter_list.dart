import 'package:flutter/material.dart' hide ReorderableList;
import 'package:flutter_reorderable_list/flutter_reorderable_list.dart';
import 'package:reactive_links_picker/src/fields_list/field_item.dart';

class SorterList extends StatefulWidget {
  final Function(List<Map<String, dynamic>> value) onReorder;
  final List<FieldItem> items;
  const SorterList({super.key, required this.items, required this.onReorder});

  @override
  State<SorterList> createState() => _SorterListState();
}

class _SorterListState extends State<SorterList> {
  @override
  Widget build(BuildContext context) {
    int indexOfKey(Key key) {
      return widget.items.indexWhere((v) => v.orderKey == key);
    }

    bool reorderCallback(Key item, Key newPosition) {
      int draggingIndex = indexOfKey(item);
      int newPositionIndex = indexOfKey(newPosition);
      final draggedItem = widget.items[draggingIndex];
      debugPrint("Reordering $draggingIndex -> $newPositionIndex");
      setState(() {
        widget.items.removeAt(draggingIndex);
        widget.items.insert(newPositionIndex, draggedItem);
      });

      return true;
    }

    void reorderDone(Key item) {
      final draggedItem = widget.items[indexOfKey(item)];
      debugPrint("Reordering finished for ${draggedItem.index}");
      List<Map<String, dynamic>> reorderedItems = [];
      for (var i = 0; i < widget.items.length; i++) {
        reorderedItems.add(widget.items[i].customLink);
      }
      widget.onReorder(reorderedItems);
    }

    return ReorderableList(
      onReorder: reorderCallback,
      onReorderDone: reorderDone,
      decoratePlaceholder: (widget, decorationOpacity) {
        return DecoratedPlaceholder(
            offset: 0.0,
            widget: Card(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.0)),
                margin: EdgeInsets.zero,
                elevation: 5,
                child: widget));
      },
      child: CustomScrollView(
        primary: false,
        shrinkWrap: true,
        slivers: <Widget>[
          SliverPadding(
            padding: const EdgeInsets.all(16),
            sliver: SliverList(
              delegate: SliverChildBuilderDelegate(
                (BuildContext context, int index) {
                  return Padding(
                      padding: EdgeInsets.only(
                          bottom: index != widget.items.length - 1 ? 8.0 : 0.0),
                      child: widget.items[index]);
                },
                childCount: widget.items.length,
              ),
            ),
          )
        ],
      ),
    );
  }
}
