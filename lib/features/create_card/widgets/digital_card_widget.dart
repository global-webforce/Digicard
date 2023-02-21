import 'package:auto_size_text/auto_size_text.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:digicard/app/models/digital_card.model.dart';
import 'package:flutter/material.dart';

class DigitalCardWidget extends StatelessWidget {
  final DigitalCard card;
  final AutoSizeGroup? autoSizeGroup;
  final Function onTap;
  const DigitalCardWidget(
      {Key? key, required this.card, required this.onTap, this.autoSizeGroup})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget image() {
      return Container(
        color: Colors.white,
        child: CachedNetworkImage(
          imageUrl: "${card.image}",
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
        maxLines: 2,
        overflow: TextOverflow.ellipsis,
      );
    }

    return SizedBox(
      width: 256,
      height: 222,
      child: IntrinsicHeight(
        child: Card(
          clipBehavior: Clip.antiAlias,
          child: InkWell(
            onTap: () => onTap(),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                image(),
                Container(
                  color: Colors.red,
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
