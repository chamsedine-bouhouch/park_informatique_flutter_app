// ignore: library_prefixes
import 'package:dio/dio.dart' as Dio;
import 'package:flutter/foundation.dart';
import 'package:flutter_app/models/User.dart';

import 'package:flutter_app/services/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class Auth extends ChangeNotifier {
  bool _isLoggedIn = false;
  late User _user;
  late String _token;
  bool get authentificated => _isLoggedIn;
  User get user => _user;

// Create storage
  final storage = new FlutterSecureStorage();
  // lOGIN
  void login({required Map creds}) async {
    if (kDebugMode) {
      print(creds);
    }
    try {
      Dio.Response response = await dio().post('/sanctum/token', data: creds);
      String token = response.data.toString();
      print(token);
      this.tryToken(token: token);
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
    }
    // print(creds);

    // _isLoggedIn = true;
    // notifyListeners();
  }

  void tryToken({required String token}) async {
    print(token);
    if (token == null) {
      return;
    } else {
      try {
        Dio.Response response = await dio().get('/user',
            options: Dio.Options(headers: {
              "Content-Type": "application/json",
              "Authorization": "Bearer $token",
            }));

        _isLoggedIn = true;
        _user = User.fromJson(response.data);
        this.storeToken(token: token);
        notifyListeners();
        print(response.data);
      } catch (e) {
        print(e);
      }
    }
  }

  // Save token
  void storeToken({required String token})async{
    await storage.write(key: 'token', value: token);

  }
  // Read token
  void readToken()async{
    String? token = await storage.read(key: 'token');

  }

  void logout() {
    _isLoggedIn = false;
    notifyListeners();
  }
}
