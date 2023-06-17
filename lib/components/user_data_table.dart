import 'package:flutter/material.dart';

class UserDataTable extends StatelessWidget {
  const UserDataTable({super.key});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double columnWidth = screenWidth / 12;
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: DataTable(
        columnSpacing:columnWidth * 0.5,
        columns: const <DataColumn>[
          DataColumn(
            label: Expanded(
              child: Text(
                'Nom & Prénom',
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
                'Matricule',
                style: TextStyle(fontStyle: FontStyle.italic),
              ),
            ),
          ),
        ],
        rows: <DataRow>[
          DataRow(
            cells: <DataCell>[
              DataCell(SizedBox(
                width: columnWidth * 3,
                child: const Text("Foulen foulani"),
              )),
              DataCell(SizedBox(
                width: columnWidth * 3,
                child: const Text("90505050"),
              )),
              DataCell(SizedBox(
                width: columnWidth * 3,
                child: const Text("123546"),
              )),
            ],
          ),
        ],
      ),
    );
  }
}
