import 'package:flutter/material.dart';

class Collapsible extends StatefulWidget {
  final String? value;
  final Widget body;
  final Function(bool expanded) onToggle;
  const Collapsible(
      {Key? key, required this.body, this.value, required this.onToggle})
      : super(key: key);

  @override
  State<Collapsible> createState() => _CollapsibleState();
}

class _CollapsibleState extends State<Collapsible> {
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
                      expanded ? animatedHeight = 560.0 : animatedHeight = 0.0;
                      widget.onToggle(expanded);
                    });
                  },
                  key: UniqueKey(),
                  readOnly: true,
                  enableInteractiveSelection: true,
                  decoration: InputDecoration(
                      label: const Text("Full name"),
                      alignLabelWithHint: true,
                      filled: false,
                      fillColor: Colors.transparent,
                      border: const UnderlineInputBorder(),
                      enabledBorder: const UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey),
                      ),
                      floatingLabelBehavior: FloatingLabelBehavior.always,
                      suffixIcon: expanded
                          ? const Icon(
                              Icons.arrow_drop_down_rounded,
                              size: 28,
                            )
                          : const Icon(
                              Icons.arrow_drop_up_rounded,
                              size: 28,
                            )))),
        ),
        AnimatedSize(
          clipBehavior: Clip.hardEdge,
          duration: const Duration(milliseconds: 250),
          curve: Curves.linear,
          reverseDuration: const Duration(milliseconds: 250),
          child: !expanded
              ? const SizedBox(
                  width: double.infinity,
                )
              : SizedBox(height: animatedHeight, child: widget.body),
        ),
      ],
    );
  }
}
