// ignore_for_file: sized_box_for_whitespace, use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vimatone/Components/AppButton.dart';
import 'package:vimatone/Components/TopAppBar.dart';
import 'package:vimatone/Config/Extras.dart';
import 'package:vimatone/Providers/AuthProvider.dart';
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
    final authProvider = Provider.of<AuthProvider>(context);
    return Scaffold(
      appBar: const Topappbar(
        title: "Cart",
        showCartIcon: false,
        showSearch: false,
      ),
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
            padding: const EdgeInsets.all(padding_md),
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
                AppButton(
                  onTap: () async {
                    await Future.delayed(const Duration(seconds: 2), () {
                      if (authProvider.isAuthorized) {
                        setState(() {
                          cartProvider.clearCart();
                        });
                      } else {
                        Navigator.of(context).pushNamed("/login");
                      }
                    });
                  },
                  items: [
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
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
