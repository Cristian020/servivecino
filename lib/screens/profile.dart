import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:restaurant_ui_kit/providers/app_provider.dart';
import 'package:restaurant_ui_kit/screens/splash.dart';
import 'package:restaurant_ui_kit/util/const.dart';
import 'package:restaurant_ui_kit/util/info_services.dart';

String user = '';

class Profile extends StatefulWidget {
  final int index;
  Profile({Key key, @required this.index});
  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    Constants().validateEmail().then((value) => {user = value});
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.fromLTRB(10.0, 0, 10.0, 0),
        child: ListView(
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.only(left: 10.0, right: 10.0),
                  child: Image.asset(
                    "assets/vecino.png",
                    fit: BoxFit.cover,
                    width: 100.0,
                    height: 100.0,
                  ),
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Text(
                            "Usuario:",
                            style: TextStyle(
                              fontSize: 20.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 5.0),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Text(
                            user,
                            style: TextStyle(
                              fontSize: 14.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 20.0),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          InkWell(
                            onTap: () {
                              Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (BuildContext context) {
                                    return SplashScreen();
                                  },
                                ),
                              );
                            },
                            child: Text(
                              "Cerrar sesion",
                              style: TextStyle(
                                fontSize: 13.0,
                                fontWeight: FontWeight.w400,
                                color: Theme.of(context).accentColor,
                              ),
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  flex: 3,
                ),
              ],
            ),
            Divider(),
            Container(height: 15.0),
            Padding(
              padding: EdgeInsets.all(5.0),
              child: Text(
                "Informacion de cuenta".toUpperCase(),
                style: TextStyle(
                  fontSize: 16.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            // ListTile(
            //   title: Text(
            //     "Nombre",
            //     style: TextStyle(
            //       fontSize: 17,
            //       fontWeight: FontWeight.w700,
            //     ),
            //   ),
            //   subtitle: Text(
            //     "Jane Mary Doe",
            //   ),
            //   trailing: IconButton(
            //     icon: Icon(
            //       Icons.edit,
            //       size: 20.0,
            //     ),
            //     onPressed: () {},
            //     tooltip: "Editar",
            //   ),
            // ),
            ListTile(
              title: Text(
                "${infoServices[widget.index]['name']}",
                style: TextStyle(
                  fontSize: 17,
                  fontWeight: FontWeight.w700,
                ),
              ),
              subtitle: Text(
                user,
              ),
            ),
            ListTile(
              title: Text(
                "${infoServices[widget.index]['lastname']}",
                style: TextStyle(
                  fontSize: 17,
                  fontWeight: FontWeight.w700,
                ),
              ),
              subtitle: Text(
                user,
              ),
            ),
            ListTile(
              title: Text(
                "${infoServices[widget.index]['document']}",
                style: TextStyle(
                  fontSize: 17,
                  fontWeight: FontWeight.w700,
                ),
              ),
              subtitle: Text(
                user,
              ),
            ),
            ListTile(
              title: Text(
                "${infoServices[widget.index]['telefono']}",
                style: TextStyle(
                  fontSize: 17,
                  fontWeight: FontWeight.w700,
                ),
              ),
              subtitle: Text(
                user,
              ),
            ),
            ListTile(
              title: Text(
                "${infoServices[widget.index]['email']}",
                style: TextStyle(
                  fontSize: 17,
                  fontWeight: FontWeight.w700,
                ),
              ),
              subtitle: Text(
                user,
              ),
            ),
            ListTile(
              title: Text(
                "${infoServices[widget.index]['direccion']}",
                style: TextStyle(
                  fontSize: 17,
                  fontWeight: FontWeight.w700,
                ),
              ),
              subtitle: Text(
                user,
              ),
            ),
            // ListTile(
            //   title: Text(
            //     "Telefono",
            //     style: TextStyle(
            //       fontSize: 17,
            //       fontWeight: FontWeight.w700,
            //     ),
            //   ),
            //   subtitle: Text(
            //     "+1 816-926-6241",
            //   ),
            // ),
            // ListTile(
            //   title: Text(
            //     "Direccion",
            //     style: TextStyle(
            //       fontSize: 17,
            //       fontWeight: FontWeight.w700,
            //     ),
            //   ),
            //   subtitle: Text(
            //     "Calle falsa 123",
            //   ),
            // ),
            // ListTile(
            //   title: Text(
            //     "Genero",
            //     style: TextStyle(
            //       fontSize: 17,
            //       fontWeight: FontWeight.w700,
            //     ),
            //   ),
            //   subtitle: Text(
            //     "Femenino",
            //   ),
            // ),
            // ListTile(
            //   title: Text(
            //     "Fecha de nacimiento",
            //     style: TextStyle(
            //       fontSize: 17,
            //       fontWeight: FontWeight.w700,
            //     ),
            //   ),
            //   subtitle: Text(
            //     "Abril 9, 1995",
            //   ),
            // ),
            ListTile(
              title: Text(
                "Tema oscuro",
                style: TextStyle(
                  fontSize: 17,
                  fontWeight: FontWeight.w700,
                ),
              ),
              trailing: Switch(
                value: Provider.of<AppProvider>(context).theme ==
                        Constants.lightTheme
                    ? false
                    : true,
                onChanged: (v) async {
                  if (v) {
                    Provider.of<AppProvider>(context, listen: false)
                        .setTheme(Constants.darkTheme, "dark");
                  } else {
                    Provider.of<AppProvider>(context, listen: false)
                        .setTheme(Constants.lightTheme, "light");
                  }
                },
                activeColor: Theme.of(context).accentColor,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
