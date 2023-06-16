import 'package:flutter/material.dart';
import 'package:flutter_app/components/ticket.dart';

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
        title: Text(ticket.title),
      ),
      body: Padding(
        padding: const EdgeInsets.all(30),
        child: ListView(children: <Widget>[
          Container(
            padding: const EdgeInsets.all(20),
            child: Text(ticket.description),
          ),
          Container(
              margin: const EdgeInsets.fromLTRB(0, 10, 0, 10),
              height: 50,
              padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
              child: ElevatedButton(
                style: TextButton.styleFrom(
                    primary: Colors.white, backgroundColor: Colors.green),
                child: const Text('Accepter'),
                onPressed: () {
                  Navigator.pushReplacementNamed(context, '/');
                },
              )),
          Container(
              margin: const EdgeInsets.fromLTRB(0, 10, 0, 10),
              height: 50,
              padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
              child: ElevatedButton(
                style: TextButton.styleFrom(
                    primary: Colors.black, backgroundColor: Colors.red),
                child: const Text('Refuser'),
                onPressed: () {
                  Navigator.pushReplacementNamed(context, '/');
                },
              )),
        ]),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, '/ajout-ticket');
        },
        child: const Icon(Icons.edit),
      ),
    );
  }
}
