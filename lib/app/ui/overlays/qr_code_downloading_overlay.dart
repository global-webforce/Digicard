import 'package:flutter/material.dart';

class DownloadQROverlay extends StatelessWidget {
  const DownloadQROverlay({super.key});

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
              'Downloading QR...',
              style: TextStyle(color: Colors.white),
            ),
          ],
        ),
      );
}
