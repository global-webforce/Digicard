import 'package:flutter/material.dart';

class EZAppBarIcon extends StatelessWidget {
  final IconData iconData;
  final String? text;
  final VoidCallback? onTap;
  final int notificationCount;
  const EZAppBarIcon({
    Key? key,
    this.onTap,
    this.text,
    required this.iconData,
    this.notificationCount = 0,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: SizedBox(
        width: 50,
        // padding: const EdgeInsets.symmetric(horizontal: 8),
        child: Stack(
          alignment: Alignment.center,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Expanded(child: Icon(iconData)),
                if (text != null)
                  Text("$text", overflow: TextOverflow.ellipsis),
              ],
            ),
            if (notificationCount > 0)
              Positioned(
                  top: 4,
                  right: 2,
                  child: CircleAvatar(
                    foregroundColor: Colors.white,
                    backgroundColor: Colors.red,
                    radius: 12,
                    child: Text(
                      '$notificationCount',
                      style: const TextStyle(fontSize: 13),
                    ),
                  ))
          ],
        ),
      ),
    );
  }
}
