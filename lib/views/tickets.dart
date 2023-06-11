import 'package:flutter/material.dart';

  class Tickets extends StatefulWidget {
    const Tickets({super.key});

    @override
    State<Tickets> createState() => _TicketsState();

  }
  class _TicketsState extends State<Tickets> {
  int itemCount=10;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
       body: itemCount > 0
          ? ListView.builder(
        itemCount: itemCount,
        itemBuilder: (BuildContext context, int index) {
          return ListTile(
            title: Text('Item ${index + 1}'),
          );
        },
      )
          : const Center(child: Text('No items')),
    );
    throw UnimplementedError();
  }
  }