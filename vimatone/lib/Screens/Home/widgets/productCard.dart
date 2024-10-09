import 'package:flutter/material.dart';
import 'package:vimatone/Config/Extras.dart';

class Productcard extends StatelessWidget {
  final String image;
  final String price;
  final String title;
  final String? priceStroke;
  final bool isSaved;
  final VoidCallback onCardTap;
  final VoidCallback onAddTap;
  const Productcard({
    super.key,
    required this.image,
    required this.price,
    this.priceStroke,
    this.isSaved = false,
    required this.title,
    required this.onCardTap,
    required this.onAddTap,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      borderRadius: BorderRadius.circular(radius_md),
      color: color_background,
      clipBehavior: Clip.antiAlias,
      child: InkWell(
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
                child: Hero(
                  tag: image,
                  child: Image.asset(
                    image,
                    width: double.infinity,
                    height: 150,
                    fit: BoxFit.cover,
                    alignment: Alignment.center,
                  ),
                ),
              ),
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
                  Spacer()
                ],
              ),
              Text(
                title,
                style: font_body.copyWith(
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              TextButton(
                onPressed: onAddTap,
                style: ButtonStyle(
                    backgroundColor: WidgetStatePropertyAll(color_secondary),
                    shape: WidgetStatePropertyAll(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(radius_md),
                      ),
                    )),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text("Add to Cart",
                        style: font_body.copyWith(color: color_primary)),
                    Icon(
                      Icons.add_shopping_cart_rounded,
                      color: color_primary,
                      size: size_md,
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
