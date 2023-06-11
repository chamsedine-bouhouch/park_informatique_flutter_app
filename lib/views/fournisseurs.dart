import 'package:flutter/material.dart';
import 'package:flutter_app/components/data_table.dart';

class Fournisseurs extends StatelessWidget {
  const Fournisseurs({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(title: const Text('Fournisseurs')),
      body: DataTable(
        columnSpacing: (MediaQuery.of(context).size.width / 20) * 0.5,
        dataRowHeight: 80,
        columns: const <DataColumn>[
          DataColumn(
            label: Expanded(
              child: Text(
                'Name',
                style: TextStyle(fontStyle: FontStyle.italic),
              ),
            ),
          ),
          DataColumn(
            label: Expanded(
              child: Text(
                'Email',
                style: TextStyle(fontStyle: FontStyle.italic),
              ),
            ),
          ),
          DataColumn(
            label: Expanded(
              child: Text(
                'Type',
                style: TextStyle(fontStyle: FontStyle.italic),
              ),
            ),
          ),
          DataColumn(
            label: Expanded(
              child: Text(
                'Téléphone',
                style: TextStyle(fontStyle: FontStyle.italic),
              ),
            ),
          ),
          DataColumn(
            label: Expanded(
              child: Text(
                'Service',
                style: TextStyle(fontStyle: FontStyle.italic),
              ),
            ),
          ),
        ],
        rows: <DataRow>[
          DataRow(
            cells: <DataCell>[
              DataCell(SizedBox(
                width: (MediaQuery.of(context).size.width / 20) * 3,
                child: Text("data"),
              )),
              DataCell(SizedBox(
                width: (MediaQuery.of(context).size.width / 20) * 4,
                child: Text("m.f@mail.com"),
              )),
              DataCell(SizedBox(
                width: (MediaQuery.of(context).size.width / 20) * 3,
                child: Text("90505050"),
              )),
              DataCell(SizedBox(
                width: (MediaQuery.of(context).size.width / 20) * 3,
                child: Text("Materiel"),
              )),
              DataCell(SizedBox(
                width: (MediaQuery.of(context).size.width / 10) * 3,
                child: Text("Fournisseur perépheriques"),
              )),
            ],
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, 'ajout-fournisseur');
        },
        child: const Icon(Icons.add),
      ),
    ));
  }
}
