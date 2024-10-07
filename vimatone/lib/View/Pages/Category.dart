import 'package:flutter/material.dart';
import 'package:vimatone/widgets/CustomAppBar.dart';

class CategoryPage extends StatefulWidget {
  const CategoryPage({super.key});

  @override
  State<CategoryPage> createState() => _CategoryPageState();
}

class _CategoryPageState extends State<CategoryPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: "Category",
        showCartIcon: true,
        showSearchIcon: true,
      ),
      body: Center(
        child: Text("CategoryPage"),
      ),
    );
  }
}
