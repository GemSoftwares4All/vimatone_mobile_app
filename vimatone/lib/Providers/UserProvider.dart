import 'package:flutter/material.dart';
import 'package:vimatone/Models/UserModel.dart';

class UserProvider extends ChangeNotifier {
  UserModel? _userModel;
  UserModel get CurrentUser => _userModel!;

  void setUser(Map<String, dynamic> user) {
    _userModel = UserModel.fromMap(user);
    notifyListeners();
  }
}
