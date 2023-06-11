import 'package:flutter/material.dart';
import 'package:flutter_app/components/list_items.dart';
import 'package:flutter_app/utils/styles.dart';
import 'package:flutter_app/views/settings.dart';
import 'package:flutter_app/views/tickets.dart';
import 'package:flutter_app/views/users.dart';

/// Flutter code sample for [BottomNavigationBar].

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _selectedIndex = 0;
  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  static const List<Widget> _widgetOptions = <Widget>[
    Settings(),
    Tickets(),
    Users(),
    Users(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = _selectedIndex;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            appBar: AppBar(
              title: const Text('Accueil'),
              // backgroundColor: primary,
            ),
            drawer: Drawer(
              child: ListView(
                padding: EdgeInsets.zero,
                children: [
                  const UserAccountsDrawerHeader(
                    accountName: Text("Username"),
                    accountEmail: Text("user@email.com"),
                    currentAccountPicture: CircleAvatar(
                        backgroundColor: Colors.amber,
                        child: Text(
                          'CH',
                          style: TextStyle(fontSize: 40),
                        )),
                  ),
                  ListTile(
                    leading: const Icon(Icons.account_circle),
                    title: const Text('Profile'),
                    onTap: () {
                      Navigator.pop(context);
                    },
                  ),
      
                  ListTile(
                    leading: const Icon(Icons.login),
                    title: const Text('Login'),
                    onTap: () {
                      Navigator.pushNamed(context, 'login');
                    },
                  ),
                  ListTile(
                    leading: const Icon(Icons.add),
                    title: const Text('Ajout Utilisateur'),
                    onTap: () {
                      Navigator.pushNamed(context, 'ajout-utilisateur');
                    },
                  ),
                ],
              ),
            ),
            body: Center(
              child: _widgetOptions.elementAt(_selectedIndex),
            ),
            bottomNavigationBar: NavigationBarTheme(
              data: NavigationBarThemeData(
                // indicatorColor: Colors.blue.shade300,
                labelTextStyle: MaterialStateProperty.all(
                  TextStyle(
                  fontSize: 14,
                  // fontWeight: FontWeight.w500
                )),
              ),
              child: NavigationBar(
                height: 60,
                // backgroundColor: primary,
                selectedIndex: _selectedIndex,
                onDestinationSelected: (index) =>
                    setState(() => this._selectedIndex = index),
                destinations: [
                  NavigationDestination(
                      icon: Icon(Icons.home), label: "Accueil"),
                  // NavigationDestination(
                  //     icon: Icon(Icons.settings), label: "Settings"),
                  NavigationDestination(
                      icon: Icon(Icons.support), label: "Tickets"),
                  NavigationDestination(
                      icon: Icon(Icons.people_rounded), label: "Users"),
                ],
              ),
            )));
  }
}
