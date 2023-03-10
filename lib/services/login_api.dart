import 'package:flutter/material.dart';

class Auth with ChangeNotifier {
  bool _isLoggedIn = false;
  String _token = '';

  bool get isLoggedIn => _isLoggedIn;

  set isLoggedIn(bool value) {
    _isLoggedIn = value;
    notifyListeners();
  }

  String get token => _token;

  setToken(String token) {
    _token = token;
    _isLoggedIn = true;
    notifyListeners();
  }
}
