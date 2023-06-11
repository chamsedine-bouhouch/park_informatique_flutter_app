import 'package:flutter/material.dart';
import 'package:flutter_app/components/data_table.dart';

class Users extends StatelessWidget {
  const Users({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          appBar: AppBar(title: const Text('Utilisateurs')),
      body: Container(
        // alignment: Alignment.topLeft,
        child: UserDataTable(),
        /* child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
           Text('Users page')
          ],
        ),*/
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, 'ajout-utilisateur');
        },
        child: const Icon(Icons.add),
      ),
    ));
  }
}
