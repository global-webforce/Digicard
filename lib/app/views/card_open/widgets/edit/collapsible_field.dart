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
                      expanded ? animatedHeight = 595 : animatedHeight = 0.0;
                      widget.onToggle(expanded);
                    });
                  },
                  key: UniqueKey(),
                  readOnly: true,
                  enableInteractiveSelection: true,
                  decoration: InputDecoration(
                      label: const Text("Name*"),
                      alignLabelWithHint: true,
                      filled: false,
                      fillColor: Colors.transparent,
                      border: const UnderlineInputBorder(),
                      enabledBorder: const UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey),
                      ),
                      floatingLabelBehavior: FloatingLabelBehavior.auto,
                      suffixIconConstraints:
                          const BoxConstraints(minWidth: 0, minHeight: 0),
                      suffixIcon: expanded
                          ? const Padding(
                              padding: EdgeInsets.fromLTRB(15, 14, 8, 0),
                              child: Icon(
                                Icons.arrow_drop_down_rounded,
                                size: 32,
                              ),
                            )
                          : const Padding(
                              padding: EdgeInsets.fromLTRB(15, 14, 8, 0),
                              child: Icon(
                                Icons.arrow_drop_up_rounded,
                                size: 32,
                              ),
                            )))),
        ),
        AnimatedSize(
          clipBehavior: Clip.hardEdge,
          duration: const Duration(milliseconds: 500),
          curve: Curves.ease,
          reverseDuration: const Duration(milliseconds: 500),
          child: Column(
            children: [
              const SizedBox(height: 5),
              SizedBox(height: animatedHeight, child: widget.body),
            ],
          ),
        ),
      ],
    );
  }
}
