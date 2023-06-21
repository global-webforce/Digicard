import 'package:flutter/material.dart';

class OwnButton extends StatelessWidget {
  const OwnButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.black.withOpacity(0.6),
      child: const Padding(
        padding: EdgeInsets.all(8.0),
        child: Text(
          "You own this card",
          style: TextStyle(fontStyle: FontStyle.italic, fontSize: 14),
        ),
      ),
    );
  }
}
