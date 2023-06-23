import 'package:dio/dio.dart';
// final dio = Dio(); // With default `Options`.
Dio dio() {
  Dio dio = Dio();
  // Set default configs
  // android
  dio.options.baseUrl = 'http://localhost:8000/api';
  dio.options.headers['accept']="application/json";
  // dio.options.headers['Accept'] = 'application/json';
  // dio.options.connectTimeout = const Duration(seconds: 5);
  // dio.options.receiveTimeout = const Duration(seconds: 3); 
return dio;
}