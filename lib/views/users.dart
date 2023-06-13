import 'package:flutter/material.dart';
import 'package:flutter_app/components/data_table.dart';

class Users extends StatelessWidget {
  const Users({Key? key}) : super(key: key);
  static const String _title = 'Utilisateurs';

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          appBar: AppBar(title: const Text(_title)),
      body: UserDataTable(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, '/ajout-utilisateur');
        },
        child: const Icon(Icons.add),
      ),
    ));
  }
}
