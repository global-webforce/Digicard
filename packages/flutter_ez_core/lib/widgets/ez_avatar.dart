import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class EzAvatar extends StatelessWidget {
  final String imgUrl;
  final String name;
  final double radius;
  final Widget? badge;
  const EzAvatar(
      {Key? key,
      this.imgUrl = "",
      this.name = "",
      this.radius = 50,
      this.badge})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    String getInitials(String name) => name.isNotEmpty
        ? name.trim().split(RegExp(' +')).map((s) => s[0]).take(2).join()
        : '';

    return CachedNetworkImage(
      imageUrl: imgUrl,
      imageBuilder: (context, imageProvider) {
        return CircleAvatar(
          radius: radius,
          backgroundImage: imageProvider,
          backgroundColor: Colors.grey,
        );
      },
      placeholder: (context, url) {
        return CircleAvatar(
            radius: radius,
            backgroundColor: Colors.grey,
            child: Text(
              name.isNotEmpty ? getInitials(name) : "N/A",
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w300,
                color: Colors.white,
              ),
            ));
      },
      errorWidget: (context, url, error) {
        return CircleAvatar(
            radius: radius,
            backgroundColor: Colors.grey,
            child: Text(
              name.isNotEmpty ? getInitials(name) : "N/A",
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w300,
                color: Colors.white,
              ),
            ));
      },
    );
  }
}
