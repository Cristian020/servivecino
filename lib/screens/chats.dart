import 'package:flutter/material.dart';
import 'package:restaurant_ui_kit/util/chats.dart';

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
        body: new ListView.builder(
            itemCount: dataDummy.length,
            itemBuilder: (context, i) => new Column(
                  children: <Widget>[
                    new Divider(
                      height: 10,
                    ),
                    new ListTile(
                      leading: new CircleAvatar(
                        backgroundImage: new NetworkImage(dataDummy[i].avatar),
                      ),
                      title: new Text(dataDummy[i].title),
                      subtitle: new Text(dataDummy[i].message),
                    )
                  ],
                )));
  }
}
