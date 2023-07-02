// ignore_for_file: unused_local_variable

import 'dart:convert';
import 'dart:developer';

import 'package:dio/dio.dart' as Dio;
import 'package:flutter/foundation.dart';
import 'package:flutter_app/models/fourniseur.dart';
import 'package:flutter_app/models/parc.dart';
import 'package:flutter_app/providers/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class ParcsProvider extends ChangeNotifier {
  List<Parc> _parcs = [];
  List<Parc> get parcs => _parcs;

  final storage = FlutterSecureStorage();

  // Read value

  void getAllParcs() async {
    var token = await storage.read(key: 'token');

    Dio.Response response = await dio().get('/parcs',
        options: Dio.Options(headers: {"Authorization": "Bearer $token"}));

    List data = response.data;

    _parcs = data
        .map<Parc>((parc) => Parc.fromJson(parc))
        .toList();
  }
}
