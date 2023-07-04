import 'package:flutter/material.dart';
import 'package:flutter_app/providers/auth.dart';
import 'package:provider/provider.dart';

class Settings extends StatelessWidget {
  const Settings({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(30),
        child: Consumer<Auth>(builder: (context, auth, child) {
          if (auth.authentificated) {
            return ListView(
              children: <Widget>[
                Container(
                    alignment: Alignment.center,
                    padding: const EdgeInsets.all(10),
                    child: Consumer<Auth>(
                      builder: (context, auth, child) {
                        return Text('Bienvenue, Espace: ${auth.user.role}',
                            style: const TextStyle(
                                fontSize: 24, fontWeight: FontWeight.w500));
                      },
                    )),
                Container(
                    height: 50,
                    margin: const EdgeInsets.fromLTRB(0, 10, 0, 10),
                    child: (auth.user.role == "Admin")
                        ? ElevatedButton(
                            child: Text(
                                style: TextStyle(fontSize: 18),
                                'Liste Utilisateurs'),
                            onPressed: () =>
                                Navigator.pushNamed(context, '/users'),
                          )
                        : null),
                Container(
                    height: 50,
                    margin: const EdgeInsets.fromLTRB(0, 10, 0, 10),
                    child: (auth.user.role == "Admin")
                        ? ElevatedButton(
                            child: Text(
                                style: TextStyle(fontSize: 18),
                                'Liste fournisseurs'),
                            onPressed: () =>
                                Navigator.pushNamed(context, '/fournisseurs'),
                          )
                        : null),
                Container(
                    height: 50,
                    margin: const EdgeInsets.fromLTRB(0, 10, 0, 10),
                    child: (auth.user.role != "Employe")
                        ? ElevatedButton(
                            child: Text(
                                style: TextStyle(fontSize: 18),
                                'Base de connaissances'),
                            onPressed: () => Navigator.pushNamed(
                                context, '/base-connaissances'),
                          )
                        : null),
                Container(
                    height: 50,
                    margin: const EdgeInsets.fromLTRB(0, 10, 0, 10),
                    child: (auth.user.role == "Admin" ||
                            auth.user.role == "Technicien de stock")
                        ? ElevatedButton(
                            child: Text(
                                style: TextStyle(fontSize: 18),
                                'Liste fournitures'),
                            onPressed: () =>
                                Navigator.pushNamed(context, '/parcs'),
                          )
                        : null),
                // Container(
                //     height: 50,
                //     margin: const EdgeInsets.fromLTRB(0, 10, 0, 10),
                //     child: ElevatedButton(
                //       child: Text(style: TextStyle(fontSize: 18), 'tickets'),
                //       onPressed: () => Navigator.pushNamed(context, '/tickets'),
                //     )),
              ],
            );
          } else {
            return ListView(
              children: <Widget>[
                Container(
                    alignment: Alignment.center,
                    padding: const EdgeInsets.all(10),
                    child: Consumer<Auth>(
                      builder: (context, auth, child) {
                        return Text('Non connecté',
                            style: const TextStyle(
                                fontSize: 24, fontWeight: FontWeight.w500));
                      },
                    )),
                Container(
                    height: 50,
                    margin: const EdgeInsets.fromLTRB(0, 10, 0, 10),
                    child: ElevatedButton(
                      child: Text(style: TextStyle(fontSize: 18), 'Login'),
                      onPressed: () => Navigator.pushNamed(context, '/login'),
                    )),
              ],
            );
          }
        }));
  }
}
