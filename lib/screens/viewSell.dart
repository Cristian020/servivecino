import 'package:flutter/material.dart';
import 'package:restaurant_ui_kit/screens/sell_screen.dart';
import 'package:restaurant_ui_kit/util/own_services.dart';
import 'package:restaurant_ui_kit/widgets/grid_product_own_services.dart';

class ViewSells extends StatefulWidget {
  @override
  _ViewSellState createState() => _ViewSellState();
}

class _ViewSellState extends State<ViewSells>
    with AutomaticKeepAliveClientMixin<ViewSells> {
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    //return Text('Holaaaa');
    super.build(context);
    readOwnServicesData();
    if (ownServices.length == 0) {
      return Scaffold(
        body: Padding(
            padding: EdgeInsets.fromLTRB(10.0, 0, 10.0, 0),
            child: ListView(children: <Widget>[
              Image(
                image: AssetImage('assets/viewSellPhoto.jpg'),
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
            ])),
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
    } else {
      return Scaffold(
        body: Padding(
          padding: EdgeInsets.fromLTRB(10.0, 0, 10.0, 0),
          child: ListView(
            children: <Widget>[
              SizedBox(height: 10.0),
              Text(
                "Mis Publicaciones",
                style: TextStyle(
                  fontSize: 23,
                  fontWeight: FontWeight.w800,
                ),
              ),
              SizedBox(height: 10.0),
              GridView.builder(
                shrinkWrap: true,
                primary: false,
                physics: NeverScrollableScrollPhysics(),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: MediaQuery.of(context).size.width /
                      (MediaQuery.of(context).size.height / 1.25),
                ),
                itemCount: ownServices == null ? 0 : ownServices.length,
                itemBuilder: (BuildContext context, int index) {
//                service service = service.fromJson(services[index]);
                  Map service = ownServices[index];
//                print(services);
//                print(services.length);
                  return GridProduct(
                    index: index,
                    img: service['img'],
                    isFav: false,
                    name: service['name'],
                    rating: 5.0,
                    raters: 23,
                  );
                },
              ),
              SizedBox(height: 30),
            ],
          ),
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
  }
}
