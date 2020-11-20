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
    double latitud = (prefs.getDouble('latitud'));
    return latitud;
  }

  setLatitud(latitud) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setDouble('latitud', latitud);
  }

  //Variable para almacenar longitud
  Future<double> validateLongitude() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    double longitud = (prefs.getDouble('longitud'));
    return longitud;
  }

  setLongitud(longitud) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setDouble('longitud', longitud);
  }

  //Variable para almacenar token de customer
  Future<String> validateCustomer() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String customer = (prefs.getString('customer'));
    return customer;
  }

  setCustomer(customer) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('customer', customer);
  }

  //Variable para almacenar token de customer
  Future<String> validateTokenCc() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String tokenCc = (prefs.getString('tokenCc'));
    return tokenCc;
  }

  setTokenCc(tokenCc) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('tokenCc', tokenCc);
  }

  //Variable para almacenar token tarjeta para pago
  Future<String> validatePaymentMethod() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String paymentMethod = (prefs.getString('paymentMethod'));
    return paymentMethod;
  }

  setPaymentMethod(paymentMethod) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('paymentMethod', paymentMethod);
  }

  //Variable para almacenar  franquicia de tarjeta
  Future<String> validatePaymentMethodType() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String paymentMethodType = (prefs.getString('paymentMethodType'));
    return paymentMethodType;
  }

  setPaymentMethodType(paymentMethodType) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('paymentMethodType', paymentMethodType);
  }

  //Variable para almacenar ultimos 4 de tarjeta
  Future<String> validatePaymentMethodLastFour() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String paymentMethodLastFour = (prefs.getString('paymentMethodLastFour'));
    return paymentMethodLastFour;
  }

  setPaymentMethodLastFour(paymentMethodLastFour) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('paymentMethodLastFour', paymentMethodLastFour);
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
