import 'package:flutter/material.dart';
import 'package:vimatone/Components/AppNetworkImage.dart';
import 'package:vimatone/Config/Extras.dart';

class OrderTile extends StatelessWidget {
  
  final String price;
  final String title;
  final Color? backgroundColor;
  final String? priceStroke;
  const OrderTile({
    super.key,
    required this.price,
    this.priceStroke,
    required this.title,
    this.backgroundColor,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      borderRadius: BorderRadius.circular(radius_md),
      color: backgroundColor == null ? color_primary : backgroundColor,
      clipBehavior: Clip.antiAlias,
      child: InkWell(
        overlayColor: WidgetStatePropertyAll(color_background),
        // onTap: onCardTap,
        child: Container(
          width: double.infinity,
          padding: EdgeInsets.all(padding_sm),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  if (priceStroke != null)
                    Text(
                      priceStroke!,
                      style: font_body.copyWith(
                        color: color_gray,
                        decoration: TextDecoration.lineThrough,
                        decorationColor: color_gray,
                      ),
                    ),
                  spaceWidth_md(),
                  Text(
                    price,
                    style: font_body_title.copyWith(
                        color: color_secondary, height: 1),
                  ),
                  const Spacer()
                ],
              ),
              Text(
                title,
                style: font_body.copyWith(
                  overflow: TextOverflow.ellipsis,
                ),
                maxLines: 2,
              )
            ],
          ),
        ),
      ),
    );
  }
}
