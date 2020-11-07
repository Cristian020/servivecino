import 'package:flutter/material.dart';
//import 'package:restaurant_ui_kit/screens/dishes.dart';
import 'package:restaurant_ui_kit/widgets/grid_product.dart';
import 'package:restaurant_ui_kit/widgets/home_category.dart';
import 'package:restaurant_ui_kit/widgets/slider_item.dart';
import 'package:restaurant_ui_kit/util/services.dart';
import 'package:restaurant_ui_kit/util/own_services.dart';
import 'package:restaurant_ui_kit/util/categories.dart';
import 'package:carousel_slider/carousel_slider.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> with AutomaticKeepAliveClientMixin<Home> {
  @override
  bool get wantKeepAlive => true;

  List<T> map<T>(List list, Function handler) {
    List<T> result = [];
    for (var i = 0; i < list.length; i++) {
      result.add(handler(i, list[i]));
    }

    return result;
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    if (services.length == 0) {
      return Scaffold(
        body: Padding(
            padding: EdgeInsets.fromLTRB(10.0, 0, 10.0, 0),
            child: ListView(children: <Widget>[
              Image(
                image: AssetImage('assets/Think.jpg'),
                alignment: Alignment.bottomCenter,
                height: 400,
              ),
              Text(
                'No hay servicios cercanos donde usted se encuentra',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 28.0,
                  fontWeight: FontWeight.w600,
                  color: Colors.blueGrey[100],
                ),
              ),
            ])),
      );
    } else {
      return Scaffold(
        body: Padding(
          padding: EdgeInsets.fromLTRB(10.0, 0, 10.0, 0),
          child: ListView(
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    "Servicios",
                    style: TextStyle(
                      fontSize: 23,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
//                 FlatButton(
//                   child: Text(
//                     "Ver Mas",
//                     style: TextStyle(
// //                      fontSize: 22,
// //                      fontWeight: FontWeight.w800,
//                       color: Theme.of(context).accentColor,
//                     ),
//                   ),
//                   onPressed: () {
//                     Navigator.of(context).push(
//                       MaterialPageRoute(
//                         builder: (BuildContext context) {
//                           return DishesScreen();
//                         },
//                       ),
//                     );
//                   },
//                 ),
                ],
              ),

              SizedBox(height: 10.0),

              //Slider Here

              CarouselSlider(
                height: MediaQuery.of(context).size.height / 2.4,
                items: map<Widget>(
                  services,
                  (index, i) {
                    Map service = services[index];
                    return SliderItem(
                      index: index,
                      img: service['img'],
                      isFav: false,
                      name: service['name'],
                      rating: 5.0,
                      raters: 23,
                    );
                  },
                ).toList(),
                autoPlay: true,
//                enlargeCenterPage: true,
                viewportFraction: 1.0,
//              aspectRatio: 2.0,
                onPageChanged: (index) {
                  setState(() {});
                },
              ),
              SizedBox(height: 20.0),

              Text(
                "Categorias",
                style: TextStyle(
                  fontSize: 23,
                  fontWeight: FontWeight.w800,
                ),
              ),
              SizedBox(height: 10.0),

              Container(
                height: 65.0,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  shrinkWrap: true,
                  itemCount: categories == null ? 0 : categories.length,
                  itemBuilder: (BuildContext context, int index) {
                    Map cat = categories[index];
                    return HomeCategory(
                      icon: cat['icon'],
                      title: cat['name'],
                      //items: cat['items'].toString(),
                      isHome: true,
                    );
                  },
                ),
              ),

              SizedBox(height: 20.0),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    "Populares",
                    style: TextStyle(
                      fontSize: 23,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
//                 FlatButton(
//                   child: Text(
//                     "Ver Mas",
//                     style: TextStyle(
// //                      fontSize: 22,
// //                      fontWeight: FontWeight.w800,
//                       color: Theme.of(context).accentColor,
//                     ),
//                   ),
//                   onPressed: () {},
//                 ),
                ],
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
                itemCount: services == null ? 0 : services.length,
                itemBuilder: (BuildContext context, int index) {
//                service service = service.fromJson(services[index]);
                  Map service = services[index];
                  readServicesData();
                  readOwnServicesData();
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
      );
    }
  }
}
