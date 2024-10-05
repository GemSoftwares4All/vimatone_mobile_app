import 'package:flutter/material.dart';
import 'package:vimatone/widgets/CustomAppBar.dart';

class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: "Cart",
      ),
      body: Center(
        child: Text("CartPage"),
      ),
    );
  }
}
