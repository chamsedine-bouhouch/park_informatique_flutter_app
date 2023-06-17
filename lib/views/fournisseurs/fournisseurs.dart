import 'package:flutter/material.dart';
import 'package:flutter_app/components/fournisseurs_data_table.dart';

class Fournisseurs extends StatelessWidget {
  const Fournisseurs({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(title: const Text('Fournisseurs')),
      body: FournisseursDataTable(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, '/ajout-fournisseur');
        },
        child: const Icon(Icons.add),
      ),
    ));
  }
}
