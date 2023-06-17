import 'package:flutter/material.dart';

class ExperiencesDataTabele extends StatelessWidget {
  const ExperiencesDataTabele({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double columnWidth = screenWidth /3;
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: DataTable(
        columnSpacing: columnWidth * 0.5,
        columns: const <DataColumn>[
          DataColumn(
            label: Expanded(
              child: Text(
                'Titre',
                style: TextStyle(fontStyle: FontStyle.italic),
              ),
            ),
          ),
          DataColumn(
            label: Expanded(
              child: Text(
                'Description',
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
                child: const Text("Formatage PC"),
              )),
              DataCell(SizedBox(
                width: columnWidth ,
                child: const Text("Utiliser un flash bootable"),
              )),
            ],
          ),
        ],
      ),
    );
  }
}
