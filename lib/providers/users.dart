// ignore_for_file: unused_local_variable

import 'dart:convert';
import 'dart:developer';

import 'package:dio/dio.dart' as Dio;
import 'package:flutter/foundation.dart';
import 'package:flutter_app/models/fourniseur.dart';
import 'package:flutter_app/models/parc.dart';
import 'package:flutter_app/models/user.dart';
import 'package:flutter_app/providers/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class UsersProvider extends ChangeNotifier {
  List<User> _employees = [];
  List<User> get employees => _employees;

  final storage = FlutterSecureStorage();

  // Read value

  void getAllEmployees() async {
    var token = await storage.read(key: 'token');

    Dio.Response response = await dio().get('/employes',
        options: Dio.Options(headers: {"Authorization": "Bearer $token"}));

    List data = response.data;
    print('provider users');
    // print(data);
    // print(response.data);
    // List _users = json.decode(response.toString());
    // final parsed = jsonDecode(response.toString()).cast<Map<String, dynamic>>();

    _employees = data.map<User>((user) => User.fromJson(user)).toList();

    print(_employees);
    notifyListeners();
  }
}
