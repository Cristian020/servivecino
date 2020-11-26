import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:restaurant_ui_kit/screens/main_screen.dart';
import 'package:restaurant_ui_kit/util/const.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/scheduler.dart' show timeDilation;
import 'package:restaurant_ui_kit/util/info_services.dart';

import '../util/const.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _usernameControl = new TextEditingController();
  final TextEditingController _passwordControl = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(20.0, 0, 20, 0),
      child: ListView(
        shrinkWrap: true,
        children: <Widget>[
          SizedBox(height: 10.0),
          Container(
            alignment: Alignment.center,
            margin: EdgeInsets.only(
              top: 25.0,
            ),
            child: Text(
              "Ingresa a tu cuenta",
              style: TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.w700,
                color: Theme.of(context).accentColor,
              ),
            ),
          ),
          SizedBox(height: 30.0),
          Card(
            elevation: 3.0,
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(
                  Radius.circular(5.0),
                ),
              ),
              child: TextField(
                style: TextStyle(
                  fontSize: 15.0,
                  color: Colors.black,
                ),
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.all(10.0),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5.0),
                    borderSide: BorderSide(
                      color: Colors.white,
                    ),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.white,
                    ),
                    borderRadius: BorderRadius.circular(5.0),
                  ),
                  hintText: "Usuario",
                  hintStyle: TextStyle(
                    fontSize: 15.0,
                    color: Colors.black,
                  ),
                  prefixIcon: Icon(
                    Icons.perm_identity,
                    color: Colors.black,
                  ),
                ),
                maxLines: 1,
                controller: _usernameControl,
              ),
            ),
          ),
          SizedBox(height: 10.0),
          Card(
            elevation: 3.0,
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(
                  Radius.circular(5.0),
                ),
              ),
              child: TextField(
                style: TextStyle(
                  fontSize: 15.0,
                  color: Colors.black,
                ),
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.all(10.0),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5.0),
                    borderSide: BorderSide(
                      color: Colors.white,
                    ),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.white,
                    ),
                    borderRadius: BorderRadius.circular(5.0),
                  ),
                  hintText: "Contraseña",
                  prefixIcon: Icon(
                    Icons.lock_outline,
                    color: Colors.black,
                  ),
                  hintStyle: TextStyle(
                    fontSize: 15.0,
                    color: Colors.black,
                  ),
                ),
                obscureText: true,
                maxLines: 1,
                controller: _passwordControl,
              ),
            ),
          ),
          SizedBox(height: 10.0),
          Container(
            alignment: Alignment.centerRight,
            child: FlatButton(
              child: Text(
                "Olvido su contraseña?",
                style: TextStyle(
                  fontSize: 14.0,
                  fontWeight: FontWeight.w500,
                  color: Theme.of(context).accentColor,
                ),
              ),
              onPressed: () {},
            ),
          ),
          SizedBox(height: 30.0),
          Container(
            height: 50.0,
            child: RaisedButton(
              child: Text(
                "Ingresar".toUpperCase(),
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
              onPressed: () {
                signInWithEmail();
                readInfoServicesData();
              },
              color: Theme.of(context).accentColor,
            ),
          ),
          SizedBox(height: 10.0),
          Divider(
            color: Theme.of(context).accentColor,
          ),
          SizedBox(height: 10.0),
          Container(
            height: 50.0,
            child: RaisedButton(
              child: Text(
                "Omitir".toUpperCase(),
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (BuildContext context) {
                      Constants().setLogin(false);
                      print(Constants().validateLogin());
                      return MainScreen();
                    },
                  ),
                );
              },
              color: Theme.of(context).accentColor,
            ),
          ),
          SizedBox(height: 10.0),
          Divider(
            color: Theme.of(context).accentColor,
          ),
          SizedBox(height: 10.0),
          Center(
            child: Container(
              width: MediaQuery.of(context).size.width / 2,
            ),
          ),
          SizedBox(height: 20.0),
        ],
      ),
    );
  }

  void signInWithEmail() async {
    // marked async
    UserCredential user;
    try {
      user = await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: this._usernameControl.text,
          password: this._passwordControl.text);
    } catch (e) {
      print(e.toString());
    } finally {
      if (user != null) {
        // sign in successful!
        Constants().setLogin(true);
        Constants().setEmail(this._usernameControl.text);
        Constants().setUserToken(user.user.uid.toString());

        _pushPage(context, MainScreen());
      } else {
        // sign in unsuccessful
        print('sign in Not');
        // ex: prompt the user to try again
      }
    }
  }

  void _pushPage(BuildContext context, Widget page) {
    Navigator.of(context).push(
      MaterialPageRoute<void>(builder: (_) => page),
    );
  }
}
