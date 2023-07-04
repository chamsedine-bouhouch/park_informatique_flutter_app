import 'package:flutter/material.dart';
import 'package:flutter_app/models/user.dart';
import 'package:flutter_app/providers/tickets.dart';
import 'package:flutter_app/providers/users.dart';
import 'package:provider/provider.dart';

const List<String> urgenceList = <String>['Haute', 'Moyenne', 'Base'];
const List<String> employeList = <String>[
  'Hamma Gaz',
  'Hedi Dhaw',
  'Salim Sabek',
];
const List<String> technicienList = <String>[
  'Hamma Gaz',
  'Hedi Dhaw',
  'Salim Sabek',
];

class AjoutTicket extends StatelessWidget {
  const AjoutTicket({Key? key}) : super(key: key);

  static const String _title = 'Ajout Ticket';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text(_title)),
      body: const MyStatefulWidget(),
    );
  }
}

class MyStatefulWidget extends StatefulWidget {
  const MyStatefulWidget({Key? key}) : super(key: key);

  @override
  State<MyStatefulWidget> createState() => _MyStatefulWidgetState();
}

class _MyStatefulWidgetState extends State<MyStatefulWidget> {
  TextEditingController titreController = TextEditingController();
  TextEditingController lieuController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  TextEditingController serviceController = TextEditingController();
  String urgenceDropdownValue = urgenceList.first;
  String technicienDropdownValue = technicienList.first;
  String? employeDropdownValue = employeList.first;
  String attributedToDropdownValue = employeList.first;
  @override
  Widget build(BuildContext context) {
    List<User> employees = context.watch<UsersProvider>().employees;
    print(employees);

    return SafeArea(
        child: Padding(
            padding: const EdgeInsets.all(10),
            child: ListView(
              children: <Widget>[
                Container(
                    padding: const EdgeInsets.all(10),
                    child: DropdownButtonFormField(
                      decoration: const InputDecoration(
                        labelText: 'Employé',
                      ),
                      items: employeList
                          .map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                      onChanged: (value) {
                        // This is called when the user selects an item.
                        setState(() {
                          employeDropdownValue = value?.toString();
                        });
                      },
                    )),
                Container(
                    padding: const EdgeInsets.all(10),
                    child: DropdownButtonFormField(
                      decoration: const InputDecoration(
                        labelText: 'Attribué à',
                      ),
                      items: technicienList
                          .map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                      onChanged: (String? value) {
                        // This is called when the user selects an item.
                        setState(() {
                          technicienDropdownValue = value!;
                        });
                      },
                    )),
                Container(
                    padding: const EdgeInsets.all(10),
                    child: DropdownButton<String>(
                      value: urgenceDropdownValue,
                      icon: const Icon(Icons.arrow_downward),
                      elevation: 16,
                      style: const TextStyle(color: Colors.deepPurple),
                      underline: Container(
                        height: 2,
                        color: Colors.deepPurpleAccent,
                      ),

                      items: urgenceList
                          .map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                      //
                      onChanged: (String? value) {
                        // This is called when the user selects an item.
                        setState(() {
                          urgenceDropdownValue = value!;
                        });
                      },
                    )),
                Container(
                  padding: const EdgeInsets.all(10),
                  child: TextField(
                    controller: titreController,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Titre',
                    ),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.all(10),
                  child: TextField(
                    controller: lieuController,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Lieu',
                    ),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.all(10),
                  child: TextField(
                    controller: serviceController,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Nom de votre Service',
                    ),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.all(10),
                  child: TextField(
                    controller: descriptionController,
                    maxLines: 4,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Description',
                    ),
                  ),
                ),
                Container(
                    height: 50,
                    padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                    child: ElevatedButton(
                      child: const Text('Ajouter'),
                      onPressed: () {
                        Map addTicketForm = {
                          'employe_id': 1,
                          'technicien': technicienDropdownValue,
                          'titre': titreController.text,
                          'lieu': lieuController.text,
                          'description': descriptionController.text,
                          'urgence': urgenceDropdownValue,
                          'service': serviceController.text,
                        };
                        print(addTicketForm);
                        Provider.of<TicketsProvider>(context, listen: false)
                            .addTicket(addTicketForm: addTicketForm)
                            .then((res) => {
                                  Navigator.pushReplacementNamed(
                                      context, '/tickets')
                                });
                      },
                    )),
              ],
            )));
  }
}
