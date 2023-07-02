import 'package:flutter/material.dart';
import 'package:flutter_app/providers/parcs.dart';
import 'package:provider/provider.dart';

class ParcDataTable extends StatefulWidget {
  const ParcDataTable({super.key});

  @override
  State<ParcDataTable> createState() => _ParcDataTableState();
}

class _ParcDataTableState extends State<ParcDataTable> {
  @override
  void initState() {
    getAllParcs();
    super.initState();
  }

  void getAllParcs() {
    Provider.of<ParcsProvider>(context, listen: false).getAllParcs();
  }

  @override
  Widget build(BuildContext context) {
    var parcs = context.watch<ParcsProvider>().parcs;

    double screenWidth = MediaQuery.of(context).size.width;
    double columnWidth = screenWidth / 12; 
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
        rows: parcs
            .map((parc) => DataRow(
                  cells: <DataCell>[
                    DataCell(SizedBox(
                      width: columnWidth,
                      child: Text(parc.nom.toString()),
                    )),
                    DataCell(SizedBox(
                      width: columnWidth,
                      child: Text(parc.type.toString()),
                    )),
                    DataCell(SizedBox(
                      width: columnWidth,
                      child: Text(parc.serie.toString()),
                    )),
                    DataCell(SizedBox(
                      width: columnWidth,
                      child: Text(parc.fabricant.toString()),
                    )),
                    DataCell(SizedBox(
                      width: columnWidth,
                      child: Text(parc.modele.toString()),
                    )),
                    DataCell(SizedBox(
                      width: columnWidth,
                      child: Text(parc.version.toString()),
                    )),
                  ],
                ))
            .toList(),
      ),
    );
  }
}
