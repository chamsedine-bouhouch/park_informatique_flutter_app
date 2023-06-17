import 'package:flutter/material.dart';
import 'package:flutter_app/components/parc_data_table.dart';
 
class Parcs extends StatelessWidget {
  const Parcs({Key? key}) : super(key: key);
  static const String _title = 'Liste fournitures';

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          appBar: AppBar(title: const Text(_title)),
      body: ParcDataTable(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, '/ajout-materielle');
        },
        child: const Icon(Icons.add),
      ),
    ));
  }
}
