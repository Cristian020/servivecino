import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:restaurant_ui_kit/screens/sell_screen.dart';
//import 'package:restaurant_ui_kit/screens/sell_screen.dart';

class ViewSells extends StatefulWidget {
  @override
  _ViewSellState createState() => _ViewSellState();
}

class _ViewSellState extends State<ViewSells> with AutomaticKeepAliveClientMixin<ViewSells> {
  @override
  Widget build(BuildContext context) {
    //return Text('Holaaaa');
    super.build(context);
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.fromLTRB(10.0, 0, 10.0, 0),
        child: ListView(
          children: <Widget>[
            Image(
              image:AssetImage('assets/viewSellPhoto.jpg'),
              alignment: Alignment.bottomCenter,
              height: 400,
            ),
            Text(
              'No ha realizado ninguna venta de servicios',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 28.0,
                fontWeight: FontWeight.w600,
                color: Colors.blueGrey[100],
              ),
            ),  
          ]
        )
      ),
      
      floatingActionButton: FloatingActionButton(
        tooltip: "btnSellView",
        onPressed: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (BuildContext context) {
                return FavoriteScreen();
              },
            ),
          );
        },
        child: Icon(
          Icons.add,
        ),
        heroTag: Object(),
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}

