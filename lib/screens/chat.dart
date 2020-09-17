import 'package:flutter/material.dart';

class Chats extends StatefulWidget {
  @override
  _ChatsState createState() => _ChatsState();
}

class _ChatsState extends State<Chats> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          leading: IconButton(
            icon: Icon(
              Icons.keyboard_backspace,
            ),
            onPressed: () => Navigator.pop(context),
          ),
          centerTitle: true,
          title: Text("Conversaciones"),
          elevation: 0.0,
        ),
        body: ListView(
          children: <Widget>[
            ListTile(
              //    onTap: () {Navigator.pushNamed(context, 'chat_carl');},
              leading: Icon(Icons.account_circle),
              title: Text('Carlos'),
              subtitle: Text('Buenas tardes. Me gustaria saber ...'),
              trailing: Icon(Icons.done),
            ),
            ListTile(
              /* onTap: () {
                Navigator.pushNamed(context, 'tab4');
              },*/
              leading: Icon(Icons.account_circle),
              title: Text('Laura'),
              subtitle: Text('Buenas dias. Cuanto cuesta la hora...'),
              trailing: Icon(Icons.done_all),
            ),
            ListTile(
              /* onTap: () {
                Navigator.pushNamed(context, 'tab5');
              },*/
              leading: Icon(Icons.account_circle),
              title: Text('Jorge'),
              subtitle: Text('Hola! Cuanto tarda el arreglo? '),
              trailing: Icon(Icons.replay),
            ),
            ListTile(
              /* onTap: () {
                Navigator.pushNamed(context, 'tab4');
              },*/
              leading: Icon(Icons.account_circle),
              title: Text('Fabian'),
              subtitle: Text('No. Esa maquina no tiene...'),
              trailing: Icon(Icons.done_all),
            )
          ],
        ));
  }
}
