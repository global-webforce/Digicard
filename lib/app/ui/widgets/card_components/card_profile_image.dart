import 'package:cached_network_image/cached_network_image.dart';
import 'package:ez_core/ez_core.dart';
import 'package:flutter/material.dart';

class CardProfileImage extends StatelessWidget {
  final Color color;
  final String? imageUrl;
  final Function()? onTap;

  const CardProfileImage(
      {Key? key, this.imageUrl, required this.color, this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: CachedNetworkImage(
        imageUrl: "$imageUrl",
        imageBuilder: (context, imageProvider) {
          return InkWell(
            onTap: onTap != null
                ? () {
                    onTap!();
                  }
                : null,
            child: Ink(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: imageProvider,
                  fit: BoxFit.cover,
                ),
              ),
              width: double.infinity,
              height: 320,
            ),
          );
        },
        placeholder: (context, url) {
          return Container(
            width: double.infinity,
            height: 320,
            decoration: BoxDecoration(color: color.darken()),
          );
        },
        errorWidget: (context, url, error) {
          return InkWell(
            onTap: onTap != null
                ? () {
                    onTap!();
                  }
                : null,
            child: Ink(
              decoration: BoxDecoration(
                color: color.darken(0.2),
                /*     image: const DecorationImage(
                    fit: BoxFit.cover,
                    image: AssetImage("assets/images/temp_avatar.jpeg")), */
              ),
              width: double.infinity,
              height: 320,
              child: Center(
                child: Wrap(
                  spacing: 10,
                  alignment: WrapAlignment.center,
                  crossAxisAlignment: WrapCrossAlignment.center,
                  direction: Axis.vertical,
                  children: [
                    Icon(
                      Icons.add,
                      size: 30,
                      shadows: <Shadow>[
                        Shadow(
                            offset: const Offset(2, 2),
                            color: Colors.black.withOpacity(0.2),
                            blurRadius: 10.0)
                      ],
                    ),
                    Text(
                      "ADD PROFILE IMAGE",
                      style: TextStyle(
                        fontSize: 18,
                        shadows: <Shadow>[
                          Shadow(
                              offset: const Offset(2, 2),
                              color: Colors.black.withOpacity(0.2),
                              blurRadius: 10.0)
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
