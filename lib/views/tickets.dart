import 'package:flutter/material.dart';

class Tickets extends StatefulWidget {
  const Tickets({super.key});

  @override
  State<Tickets> createState() => _TicketsState();
}

class _TicketsState extends State<Tickets> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          ListTile(
            leading: Icon(Icons.ac_unit),
            title: Text('Réparation imprimante'),
            subtitle: Text('Service info'),
            trailing: Icon(Icons.arrow_forward),
            onTap: () {
              // Handle the onTap event for this list item
              Navigator.pushNamed(context, '/ajout-ticket');
            },
          ),
          ListTile(
            leading: Icon(Icons.ac_unit),
            title: Text('Formatage PC'),
            subtitle: Text('software'),
            trailing: Icon(Icons.arrow_forward),
            onTap: () {
              // Handle the onTap event for this list item
              Navigator.pushNamed(context, '/ticket-details');
            },
          ),
        ],
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
