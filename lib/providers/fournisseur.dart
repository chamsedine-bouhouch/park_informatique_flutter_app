// ignore_for_file: unused_local_variable

import 'dart:convert';
import 'dart:developer';

import 'package:dio/dio.dart' as Dio;
import 'package:flutter/foundation.dart';
import 'package:flutter_app/models/fourniseur.dart';
import 'package:flutter_app/providers/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class FournisseursProvider extends ChangeNotifier {
  List<Fournisseur> _fournisseurs = [];
  List<Fournisseur> get fournisseurs => _fournisseurs;

  final storage = FlutterSecureStorage();

  // Read value

  void getAllFournisseurs() async {
    var token = await storage.read(key: 'token');

    Dio.Response response = await dio().get('/fournisseurs',
        options: Dio.Options(headers: {"Authorization": "Bearer $token"}));

    List data = response.data;

    _fournisseurs = data
        .map<Fournisseur>((fournisseur) => Fournisseur.fromJson(fournisseur))
        .toList();
        notifyListeners();
  }
}
