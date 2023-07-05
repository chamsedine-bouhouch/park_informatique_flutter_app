// ignore_for_file: unused_local_variable

import 'dart:convert';
import 'dart:developer';

import 'package:dio/dio.dart' as Dio;
import 'package:flutter/foundation.dart';
import 'package:flutter_app/models/experience.dart';
 import 'package:flutter_app/providers/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class ExperiencesProvider extends ChangeNotifier {
  List<Experience> _experiences = [];
  List<Experience> get experiences => _experiences;

  final storage = FlutterSecureStorage();

  // Read value

  void getAllExperiences() async {
    var token = await storage.read(key: 'token');

    Dio.Response response = await dio().get('/experiences',
        options: Dio.Options(headers: {"Authorization": "Bearer $token"}));

    List data = response.data;

    _experiences = data
        .map<Experience>((experience) => Experience.fromJson(experience))
        .toList();
        notifyListeners();
  }
     addExperience({required Map fomData}) async {
       var token = await storage.read(key: 'token');
       Dio.Response response = await dio().post('/experiences',
          data: fomData,
          options: Dio.Options(headers: {
            "Content-Type": "application/json",
            "Authorization": "Bearer $token",
          }));
      return response.data.toString();
   
  }
}
