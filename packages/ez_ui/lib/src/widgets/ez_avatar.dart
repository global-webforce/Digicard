import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:ez_core/ez_core.dart';

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
              name.isNotEmpty ? name.initials() : "N/A",
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
              name.isNotEmpty ? name.initials() : "N/A",
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w300,
                color: Colors.white,
              ),
            ));
      },
    );

    /*   CircleAvatar(
      backgroundColor: Colors.white,
      radius: radius,
      child: LayoutBuilder(builder: (context, constraints) {
        return Stack(
          children: [
            CircularProfileAvatar(
              imgUrl,
              radius: radius,
              borderWidth: 1,
              borderColor: Colors.grey.withOpacity(0.4),
              backgroundColor: Theme.of(context).cardColor,
              foregroundColor: Theme.of(context).colorScheme.primary,
              initialsText: Text(
                (firstName != null) ? firstName!.initials() : "N/A",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w300,
                  color: Theme.of(context).colorScheme.secondary,
                ),
              ),
              errorWidget: ((context, url, error) => const SizedBox.shrink()),
              imageFit: BoxFit.cover,
              cacheImage: true,
              onTap: () {},
            ),
            if (badge != null)
              Positioned(
                bottom: 5,
                right: 0,
                child:
                    SizedBox(width: constraints.maxWidth * 0.3, child: badge),
              ),
          ],
        );
      }),
    ); */
  }
}
