import 'package:flutter/cupertino.dart';

class Auth extends ChangeNotifier {
  bool _isLoggedIn = false;
  bool get authentificated => _isLoggedIn;

  void login(Map creds) {
    _isLoggedIn = true;
    notifyListeners();
  }

  void logout(Map creds) {
    _isLoggedIn = false;
    notifyListeners();
  }
  
}
