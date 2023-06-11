import 'package:flutter/material.dart';
import 'package:flutter_app/views/home.dart';
import 'package:flutter_app/views/login.dart';

// Define Routes
/*
import 'package:named_route/views/home.dart';
import 'package:named_route/views/login.dart';
import 'package:named_route/views/settings.dart';
*/

// Route Names
const String loginPage    = 'login';
const String homePage     = 'home';
const String settingsPage = 'settings';

// Control our page route flow
Route<dynamic> controller(RouteSettings settings) {
  switch (settings.name) {
    case loginPage:
      return MaterialPageRoute(builder: (context) => Login());
    case homePage:
      return MaterialPageRoute(builder: (context) => Home());
    // case settingsPage:
    //   return MaterialPageRoute(builder: (context) => SettingsPage());
    default:
      throw('This route name does not exit');
  }
}