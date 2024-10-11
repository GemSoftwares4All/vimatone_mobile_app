import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vimatone/Components/TopAppBar.dart';
import 'package:vimatone/Config/Extras.dart';
import 'package:vimatone/Providers/CartProvider.dart';
import 'package:vimatone/Screens/Cart/widgets/cartItemCard.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  Widget build(BuildContext context) {
    final cartProvider = Provider.of<CartProvider>(context);
    return Scaffold(
      appBar: Topappbar(title: "Cart"),
      body: Column(
        children: [
          // for cart items
          Flexible(
            flex: 5,
            child: Container(
              height: double.infinity,
              child: SingleChildScrollView(
                child: Column(
                  children: List.generate(
                    cartProvider.cart.length,
                    (index) => Cartitemcard(index: index),
                  ),
                ),
              ),
            ),
          ),

          // for cart details
          Container(
            width: double.infinity,
            padding: EdgeInsets.all(padding_md),
            color: color_primary,
            child: Column(
              children: [
                Text(
                  "Total:",
                  style: font_body,
                ),
                Text(
                  "$currency ${cartProvider.sumTotal().toStringAsFixed(2)}",
                  style: font_subtitle.copyWith(
                    color: color_secondary,
                  ),
                ),
                spaceHeight_md(),
                TextButton(
                  onPressed: () {},
                  style: ButtonStyle(
                      padding:
                          WidgetStatePropertyAll(EdgeInsets.all(padding_md)),
                      backgroundColor: WidgetStatePropertyAll(color_secondary),
                      shape: WidgetStatePropertyAll(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(radius_md),
                        ),
                      )),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text(
                        "Checkout",
                        style: font_subtitle.copyWith(color: color_primary),
                      ),
                      Icon(
                        Icons.local_shipping_outlined,
                        color: color_primary,
                        size: size_lg,
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
