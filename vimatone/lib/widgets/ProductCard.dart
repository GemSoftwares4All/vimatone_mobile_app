import 'package:flutter/material.dart';
import 'package:vimatone/Core/Extras.dart';

class Productcard extends StatelessWidget {
  final String image;
  final String price;
  final String title;
  final String? priceStroke;
  final bool isSaved;
  final VoidCallback onCardTap;
  final VoidCallback onSaveTap;
  final VoidCallback onAddTap;
  const Productcard({
    super.key,
    required this.image,
    required this.price,
    this.priceStroke,
    this.isSaved = false,
    required this.title,
    required this.onCardTap,
    required this.onSaveTap,
    required this.onAddTap,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      borderRadius: BorderRadius.circular(Extras.radius_md),
      color: Extras.background,
      clipBehavior: Clip.antiAlias,
      child: InkWell(
        onTap: onCardTap,
        child: Container(
          width: 150,
          padding: EdgeInsets.all(Extras.padding_sm),
          child: Column(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(Extras.radius_md),
                child: Image.asset(
                  image,
                  width: 140,
                  height: 100,
                  fit: BoxFit.cover,
                  alignment: Alignment.center,
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        price,
                        style: TextStyle(
                            color: Extras.secondary,
                            fontSize: Extras.fontBody_md,
                            fontWeight: FontWeight.w800),
                      ),
                      if (priceStroke != null)
                        Text(
                          priceStroke!,
                          style: TextStyle(
                            color: Extras.gray,
                            fontSize: Extras.fontBody_xsm,
                            decoration: TextDecoration.lineThrough,
                            decorationColor: Extras.gray,
                          ),
                        )
                    ],
                  ),
                  IconButton(
                    onPressed: onSaveTap,
                    icon: Icon(
                      isSaved == true
                          ? Icons.favorite_rounded
                          : Icons.favorite_border_outlined,
                      color: Extras.secondary,
                    ),
                  ),
                ],
              ),
              Text(
                title,
                style: TextStyle(
                  overflow: TextOverflow.ellipsis,
                  color: Extras.text,
                  fontSize: Extras.fontBody_sm,
                ),
              ),
              TextButton(
                  onPressed: onAddTap,
                  style: ButtonStyle(
                      backgroundColor: WidgetStatePropertyAll(Extras.secondary),
                      shape: WidgetStatePropertyAll(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(Extras.radius_md),
                        ),
                      )),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text(
                        "Add to Cart",
                        style: TextStyle(
                          color: Extras.primary,
                          fontSize: Extras.fontBody_sm,
                        ),
                      ),
                      Icon(
                        Icons.add_shopping_cart_rounded,
                        color: Extras.primary,
                        size: Extras.fontBody_md,
                      ),
                    ],
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
