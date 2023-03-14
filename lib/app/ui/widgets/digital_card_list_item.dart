import 'package:cached_network_image/cached_network_image.dart';
import 'package:digicard/app/extensions/color.dart';
import 'package:digicard/app/models/digital_card.dart';
import 'package:flutter/material.dart';

class DigitalCardListItem extends StatelessWidget {
  final DigitalCard card;

  final Function onTap;
  const DigitalCardListItem({
    Key? key,
    required this.card,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget image() {
      return Container(
        color: HexColor.fromHex("${card.color}"),
        child: CachedNetworkImage(
          imageUrl: "${card.profileImage}",
          width: double.infinity,
          height: 140,
          fit: BoxFit.cover,
          placeholder: (context, url) {
            return Container(
              color: Colors.grey,
            );
          },
          errorWidget: (context, url, error) {
            return Image.asset(
              "assets/images/placeholder.png",
              fit: BoxFit.cover,
            );
          },
        ),
      );
    }

    Widget title() {
      return Text(
        "${card.title}",
        style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        maxLines: 3,
        overflow: TextOverflow.ellipsis,
      );
    }

    return SizedBox(
      width: 256,
      height: 233,
      child: IntrinsicHeight(
        child: Card(
          elevation: 1,
          clipBehavior: Clip.antiAlias,
          child: InkWell(
            onTap: () => onTap(),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                image(),
                Container(
                  color: HexColor.fromHex("${card.color}"),
                  height: 5,
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(12),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        title(),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
