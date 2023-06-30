// ignore_for_file: unused_local_variable

import 'dart:convert';
import 'dart:developer';

import 'package:dio/dio.dart' as Dio;
import 'package:flutter/foundation.dart';
import 'package:flutter_app/models/ticket.dart';
import 'package:flutter_app/providers/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

final List<Ticket> initialData = List.generate(
  10,
  (i) => Ticket(
      'Ticket $i', 'A description of what needs to be done for Todo $i', 1),
);

class TicketsProvider extends ChangeNotifier {
  List<Ticket> _tickets = initialData;
  List<Ticket> get tickets => _tickets;

  final storage = FlutterSecureStorage();


  // Read value

  void getAllTickets() async {
    var token = await storage.read(key: 'token');

    Dio.Response response = await dio().get('/tickets',
        options: Dio.Options(headers: {
           "Authorization": "Bearer $token"
        }));

   List data = response.data;
 
 
 print(data);
    // print(response.data);
    // List __tickets = json.decode(response.toString());
      // final parsed = jsonDecode(response.toString()).cast<Map<String, dynamic>>();
 
   _tickets= data.map<Ticket>((ticket) => Ticket.fromJson(ticket)).toList();
  }
}
