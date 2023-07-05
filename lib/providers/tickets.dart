// ignore_for_file: unused_local_variable

import 'dart:convert';
import 'dart:developer';

import 'package:dio/dio.dart' as Dio;
import 'package:flutter/foundation.dart';
import 'package:flutter_app/models/ticket.dart';
import 'package:flutter_app/providers/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

final List<Ticket> initialData = [];
// List.generate(
//   // 1,
//   // (i) => Ticket('Ticket $i', 'Une description de la ticket test numéro $i', 1,"En Attente"),

// );

class TicketsProvider extends ChangeNotifier {
  List<Ticket> _tickets = initialData;
  List<Ticket> get tickets => _tickets;

  final storage = FlutterSecureStorage();

  void getAllTickets() async {
    var token = await storage.read(key: 'token');

    Dio.Response response = await dio().get('/tickets',
        options: Dio.Options(headers: {"Authorization": "Bearer $token"}));

    List data = response.data;

    _tickets = data.map<Ticket>((ticket) => Ticket.fromJson(ticket)).toList();
    notifyListeners();
    
  }

   addTicket({required Map addTicketForm}) async {
       var token = await storage.read(key: 'token');
      print('ticket provider');
      Dio.Response response = await dio().post('/tickets',
          data: addTicketForm,
          options: Dio.Options(headers: {
            "Content-Type": "application/json",
            "Authorization": "Bearer $token",
          }));
      return response.data.toString();
   
  }
  void approuver({required ticketId}) async {
       var token = await storage.read(key: 'token');
      print('ticket Approuvé');
      Dio.Response response = await dio().put('/tickets/$ticketId/approuver',
          options: Dio.Options(headers: {
            "Content-Type": "application/json",
            "Authorization": "Bearer $token",
          }));
    
   notifyListeners();
  }
  void refuser({required ticketId}) async {
       var token = await storage.read(key: 'token');
      print('ticket refusé');
      Dio.Response response = await dio().put('/tickets/$ticketId/refuser',
          options: Dio.Options(headers: {
            "Content-Type": "application/json",
            "Authorization": "Bearer $token",
          }));
    
   notifyListeners();
  }
  void traiter({required ticketId}) async {
       var token = await storage.read(key: 'token');
      print('ticket refusé');
      Dio.Response response = await dio().put('/tickets/$ticketId/traiter',
          options: Dio.Options(headers: {
            "Content-Type": "application/json",
            "Authorization": "Bearer $token",
          }));
    
   notifyListeners();
  }
  void nonTraiter({required ticketId}) async {
       var token = await storage.read(key: 'token');
      print('ticket refusé');
      Dio.Response response = await dio().put('/tickets/$ticketId/nonTraiter',
          options: Dio.Options(headers: {
            "Content-Type": "application/json",
            "Authorization": "Bearer $token",
          }));
    
   notifyListeners();
  }

  
}
