import 'package:flutter/material.dart';
import 'package:vimatone/widgets/CustomAppBar.dart';

class OrdersPage extends StatefulWidget {
  const OrdersPage({super.key});

  @override
  State<OrdersPage> createState() => _OrdersPageState();
}

class _OrdersPageState extends State<OrdersPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: "Orders",
        showCartIcon: true,
        cartLength: 20,
        // showSearchIcon: true,
        items: IconButton(
          onPressed: () {},
          icon: Icon(Icons.help_outline_rounded),
        ),
      ),
      body: Center(
        child: Text("OrdersPage"),
      ),
    );
  }
}
