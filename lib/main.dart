import 'package:flutter/material.dart';
import 'package:flutter_app/views/home.dart';
 import 'route/route.dart' as route;

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
  runApp(const MyApp());
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
      onGenerateRoute: route.controller,
      initialRoute: route.loginPage,
    );
  }
}