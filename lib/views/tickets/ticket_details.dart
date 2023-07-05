import 'package:flutter/material.dart';
import 'package:flutter_app/models/ticket.dart';
import 'package:flutter_app/providers/auth.dart';
import 'package:flutter_app/providers/tickets.dart';
import 'package:provider/provider.dart';

class TicketDetails extends StatelessWidget {
  // In the constructor, require a Todo.
  const TicketDetails({super.key, required this.ticket});

  // Declare a field that holds the Todo.
  final Ticket ticket;

  @override
  Widget build(BuildContext context) {
    // Use the Todo to create the UI.
    return Scaffold(
      appBar: AppBar(
        title: Text(ticket.titre),
      ),
      body: Padding(
          padding: const EdgeInsets.all(30),
          child: Consumer2<Auth, TicketsProvider>(
              builder: (context, auth, ticket_provider, child) {
            return ListView(children: <Widget>[
              Container(
                padding: const EdgeInsets.all(20),
                child: Text(ticket.description),
              ),
              Container(
                padding: const EdgeInsets.all(20),
                child: Chip(
                  padding: EdgeInsets.all(0),
                  backgroundColor: Color(0xff6750a4),
                  label: Text(ticket.statut,
                      style: TextStyle(color: Colors.white)),
                ),
              ),
              Container(
                  margin: const EdgeInsets.fromLTRB(0, 10, 0, 10),
                  height: 50,
                  padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                  child: (auth.user.role == "Technicien de développement" ||
                          auth.user.role == "Technicien de réseaux" ||
                          auth.user.role == "Technicien de maintenance")
                      ? ElevatedButton(
                          style: TextButton.styleFrom(
                              primary: Colors.white,
                              backgroundColor: Color.fromRGBO(76, 175, 80, 1)),
                          child: const Text('Accepter & traiter'),
                          onPressed: () {
                             Provider.of<TicketsProvider>(context, listen: false)
                                .traiter(ticketId: ticket.id);
                            Navigator.pushReplacementNamed(context, '/home');
                          },
                        )
                      : null),
              Container(
                  margin: const EdgeInsets.fromLTRB(0, 10, 0, 10),
                  height: 50,
                  padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                  child: (auth.user.role == "Technicien de développement" ||
                          auth.user.role == "Technicien de réseaux" ||
                          auth.user.role == "Technicien de maintenance")
                      ? ElevatedButton(
                          style: TextButton.styleFrom(
                              primary: Colors.black,
                              backgroundColor: Colors.red),
                          child: const Text('Refuser & ne pas traiter'),
                          onPressed: () {
                            Provider.of<TicketsProvider>(context, listen: false)
                                .nonTraiter(ticketId: ticket.id);
                            Navigator.pushReplacementNamed(context, '/home');
                          },
                        )
                      : null),
              Container(
                  margin: const EdgeInsets.fromLTRB(0, 10, 0, 10),
                  height: 50,
                  padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                  child: (auth.user.role == "Chef herarchique")
                      ? ElevatedButton(
                          style: TextButton.styleFrom(
                              primary: Colors.white,
                              backgroundColor: Colors.green),
                          child: const Text('Approuver'),
                          onPressed: () {
                            Provider.of<TicketsProvider>(context, listen: false)
                                .approuver(ticketId: ticket.id);
                            Navigator.pushReplacementNamed(context, '/home');
                          },
                        )
                      : null),
              Container(
                  margin: const EdgeInsets.fromLTRB(0, 10, 0, 10),
                  height: 50,
                  padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                  child: (auth.user.role == "Chef herarchique")
                      ? ElevatedButton(
                          style: TextButton.styleFrom(
                              primary: Colors.black,
                              backgroundColor: Colors.red),
                          child: const Text('Refuser'),
                          onPressed: () {
                            Provider.of<TicketsProvider>(context, listen: false)
                                .refuser(ticketId: ticket.id);
                            Navigator.pushReplacementNamed(context, '/home');
                          },
                        )
                      : null),
            ]);
          })),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, '/ajout-ticket');
        },
        child: const Icon(Icons.edit),
      ),
    );
  }
}
