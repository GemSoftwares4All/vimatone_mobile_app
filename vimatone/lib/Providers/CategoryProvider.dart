import 'package:flutter/material.dart';
import 'package:vimatone/Models/CategoryModel.dart';

class CategoryProvider extends ChangeNotifier {
  List<CategoryModel> _category = [];

  // getter for cart
  List<CategoryModel> get category => _category;

  void addCategories(List categoryList) {
    for (var _ele in categoryList) {
      _category.add(CategoryModel.fromJson(_ele));
    }
    notifyListeners();
  }
}
