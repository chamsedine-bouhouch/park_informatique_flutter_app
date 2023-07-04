// ignore: library_prefixes
import 'package:dio/dio.dart' as Dio;
import 'package:flutter/foundation.dart';
import 'package:flutter_app/models/User.dart';

import 'package:flutter_app/providers/dio.dart';
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
  }

  void tryToken({String? token}) async {
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
        _token = token;
        notifyListeners();
        print(_user.id);
      } catch (e) {
        print(e);
      }
    }
  }

  // Save token,
  void storeToken({String? token}) async {
    await storage.write(key: 'token', value: token);
  }

  // Read token
  void readToken() async {
    String? token = await storage.read(key: 'token');
  }

  void logout() async {
    try {
      Dio.Response response = await dio().get('/user/revoke',
          options: Dio.Options(headers: {
            "Authorization": "Bearer $_token",
          }));
      print(response);
    } catch (e) {
      print(e);
    }
    // cleanup();
    // notifyListeners();
  }

  void cleanup() async {
    _user = User(id: 0, name: '', email: '', avatar: '');
    _isLoggedIn = false;
    _token = '';
    await storage.delete(key: 'token');
  }
}
