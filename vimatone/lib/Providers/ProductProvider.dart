import 'package:flutter/material.dart';
import 'package:vimatone/Models/ProductsModel.dart';

class ProductProvider extends ChangeNotifier {
  // List<ProductsModel> _products = ProductList;
  List<ProductsModel> _products = [];

  // getter for products
  List<ProductsModel> get products => _products;
  // add products
  void addProducts(ProductsModel product) {
    _products.add(product);
  }
}
