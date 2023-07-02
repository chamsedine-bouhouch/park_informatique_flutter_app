 import 'package:flutter/material.dart';
  import 'package:flutter_app/providers/fournisseur.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:provider/provider.dart';

class FournisseursDataTable extends StatefulWidget {
  const FournisseursDataTable({Key? key}) : super(key: key);

  @override
  State<FournisseursDataTable> createState() => _FournisseursDataTableState();
}

class _FournisseursDataTableState extends State<FournisseursDataTable> {
  final storage = FlutterSecureStorage();

  @override
  void initState() {
    getFournisseurs();
    super.initState();
  }

  void getFournisseurs() {
    Provider.of<FournisseursProvider>(context, listen: false)
        .getAllFournisseurs();
  }

  @override
  Widget build(BuildContext context) {
    var fournisseurs = context.watch<FournisseursProvider>().fournisseurs;
 
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
          rows: fournisseurs
              .map(
                (element) => DataRow(
                  cells: <DataCell>[
                    DataCell(SizedBox(
                      width: columnWidth,
                      child: Text(element.nom.toString()),
                    )),
                    DataCell(SizedBox(
                      width: columnWidth * 2,
                      child: Text(element.email.toString()),
                    )),
                    DataCell(SizedBox(
                      width: columnWidth,
                      child: Text(element.telephone.toString()),
                    )),
                    DataCell(SizedBox(
                      width: columnWidth,
                      child: Text(element.type.toString()),
                    )),
                    DataCell(SizedBox(
                      width: columnWidth * 2,
                      child: Text(element.service.toString()),
                    )),
                  ],
                ),
              )
              .toList()
          // <DataRow>[
          //   DataRow(
          //     cells: <DataCell>[
          //       DataCell(SizedBox(
          //         width: columnWidth,
          //         child: const Text("data"),
          //       )),
          //       DataCell(SizedBox(
          //         width: columnWidth * 2,
          //         child: const Text("m.f@mail.com"),
          //       )),
          //       DataCell(SizedBox(
          //         width: columnWidth,
          //         child: const Text("90505050"),
          //       )),
          //       DataCell(SizedBox(
          //         width: columnWidth,
          //         child: const Text("Materiel"),
          //       )),
          //       DataCell(SizedBox(
          //         width: columnWidth * 2,
          //         child: const Text("Fournisseur perépheriques"),
          //       )),
          //     ],
          //   ),
          // ],
          ),
    );
  }
}
