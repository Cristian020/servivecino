import 'package:flutter/material.dart';
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
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      floatingActionButton: FloatingActionButton(
        heroTag: 'btnSellView',
        onPressed: (){
          Navigator.push(context,MaterialPageRoute(builder: (context){
            return FavoriteScreen();
          }));
        },
        child: Icon(Icons.add),
        ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}

