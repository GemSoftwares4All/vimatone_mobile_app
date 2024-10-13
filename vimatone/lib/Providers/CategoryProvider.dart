import 'package:flutter/material.dart';
import 'package:vimatone/Models/CategoryModel.dart';

class CategoryProvider extends ChangeNotifier {
  List<CategoryModel> _category = [];

  // getter for cart
  List<CategoryModel> get category => _category;

  void addCategory(CategoryModel category) {
    if (!_category.contains(category)) {
      _category.add(category);
    }
    // notifyListeners();
  }
}
