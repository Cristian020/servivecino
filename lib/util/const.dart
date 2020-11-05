import 'dart:wasm';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Constants {
  //Bandera para validar status de login
  Future<bool> validateLogin() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool logged = (prefs.getBool('isLogged') ?? false);
    return logged;
  }

  setLogin(logged) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setBool('isLogged', logged);
  }

//Variable para almacenar email
  Future<String> validateEmail() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String email = (prefs.getString('email'));
    return email;
  }

  setEmail(email) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('email', email);
  }

  //Variable para almacenar token de usuario
  Future<String> validateUserToken() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String userToken = (prefs.getString('userToken'));
    return userToken;
  }

  setUserToken(userToken) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('userToken', userToken);
  }

  //Variable para almacenar palabra clave de busqueda
  Future<String> validateKeyword() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String keyword = (prefs.getString('keyword'));
    return keyword;
  }

  setKeyword(keyword) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('keyword', keyword);
  }

  //Variable para almacenar categoria de busqueda
  Future<String> validateCategory() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String category = (prefs.getString('category'));
    return category;
  }

  setCategory(category) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('category', category);
  }

  //Variable para almacenar latitud
  Future<double> validateLatitude() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    double category = (prefs.getDouble('latitud'));
    return category;
  }

  setLatitud(latitud) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setDouble('latitud', latitud);
  }

  //Variable para almacenar longitud
  Future<double> validateLongitude() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    double category = (prefs.getDouble('longitud'));
    return category;
  }

  setLongitud(longitud) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setDouble('longitud', longitud);
  }

  static String appName = "Servivecino";

  //Colors for theme
//  Color(0xfffcfcff);
  static Color lightPrimary = Color(0xfffcfcff);
  static Color darkPrimary = Colors.black;
  static Color lightAccent = Colors.red;
  static Color darkAccent = Colors.red[400];
  static Color lightBG = Color(0xfffcfcff);
  static Color darkBG = Colors.black;
  static Color ratingBG = Colors.yellow[600];

  static ThemeData lightTheme = ThemeData(
    backgroundColor: lightBG,
    primaryColor: lightPrimary,
    accentColor: lightAccent,
    cursorColor: lightAccent,
    scaffoldBackgroundColor: lightBG,
    appBarTheme: AppBarTheme(
      textTheme: TextTheme(
        headline1: TextStyle(
          color: darkBG,
          fontSize: 18.0,
          fontWeight: FontWeight.w800,
        ),
      ),
//      iconTheme: IconThemeData(
//        color: lightAccent,
//      ),
    ),
  );

  static ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark,
    backgroundColor: darkBG,
    primaryColor: darkPrimary,
    accentColor: darkAccent,
    scaffoldBackgroundColor: darkBG,
    cursorColor: darkAccent,
    appBarTheme: AppBarTheme(
      textTheme: TextTheme(
        headline1: TextStyle(
          color: lightBG,
          fontSize: 18.0,
          fontWeight: FontWeight.w800,
        ),
      ),
//      iconTheme: IconThemeData(
//        color: darkAccent,
//      ),
    ),
  );
}
