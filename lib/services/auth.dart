import 'package:dio/dio.dart' as Dio;
import 'package:flutter/foundation.dart';

import 'package:flutter_app/services/dio.dart';

class Auth extends ChangeNotifier {
  bool _isLoggedIn = false;
  bool get authentificated => _isLoggedIn;

  void login({required Map creds}) async {
    print(creds);
    try {
      Dio.Response response = await dio().post('/auth/login', data: creds);
      if (kDebugMode) {
        print(response.data.toString());
      }
    } catch (e) {
      print(e);
    }
    // print(creds);

    // _isLoggedIn = true;
    // notifyListeners();
  }

  void logout() {
    _isLoggedIn = false;
    notifyListeners();
  }
}
