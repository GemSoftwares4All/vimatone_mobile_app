import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
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
      margin: EdgeInsets.only(bottom: padding_sm),
      padding: EdgeInsets.all(padding_md),
      color: color_primary,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Flexible(
            flex: 3,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(radius_md),
              child: Image.asset(
                cartProvider.cart[widget.index].thumbnail_id!,
                width: 100,
                height: 100,
              ),
            ),
          ),
          Spacer(),
          Flexible(
            flex: 6,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  cartProvider.cart[widget.index].title,
                  style: font_body.copyWith(
                    overflow: TextOverflow.ellipsis,
                  ),
                  maxLines: 1,
                ),
                Text(
                  "$currency ${cartProvider.cart[widget.index].sale_price}",
                  style: font_body.copyWith(color: color_secondary),
                ),
                spaceHeight_md(),
                Row(
                  children: [
                    Flexible(
                      flex: 1,
                      child: IconButton(
                        onPressed: () {
                          setState(() {
                            cartProvider.decreaceQty(widget.index);
                          });
                        },
                        icon: Icon(
                          Icons.remove,
                          color: color_gray,
                        ),
                      ),
                    ),
                    Flexible(
                      flex: 1,
                      child: TextFormField(
                        controller: textfieldController,
                        textAlign: TextAlign.center,
                        decoration: InputDecoration(
                            contentPadding: EdgeInsets.all(padding_sm),
                            enabled: false),
                      ),
                    ),
                    Flexible(
                      flex: 1,
                      child: IconButton(
                        onPressed: () {
                          setState(() {
                            cartProvider.increaseQty(widget.index);
                          });
                        },
                        icon: Icon(
                          Icons.add,
                          color: color_gray,
                        ),
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
          Spacer(),
          GestureDetector(
            onTap: () {
              cartProvider.removeFromCart(widget.index);
            },
            child: Icon(
              Icons.delete,
              color: color_error,
            ),
          )
        ],
      ),
    );
  }
}
