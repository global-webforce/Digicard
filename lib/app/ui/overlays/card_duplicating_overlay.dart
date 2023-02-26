import 'package:flutter/material.dart';

class DuplicatingOverlay extends StatelessWidget {
  const DuplicatingOverlay({super.key});

  @override
  Widget build(BuildContext context) => Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: const [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.0),
              child: CircularProgressIndicator(),
            ),
            SizedBox(height: 12),
            Text(
              'Duplicating...',
              style: TextStyle(color: Colors.white),
            ),
          ],
        ),
      );
}
