import 'package:flutter/material.dart';

class AuthProvider extends ChangeNotifier {
  bool _isAuthorized = true;
  bool get isAuthorized => _isAuthorized;

  // bumy change state
  void toggleAuth() {
    _isAuthorized = _isAuthorized ? false : true;
    notifyListeners();
  }
  // write function to check local storage for auth keys
  // if auth keys present, _isAuthorized = true, else false
}
