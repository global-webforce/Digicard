import 'package:flutter/material.dart';

class CollapsibleField extends StatefulWidget {
  final String? value;
  final Widget body;
  final Function(bool expanded) onToggle;
  const CollapsibleField(
      {Key? key, required this.body, this.value, required this.onToggle})
      : super(key: key);

  @override
  State<CollapsibleField> createState() => _CollapsibleFieldState();
}

class _CollapsibleFieldState extends State<CollapsibleField> {
  double animatedHeight = 0;
  bool expanded = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(5),
          child: GestureDetector(
              child: TextFormField(
                  initialValue: widget.value,
                  onTap: () {
                    setState(() {
                      expanded = !expanded;
                      expanded ? animatedHeight = 510.0 : animatedHeight = 0.0;
                      widget.onToggle(expanded);
                    });
                  },
                  key: UniqueKey(),
                  readOnly: true,
                  enableInteractiveSelection: true,
                  decoration: InputDecoration(
                      label: const Text("Name*"),
                      contentPadding: const EdgeInsets.all(12),
                      isDense: true,
                      border: const OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10))),
                      floatingLabelBehavior: FloatingLabelBehavior.never,
                      suffixIconConstraints:
                          const BoxConstraints(minWidth: 0, minHeight: 0),
                      suffixIcon: expanded
                          ? const Icon(
                              Icons.arrow_drop_down_rounded,
                              size: 32,
                            )
                          : const Icon(
                              Icons.arrow_drop_up_rounded,
                              size: 32,
                            )))),
        ),
        AnimatedSize(
          duration: const Duration(milliseconds: 300),
          reverseDuration: const Duration(milliseconds: 300),
          key: UniqueKey(),
          clipBehavior: Clip.antiAlias,
          child: SizedBox(
            height: animatedHeight,
            child: Column(
              children: [
                const SizedBox(height: 10),
                widget.body,
              ],
            ),
          ),
        ),
      ],
    );
  }
}
