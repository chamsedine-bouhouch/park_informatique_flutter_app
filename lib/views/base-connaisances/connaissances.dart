import 'package:flutter/material.dart';
import 'package:flutter_app/components/experiences_data_tabele.dart';
 
class Connaissances extends StatelessWidget {
  const Connaissances({Key? key}) : super(key: key);
  static const String _title = 'Base de connaissances';

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          appBar: AppBar(title: const Text(_title)),
      body: ExperiencesDataTabele(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, '/ajout-experience');
        },
        child: const Icon(Icons.add),
      ),
    ));
  }
}
