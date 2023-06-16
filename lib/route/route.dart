import 'package:flutter/material.dart';
import 'package:flutter_app/views/fournisseurs/fournisseurs.dart';
import 'package:flutter_app/views/fournisseurs/ajout_fournisseur.dart';
import 'package:flutter_app/views/tickets/ajout-ticket.dart';
import 'package:flutter_app/views/utilisateurs/ajout_utilisateur.dart';
import 'package:flutter_app/views/home.dart';
import 'package:flutter_app/views/login.dart';
import 'package:flutter_app/views/settings.dart';
import 'package:flutter_app/views/utilisateurs/users.dart';

// Define Routes
/*
import 'package:named_route/views/home.dart';
import 'package:named_route/views/login.dart';
import 'package:named_route/views/settings.dart';
*/

// Route Names
const String loginPage = 'login';
const String homePage = 'home';
const String settingsPage = 'settings';
const String usersPage = 'users';
const String fournisseurssPage = 'fournisseurs';
const String ajoutUtilisateurPage = 'ajout-utilisateur';
const String ajoutFournisseurPage = 'ajout-fournisseur';
const String ajoutTicketPage = 'ajout-ticket';

// Control our page route flow
Route<dynamic> controller(RouteSettings settings) {
  switch (settings.name) {
    case loginPage:
      return MaterialPageRoute(builder: (context) => Login());
    case homePage:
      return MaterialPageRoute(builder: (context) => Home());
    case settingsPage:
      return MaterialPageRoute(builder: (context) => Settings());
    case usersPage:
      return MaterialPageRoute(builder: (context) => Users());
    case fournisseurssPage:
      return MaterialPageRoute(builder: (context) => Fournisseurs());
    case ajoutUtilisateurPage:
      return MaterialPageRoute(builder: (context) => AjoutUtilisateur());
    case ajoutFournisseurPage:
      return MaterialPageRoute(builder: (context) => AjoutFournisseur());
    case ajoutTicketPage:
      return MaterialPageRoute(builder: (context) => AjoutTicket());
    default:
      throw ('This route name does not exit');
  }
}
