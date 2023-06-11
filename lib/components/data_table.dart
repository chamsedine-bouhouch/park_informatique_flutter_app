import 'package:flutter/material.dart';

class UserDataTable extends StatelessWidget {
  const UserDataTable({super.key});

  @override
  Widget build(BuildContext context) {
    return DataTable(
      columnSpacing: (MediaQuery.of(context).size.width / 10) * 0.5,
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
                width: (MediaQuery.of(context).size.width / 10) * 3,
                child: Text("Foulen foulani"),
              )),
             DataCell(SizedBox(
                width: (MediaQuery.of(context).size.width / 10) * 3,
                child: Text("90505050"),
              )),
             DataCell(SizedBox(
                width: (MediaQuery.of(context).size.width / 10) * 3,
                child: Text("123546"),
              )),
          ],
        ),
 
      ],
    );
  }
}
