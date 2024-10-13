import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vimatone/Components/AppNetworkImage.dart';
import 'package:vimatone/Config/Extras.dart';
import 'package:vimatone/Providers/CartProvider.dart';

class Cartitemcard extends StatefulWidget {
  final int index;
  const Cartitemcard({super.key, required this.index});

  @override
  State<Cartitemcard> createState() => _CartitemcardState();
}

class _CartitemcardState extends State<Cartitemcard> {
  @override
  Widget build(BuildContext context) {
    final cartProvider = Provider.of<CartProvider>(context);
    final textfieldController = TextEditingController();
    textfieldController.text = "${cartProvider.cart[widget.index].quantity}";
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.only(bottom: padding_sm),
      padding: const EdgeInsets.all(padding_md),
      color: color_primary,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Flexible(
            flex: 2,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(radius_md),
              child: AppNetworkImage(
                image: (baseUrl +
                    explodeImages(
                        cartProvider.cart[widget.index].thumbnail_id!)[0]),
                width: 100,
                height: 100,
              ),
            ),
          ),
          const Spacer(),
          Flexible(
            flex: 4,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  cartProvider.cart[widget.index].title,
                  style: font_body.copyWith(
                      overflow: TextOverflow.ellipsis, height: 1),
                  maxLines: 3,
                ),
                spaceHeight_md(),
                Text(
                  "$currency ${cartProvider.cart[widget.index].sale_price}",
                  style: font_body.copyWith(color: color_secondary),
                ),
              ],
            ),
          ),
          const Spacer(),
          Flexible(
            flex: 2,
            child: Center(
              child: GestureDetector(
                onTap: () {
                  cartProvider.removeFromCart(widget.index);
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                    backgroundColor: color_success,
                    content: Text(
                      "Removed successfully!",
                      style: font_body.copyWith(color: color_dark),
                    ),
                  ));
                },
                child: Container(
                  padding: const EdgeInsets.all(padding_md),
                  child: Icon(
                    Icons.delete,
                    color: color_error,
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
