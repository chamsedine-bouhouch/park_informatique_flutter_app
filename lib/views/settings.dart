import 'package:flutter/material.dart';
import 'package:flutter_app/services/auth.dart';
import 'package:provider/provider.dart';

class Settings extends StatelessWidget {
  const Settings({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(30),
        child: ListView(
          children: <Widget>[
            Container(
                alignment: Alignment.center,
                padding: const EdgeInsets.all(10),
                child: Consumer<Auth>(
                  builder: (context, auth, child) {
                    return Text(
                        'Bienvenue Dans votre espace: ${auth.authentificated}',
                        style: const TextStyle(
                            fontSize: 24, fontWeight: FontWeight.w500));
                  },
                )),
            // const Text(
            //   'Bienvenue Dans votre espace',
            //   style: TextStyle(fontSize: 24 ,fontWeight: FontWeight.w500),
            // )),

            // TextButton(
            //   onPressed: () {
            //     //forgot password screen
            //   },
            //   child: const Text('Forgot Password',),
            // ),
            Container(
                height: 50,
                margin: const EdgeInsets.fromLTRB(0, 10, 0, 10),
                child: ElevatedButton(
                  child: Text(
                      style: TextStyle(fontSize: 18), 'Liste Utilisateurs'),
                  onPressed: () => Navigator.pushNamed(context, '/users'),
                )),
            Container(
                height: 50,
                margin: const EdgeInsets.fromLTRB(0, 10, 0, 10),
                child: ElevatedButton(
                  child: Text(
                      style: TextStyle(fontSize: 18), 'Liste fournisseurs'),
                  onPressed: () =>
                      Navigator.pushNamed(context, '/fournisseurs'),
                )),
          ],
        ));
  }
}
