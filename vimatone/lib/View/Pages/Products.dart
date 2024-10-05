import 'package:flutter/material.dart';
import 'package:vimatone/widgets/CustomAppBar.dart';

class ProductsPage extends StatefulWidget {
  const ProductsPage({super.key});

  @override
  State<ProductsPage> createState() => _ProductsPageState();
}

class _ProductsPageState extends State<ProductsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: "Products",
        showCartIcon: true,
        cartLength: 20,
        showSearchIcon: true,
      ),
      body: Center(
        child: Text("ProductsPage"),
      ),
    );
  }
}
