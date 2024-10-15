import 'package:flutter/material.dart';

class AuthProvider extends ChangeNotifier {
  bool _isAuthorized = false;
  bool get isAuthorized => _isAuthorized;

  // bumy change state
  void setAuth(bool auth) {
    _isAuthorized = auth;
    notifyListeners();
  }
  // write function to check local storage for auth keys
  // if auth keys present, _isAuthorized = true, else false
}
