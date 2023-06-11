import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

const List<String> genreList = <String>['Homme', 'Femme'];
const List<String> serviceList = <String>[
  'Employe',
  'Chef herarchique',
  'Technicien de stock',
  'Technicien de développement',
  'Technicien de réseaux',
  'Technicien de maintenance',
];

class AjoutUtilisateur extends StatelessWidget {
  const AjoutUtilisateur({Key? key}) : super(key: key);

  static const String _title = 'Ajout Utilisateur';

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
  String genreDropdownValue = genreList.first;
  String serviceDropdownValue = serviceList.first;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Padding(
            padding: const EdgeInsets.all(10),
            child: ListView(
              children: <Widget>[
                // Container(
                //     alignment: Alignment.center,
                //     padding: const EdgeInsets.all(10),
                //     child: const Text(
                //       'Nouveau compte',
                //       style: TextStyle(fontSize: 20),
                //     )),
                // Container(
                //   padding: const EdgeInsets.all(10),
                //   child: TextField(
                //     controller: nameController,
                //     decoration: const InputDecoration(
                //       border: OutlineInputBorder(),
                //       labelText: 'Nom',
                //     ),
                //   ),
                // ),
                Container(
                  padding: const EdgeInsets.all(10),
                  child: TextField(
                    controller: nameController,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Nom & Prénom ',
                    ),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.all(10),
                  child: TextField(
                    controller: phoneController,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Téléphone',
                    ),
                    keyboardType: TextInputType.number,
                    inputFormatters: <TextInputFormatter>[
                      FilteringTextInputFormatter.digitsOnly
                    ],
                  ),
                ),
                Container(
                  padding: const EdgeInsets.all(10),
                  child: TextField(
                    controller: matriculeController,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Matricule',
                    ),
                    keyboardType: TextInputType.number,
                    inputFormatters: <TextInputFormatter>[
                      FilteringTextInputFormatter.digitsOnly
                    ], // Only numbers can be entered
                  ),
                ),
                Container(
                    padding: const EdgeInsets.all(10),
                    child: DropdownButton<String>(
                      value: genreDropdownValue,
                      icon: const Icon(Icons.arrow_downward),
                      elevation: 16,
                      style: const TextStyle(color: Colors.deepPurple),
                      underline: Container(
                        height: 2,
                        color: Colors.deepPurpleAccent,
                      ),

                      items: genreList
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
                          genreDropdownValue = value!;
                        });
                      },
                    )),
                Container(
                    padding: const EdgeInsets.all(10),
                    child: DropdownButton<String>(
                      value: serviceDropdownValue,
                      icon: const Icon(Icons.arrow_downward),
                      elevation: 16,
                      style: const TextStyle(color: Colors.deepPurple),
                      underline: Container(
                        height: 2,
                        color: Colors.deepPurpleAccent,
                      ),

                      items: serviceList
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
                          serviceDropdownValue = value!;
                        });
                      },
                    )),
                Container(
                  padding: const EdgeInsets.all(10),
                  child: TextField(
                    obscureText: true,
                    controller: passwordController,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Password',
                    ),
                  ),
                ),
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
