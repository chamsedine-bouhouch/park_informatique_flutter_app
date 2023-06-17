import 'package:flutter/material.dart';

class AjoutExperience extends StatefulWidget {
  const AjoutExperience({Key? key}) : super(key: key);

  @override
  _AjoutExperienceState createState() => _AjoutExperienceState();
}

class _AjoutExperienceState extends State<AjoutExperience> {
  TextEditingController nameController = TextEditingController();
  TextEditingController titleController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();

  Widget build(BuildContext context) {
    const String _title = 'Ajout éxperience';

    var screen_width = MediaQuery.of(context).size.width;
    var width2 = screen_width / 3;
    final isDesktop = screen_width > 760;
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(title: const Text(_title)),
      body: Center(
        child: SizedBox(
          width: isDesktop ? width2 : null,
          child: Padding(
              padding: const EdgeInsets.all(10),
              child: ListView(
                children: <Widget>[
                  Container(
                    padding: const EdgeInsets.all(10),
                    child: TextField(
                      controller: titleController,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Title',
                      ),
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.all(10),
                    child: TextField(
                      maxLines: 8,
                      controller: descriptionController,
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
                          Navigator.pushReplacementNamed(context, '/');
                        },
                      )),
                ],
              )),
        ),
      ),
    ));
  }
}
