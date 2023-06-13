import 'package:flutter/material.dart';
import 'package:flutter_app/services/auth.dart';
import 'package:flutter_app/views/fournisseurs.dart';
import 'package:flutter_app/views/fournisseurs/ajout_fournisseur.dart';
import 'package:flutter_app/views/home.dart';
import 'package:flutter_app/views/login.dart';
import 'package:flutter_app/views/settings.dart';
import 'package:flutter_app/views/tickets.dart';
import 'package:flutter_app/views/tickets/ajout-ticket.dart';
import 'package:flutter_app/views/users.dart';
import 'package:flutter_app/views/utilisateurs/ajout_utilisateur.dart';
import 'package:provider/provider.dart';
//  import 'route/route.dart' as route;

/*
void main() => runApp(MaterialApp(
    title: "Park Informatique",
    theme: ThemeData(
      primaryColor: Colors.indigo
    ),
    home: const Home(),
    routes: {
      'home':(context)=>const Home(),
      'login':(context) =>const Login()

    }));
*/
void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => Auth()),
       ],
      child: const MyApp(),
    ),
  );
}
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Park Informatique',
      theme: ThemeData(
          colorSchemeSeed: const Color(0xff6750a4), useMaterial3: true),
      routes: {
        '/': (context) => Home(),
        '/login': (context) => Login(),
        '/users': (context) => Users(),
        '/tickets': (context) => Tickets(),
        '/fournisseurs': (context) => Fournisseurs(),
        '/setting': (context) => Settings(),
        '/ajout-utilisateur': (context) => AjoutUtilisateur(),
        '/ajout-fournisseur': (context) => AjoutFournisseur(),
        '/ajout-ticket': (context) => AjoutTicket(),
      },
      // onGenerateRoute: route.controller,
      // initialRoute: route.loginPage,
    );
  }
}