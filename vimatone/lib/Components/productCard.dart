import 'package:flutter/material.dart';
import 'package:vimatone/Components/AppButton.dart';
import 'package:vimatone/Components/AppNetworkImage.dart';
import 'package:vimatone/Config/Extras.dart';

class Productcard extends StatelessWidget {
  final String image;
  final String price;
  final String title;
  final Color? backgroundColor;
  final String? priceStroke;
  final VoidCallback onCardTap;
  final VoidCallback onAddTap;
  const Productcard({
    super.key,
    required this.image,
    required this.price,
    this.priceStroke,
    required this.title,
    required this.onCardTap,
    required this.onAddTap,
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
        onTap: onCardTap,
        child: Container(
          width: double.infinity,
          padding: EdgeInsets.all(padding_sm),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(radius_md),
                child: AppNetworkImage(
                  image: image,
                  width: double.infinity,
                  height: 150,
                ),
                // Image.asset(
                //   image,
                //   width: double.infinity,
                //   height: 150,
                //   fit: BoxFit.cover,
                //   alignment: Alignment.center,
                // ),
              ),
              Wrap(
                // crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  if (priceStroke != null)
                    Text(
                      "${currency}${priceStroke!}",
                      style: font_body.copyWith(
                        color: color_gray,
                        decoration: TextDecoration.lineThrough,
                        decorationColor: color_gray,
                      ),
                    ),
                  spaceWidth_md(),
                  Text(
                    "${currency}${price}",
                    style: font_body_title.copyWith(
                        color: color_secondary, height: 1),
                  ),
                  // Spacer()
                ],
              ),
              Text(
                title,
                style: font_body.copyWith(
                  overflow: TextOverflow.ellipsis,
                ),
                maxLines: 1,
              ),
              AppButton(
                  onTap: () async {
                    await Future.sync(onAddTap);
                  },
                  items: [
                    Text("Add to Cart",
                        style: font_body.copyWith(color: color_primary)),
                    Icon(
                      Icons.add_shopping_cart_rounded,
                      color: color_primary,
                      size: size_md,
                    )
                  ])
            ],
          ),
        ),
      ),
    );
  }
}
