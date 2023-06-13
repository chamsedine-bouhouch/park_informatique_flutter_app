import 'package:dio/dio.dart';
final dio = Dio(); // With default `Options`.

void configureDio() {
  // Set default configs
  // android
  dio.options.baseUrl = 'https://10.0.2.2:8000/api';
  dio.options.headers['accept'] = 'Application/Json';
  // dio.options.connectTimeout = const Duration(seconds: 5);
  // dio.options.receiveTimeout = const Duration(seconds: 3); 

}