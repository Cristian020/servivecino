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
    List<PageViewModel> pages = [
    PageViewModel(
        "Con prisa, pero sin filas",
        "Evita las filas en centros comerciales."
            " disfruta de compartir con tu familia sin estres. "
            "ordena tu comida desde cuakquier parte.",
        image: Image.asset(
          "assets/on1.png",
          height: 175.0,
        ),
        decoration: PageDecoration(
          titleTextStyle: TextStyle(
            fontSize: 28.0,
            fontWeight: FontWeight.w600,
            color: Theme.of(context).accentColor,
          ),
          bodyTextStyle: TextStyle(fontSize: 15.0),
          dotsDecorator: DotsDecorator(
            activeColor: Theme.of(context).accentColor,
            activeSize: Size.fromRadius(8),
          ),
          pageColor: Theme.of(context).primaryColor,
        ),
      ),
    ];
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
      
    
      body: Padding(
        padding: EdgeInsets.fromLTRB(10.0, 0, 10.0, 0),
        child: ListView(
          children: <Widget>[
            SizedBox(height: 10.0),

          Image(
            image: null
          )
          /*child: image: Image.asset(
            "assets/on1.png",
            height: 175.0,
          ),*/
        ]
        )
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}

