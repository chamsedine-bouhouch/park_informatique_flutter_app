import 'package:flutter/material.dart';

class Settings extends StatelessWidget {

  const Settings({Key? key}) : super(key: key);

  static const String _title = 'Login';

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(30),
        child: ListView(
          children: <Widget>[
            Container(
                alignment: Alignment.center,
                padding: const EdgeInsets.all(10),
                child: const Text(
                  'Bienvenue Dans votre espace',
                  style: TextStyle(fontSize: 24 ,fontWeight: FontWeight.w700),
                )),

            // TextButton(
            //   onPressed: () {
            //     //forgot password screen
            //   },
            //   child: const Text('Forgot Password',),
            // ),
            Container(
                height: 50,
                margin: EdgeInsets.fromLTRB(0, 10, 0, 10),
                 child: ElevatedButton(
                  child:  Text(style: TextStyle(fontSize: 18),'Liste Utilisateurs'),
                  onPressed: () => Navigator.pushReplacementNamed(context, 'home'),
                )),
            Container(
                height: 50,
                margin: EdgeInsets.fromLTRB(0, 10, 0, 10),
                child: ElevatedButton(
                  child:  Text(style: TextStyle(fontSize: 18),'Liste fournisseurs'),
                  onPressed: () => Navigator.pushReplacementNamed(context, 'home'),
                )),
          ],
        ));
  }
}
