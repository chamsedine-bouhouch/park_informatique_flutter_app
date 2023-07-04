 import 'package:flutter/material.dart';
 import 'package:flutter_app/providers/tickets.dart';
import 'package:flutter_app/views/tickets/ticket_details.dart';
 import 'package:provider/provider.dart';

class Tickets extends StatefulWidget {
  const Tickets({Key? key}) : super(key: key);

  @override
  State<Tickets> createState() => _TicketsState();
}

class _TicketsState extends State<Tickets> {
 
  @override
  void initState() {  
    getTickets();
     super.initState();
  }
  
  void getTickets(){
    Provider.of<TicketsProvider>(context,listen: false).getAllTickets();

  }

  @override
  Widget build(BuildContext context) {

    var tickets= context.watch<TicketsProvider>().tickets;
    return Scaffold(
      body: ListView.builder(
        itemCount: tickets.length,
        itemBuilder: (context, index) {
          return ListTile(
            leading: const Icon(Icons.ac_unit),
            title: Text(tickets[index].titre),
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
