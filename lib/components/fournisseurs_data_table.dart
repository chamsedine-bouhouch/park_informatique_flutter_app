import 'package:flutter/material.dart';

class FournisseursDataTable extends StatelessWidget {
  const FournisseursDataTable({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double columnWidth = screenWidth / 12; // Adjust
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: DataTable(
        columnSpacing: columnWidth * 0.5,
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
                width: columnWidth ,
                child: const Text("data"),
              )),
              DataCell(SizedBox(
                width: columnWidth*2 ,
                child: const Text("m.f@mail.com"),
              )),
              DataCell(SizedBox(
                width: columnWidth ,
                child: const Text("90505050"),
              )),
              DataCell(SizedBox(
                width: columnWidth ,
                child: const Text("Materiel"),
              )),
              DataCell(SizedBox(
                width: columnWidth*2 ,
                child: const Text("Fournisseur perépheriques"),
              )),
            ],
          ),
        ],
      ),
    );
  }
}
