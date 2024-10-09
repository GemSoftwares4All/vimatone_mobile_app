import 'package:flutter/material.dart';
import 'package:vimatone/Models/ProductsModel.dart';

class CartProvider extends ChangeNotifier {
  List<ProductsModel> _cart = [];

  // getter for cart
  List<ProductsModel> get cart => _cart;

  void addToCart(ProductsModel product) {
    if (_cart.contains(product)) {
      _cart[_cart.indexOf(product)].quantity += 1;
    } else {
      _cart.add(product);
    }
    notifyListeners();
  }

  double sumTotal() {
    if (_cart.length > 0) {
      double total = 0;
      for (var product in _cart) {
        total += product.quantity * product.sale_price!;
      }
      return total;
    }
    return 0.00;
  }

  void removeFromCart(int index) {
    _cart.removeAt(index);
    notifyListeners();
  }

  void clearCart() {
    _cart.clear();
    notifyListeners();
  }

  void decreaceQty(int index) {
    if (_cart[index].quantity > 1) _cart[index].quantity -= 1;
    notifyListeners();
  }

  void increaseQty(int index) {
    if (_cart[index].quantity <= _cart[index].stock) _cart[index].quantity += 1;
    notifyListeners();
  }
}
