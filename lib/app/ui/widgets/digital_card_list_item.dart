import 'package:cached_network_image/cached_network_image.dart';
import 'package:digicard/app/constants/colors.dart';
import 'package:digicard/app/extensions/color_extension.dart';
import 'package:digicard/app/models/digital_card.dart';
import 'package:digicard/app/ui/_core/value_widget.dart';
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
        color: Color(card.color ?? kcPrimaryColorInt),
        child: Material(
          child: CachedNetworkImage(
            imageUrl:
                "https://kbetklswsjdfouluglbr.supabase.co/storage/v1/object/public/images/avatars/${card.avatarUrl}",
            width: double.infinity,
            height: 140,
            fit: BoxFit.cover,
            placeholder: (context, url) {
              return Container(
                  color: Color(card.color ?? kcPrimaryColorInt).darken(0.1));
            },
            errorWidget: (context, url, error) {
              return Container(
                width: double.infinity,
                height: 140,
                color: Color(card.color ?? kcPrimaryColorInt).darken(0.1),
              );
            },
          ),
        ),
      );
    }

    Widget title() {
      return StringWidget(
        ["${card.title}"],
        textCase: TextCase.title,
        builder: (value) {
          return Text(
            value,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
            maxLines: 3,
            overflow: TextOverflow.ellipsis,
          );
        },
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
                  color: Color(card.color ?? kcPrimaryColorInt),
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
