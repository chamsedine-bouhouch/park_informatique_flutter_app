import 'package:flutter/material.dart';

class ParcDataTable extends StatelessWidget {
  const ParcDataTable({super.key});

  @override
  Widget build(BuildContext context) {
      double screenWidth = MediaQuery.of(context).size.width;
    double columnWidth = screenWidth / 10; // Adjust the number (5) as needed
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: DataTable(
        columnSpacing: columnWidth * 0.5,
      
        columns: const <DataColumn>[
          DataColumn(
            
            label: Expanded(
              child: Text(
                'Nom',
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
                'Série',
                style: TextStyle(fontStyle: FontStyle.italic),
              ),
            ),
          ),
          DataColumn(
            label: Expanded(
              child: Text(
                'Fabricant',
                style: TextStyle(fontStyle: FontStyle.italic),
              ),
            ),
          ),
          DataColumn(
            label: Expanded(
              child: Text(
                'Modèle',
                style: TextStyle(fontStyle: FontStyle.italic),
              ),
            ),
          ),
          DataColumn(
            label: Expanded(
              child: Text(
                'Version',
                style: TextStyle(fontStyle: FontStyle.italic),
              ),
            ),
          ),
        ],
        rows: <DataRow>[
          DataRow(
            cells: <DataCell>[
               DataCell(SizedBox(
                  width: columnWidth,
                  child: const Text("Foulen foulani"),
                )),
               DataCell(SizedBox(
                  width: columnWidth,
                  child: const Text("90505050"),
                )),
               DataCell(SizedBox(
                  width: columnWidth,
                  child: const Text("123546"),
                )),
               DataCell(SizedBox(
                  width: columnWidth,
                  child: const Text("123546"),
                )),
               DataCell(SizedBox(
                  width: columnWidth,
                  child: const Text("123546"),
                )),
               DataCell(SizedBox(
                  width: columnWidth,
                  child: const Text("123546"),
                )),
            ],
          ),
 
        ],
      ),
    );
  }
}
