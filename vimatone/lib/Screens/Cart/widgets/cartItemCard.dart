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
      margin: EdgeInsets.only(bottom: padding_sm),
      padding: EdgeInsets.all(padding_md),
      decoration: BoxDecoration(
        color: color_primary,
        borderRadius: BorderRadius.circular(radius_md),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(radius_md),
            child: Image.asset(
              cartProvider.cart[widget.index].thumbnail_id!,
              width: 100,
              height: 100,
            ),
          ),
          const Spacer(),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                width: MediaQuery.of(context).size.width / 2 - padding_lg,
                child: Text(
                  cartProvider.cart[widget.index].title,
                  style: font_body.copyWith(
                    overflow: TextOverflow.ellipsis,
                  ),
                  maxLines: 1,
                ),
              ),
              Text(
                "$currency ${cartProvider.cart[widget.index].sale_price}",
                style: font_body.copyWith(color: color_secondary),
              ),
              Text(
                "$currency ${cartProvider.cart[widget.index].regular_price}",
                style: font_tiny.copyWith(
                  color: color_gray,
                  decoration: TextDecoration.lineThrough,
                  decorationColor: color_gray,
                ),
              ),
              Row(
                children: [
                  IconButton(
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
                  SizedBox(
                    width: 60,
                    height: 40,
                    child: TextFormField(
                      controller: textfieldController,
                      textAlign: TextAlign.center,
                      decoration: InputDecoration(
                          contentPadding: EdgeInsets.symmetric(
                            horizontal: padding_sm,
                          ),
                          enabled: false),
                    ),
                  ),
                  IconButton(
                    onPressed: () {
                      setState(() {
                        cartProvider.increaseQty(widget.index);
                      });
                    },
                    icon: Icon(
                      Icons.add,
                      color: color_gray,
                    ),
                  )
                ],
              )
            ],
          ),
          const Spacer(),
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
