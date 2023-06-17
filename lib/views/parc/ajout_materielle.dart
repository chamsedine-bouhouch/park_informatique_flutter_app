import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AjoutMaterielle extends StatefulWidget {
  const AjoutMaterielle({ Key? key }) : super(key: key);
 
  @override
  _AjoutMaterielleState createState() => _AjoutMaterielleState();
}

class _AjoutMaterielleState extends State<AjoutMaterielle> {
    TextEditingController nameController = TextEditingController();
  TextEditingController typeController = TextEditingController();
  TextEditingController serieController = TextEditingController();
  TextEditingController fabricantController = TextEditingController();
  TextEditingController modeleController = TextEditingController();
  TextEditingController versionController= TextEditingController();

  @override
  Widget build(BuildContext context) {
       const String _title = 'Ajout Materielle';

    var screen_width = MediaQuery.of(context).size.width;
    var width2 = screen_width/3;
    final isDesktop =screen_width>760;
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(title: const Text(_title)),
          body: Center(
          child: SizedBox(
            
            width: isDesktop?width2:null,
            child: Padding(
                padding: const EdgeInsets.all(10),
                child: ListView(
                  children: <Widget>[
                    Container(
                      padding: const EdgeInsets.all(10),
                      child: TextField(
                        controller: nameController,
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Nom',
                        ),
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.all(10),
                      child: TextField(
                        controller: typeController,
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Type',
                        ),
                        // keyboardType: TextInputType.number,
                        // inputFormatters: <TextInputFormatter>[
                        //   FilteringTextInputFormatter.digitsOnly
                        // ],
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.all(10),
                      child: TextField(
                        controller: serieController,
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Série',
                        ),
                        keyboardType: TextInputType.number,
                        inputFormatters: <TextInputFormatter>[
                          FilteringTextInputFormatter.digitsOnly
                        ], // Only numbers can be entered
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.all(10),
                      child: TextField(
                        controller: fabricantController,
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Fabricant',
                        ),
                        // keyboardType: TextInputType.number,
                        // inputFormatters: <TextInputFormatter>[
                        //   FilteringTextInputFormatter.digitsOnly
                        // ], // Only numbers can be entered
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.all(10),
                      child: TextField(
                        controller: modeleController,
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Modèle',
                        ),
                        keyboardType: TextInputType.number,
                        // inputFormatters: <TextInputFormatter>[
                        //   FilteringTextInputFormatter.digitsOnly
                        // ], // Only numbers can be entered
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.all(10),
                      child: TextField(
                        controller: versionController,
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Version',
                        ),
                        keyboardType: TextInputType.number,
                        inputFormatters: <TextInputFormatter>[
                          FilteringTextInputFormatter.digitsOnly
                        ], // Only numbers can be entered
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
        )
        );
  }
}