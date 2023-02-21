import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class EzAppBarAvatar extends StatelessWidget {
  const EzAppBarAvatar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 60,
      child: PopupMenuButton(
        icon: CachedNetworkImage(
          imageUrl:
              "Xhttps://4.bp.blogspot.com/-Jx21kNqFSTU/UXemtqPhZCI/AAAAAAAAh74/BMGSzpU6F48/s1600/funny-cat-pictures-047-001.jpg",
          imageBuilder: (context, imageProvider) {
            return CircleAvatar(
              backgroundImage: imageProvider,
              backgroundColor: Colors.red,
            );
          },
          placeholder: (context, url) {
            return const CircleAvatar(
              backgroundColor: Colors.grey,
              child: Icon(
                Icons.person,
                color: Colors.white,
              ),
            );
          },
          errorWidget: (context, url, error) {
            return const CircleAvatar(
              backgroundColor: Colors.grey,
              child: Icon(
                Icons.person,
                color: Colors.white,
              ),
            );
          },
        ),
        itemBuilder: (BuildContext context) {
          return [
            const PopupMenuItem<String>(
              value: '1',
              child: Text('1'),
            ),
            const PopupMenuItem<String>(
              value: '2',
              child: Text('2'),
            ),
          ];
        },
      ),
    );
  }
}
