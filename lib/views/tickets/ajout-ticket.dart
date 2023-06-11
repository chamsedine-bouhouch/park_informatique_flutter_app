import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

const List<String> urgenceList = <String>['Haute', 'Moyenne', 'Base'];
const List<String> employeList = <String>[
  'Ahmed Ferjani',
  'Oussema Mastouri',
  'Seif Talbi',
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
  TextEditingController nameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController matriculeController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  String typeDropdownValue = urgenceList.first;
  String employeDropdownValue = employeList.first;
  String attributedToDropdownValue = employeList.first;
  @override
  Widget build(BuildContext context) {
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
                      onChanged: (String? value) {
                        // This is called when the user selects an item.
                        setState(() {
                          employeDropdownValue = value!;
                        });
                      },
                    )),

                Container(
                    padding: const EdgeInsets.all(10),
                    child: DropdownButtonFormField(
                      decoration: const InputDecoration(
                        labelText: 'Attribué à',
                      ),
                      items: employeList
                          .map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                      onChanged: (String? value) {
                        // This is called when the user selects an item.
                        setState(() {
                          employeDropdownValue = value!;
                        });
                      },
                    )),

                         Container(
                    padding: const EdgeInsets.all(10),
                    child: DropdownButton<String>(
                       value: typeDropdownValue,
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
                          typeDropdownValue = value!;
                        });
                      },
                    )),

                Container(
                  padding: const EdgeInsets.all(10),
                  child: TextField(
                    controller: nameController,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Titre',
                    ),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.all(10),
                  child: TextField(
                    controller: nameController,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Lieu',
                    ),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.all(10),
                  child: TextField(
                    controller: nameController,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Nom de votre Service',
                    ),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.all(10),
                  child: TextField(
                    controller: phoneController,
                    maxLines: 4,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Description',
                    ),
                    keyboardType: TextInputType.number,
                    inputFormatters: <TextInputFormatter>[
                      FilteringTextInputFormatter.digitsOnly
                    ],
                  ),
                ),
                
                // Container(
                //     padding: const EdgeInsets.all(10),
                //     child: DropdownButton<String>(
                //       value: attributedToDropdownValue,
                //       icon: const Icon(Icons.arrow_downward),
                //       elevation: 16,
                //       style: const TextStyle(color: Colors.deepPurple),
                //       underline: Container(
                //         height: 2,
                //         color: Colors.deepPurpleAccent,
                //       ),

                //       items: employeList
                //           .map<DropdownMenuItem<String>>((String value) {
                //         return DropdownMenuItem<String>(
                //           value: value,
                //           child: Text(value),
                //         );
                //       }).toList(),
                //       //
                //       onChanged: (String? value) {
                //         // This is called when the user selects an item.
                //         setState(() {
                //           attributedToDropdownValue = value!;
                //         });
                //       },
                //     )),
                Container(
                    height: 50,
                    padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                    child: ElevatedButton(
                      child: const Text('Ajouter'),
                      onPressed: () {
                        Navigator.pushReplacementNamed(context, 'home');
                      },
                    )),
              ],
            )));
  }
}
