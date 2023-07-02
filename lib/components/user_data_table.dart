import 'package:flutter/material.dart';
import 'package:flutter_app/providers/users.dart';
import 'package:provider/provider.dart';

class UserDataTable extends StatefulWidget {
  const UserDataTable({super.key});

  @override
  State<UserDataTable> createState() => _UserDataTableState();
}

class _UserDataTableState extends State<UserDataTable> {
  @override
  void initState() {
    getAllEmployees();
    super.initState();
  }

  void getAllEmployees() {
    Provider.of<UsersProvider>(context, listen: false).getAllEmployees();
  }

  @override
  Widget build(BuildContext context) {
    var employees = context.watch<UsersProvider>().employees;
    print(employees);
    double screenWidth = MediaQuery.of(context).size.width;
    double columnWidth = screenWidth / 5;
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: DataTable(
          columnSpacing: columnWidth * 0.5,
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
                  'Email',
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
          rows: employees
              .map(
                (employee) => DataRow(
                  cells: <DataCell>[
                    DataCell(SizedBox(
                      width: columnWidth,
                      child: Text(employee.name.toString()),
                    )),
                    DataCell(SizedBox(
                      width: columnWidth,
                      child: Text(employee.email.toString()),
                    )),
                    DataCell(SizedBox(
                      width: columnWidth,
                      child: const Text("123546"),
                    )),
                  ],
                ),
              )
              .toList()),
    );
  }
}
