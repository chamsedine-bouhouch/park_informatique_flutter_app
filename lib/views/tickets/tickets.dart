import 'package:flutter/material.dart';
import 'package:flutter_app/components/ticket.dart';
import 'package:flutter_app/views/tickets/ticket_details.dart';

class Tickets extends StatefulWidget {
  const Tickets({Key? key}) : super(key: key);

  @override
  State<Tickets> createState() => _TicketsState();
}

class _TicketsState extends State<Tickets> {
  final tickets = List.generate(
    5,
    (i) => Ticket(
      'Ticket $i',
      'A description of what needs to be done for Todo $i',
    ),
  );
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // body: ListView(
      //   children: [
      //     ListTile(
      //       leading: Icon(Icons.ac_unit),
      //       title: Text('Réparation imprimante'),
      //       subtitle: Text('Service info'),
      //       trailing: Icon(Icons.arrow_forward),
      //       onTap: () {
      //         // Handle the onTap event for this list item
      //         Navigator.pushNamed(context, '/ajout-ticket');
      //       },
      //     ),
      //     ListTile(
      //       leading: Icon(Icons.ac_unit),
      //       title: Text('Formatage PC'),
      //       subtitle: Text('software'),
      //       trailing: Icon(Icons.arrow_forward),
      //       onTap: () {
      //   Navigator.push(
      //     context,
      //     MaterialPageRoute(
      //       builder: (context) => TicketDetails(todo: todos[index]),
      //     ),
      //   );
      // },
      //     ),
      //   ],
      // ),
      body: ListView.builder(
        itemCount: tickets.length,
        itemBuilder: (context, index) {
          return ListTile(
            leading: const Icon(Icons.ac_unit),
            title: Text(tickets[index].title),
            subtitle: Text(tickets[index].description),
            trailing: const Icon(Icons.arrow_forward),
            // When a user taps the ListTile, navigate to the DetailScreen.
            // Notice that you're not only creating a DetailScreen, you're
            // also passing the current todo through to it.
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => TicketDetails(ticket: tickets[index]),
                ),
              );
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, '/ajout-ticket');
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
