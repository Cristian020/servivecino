import 'package:flutter/material.dart';
import 'package:restaurant_ui_kit/screens/chats.dart';
import 'package:restaurant_ui_kit/util/comments.dart';
import 'package:restaurant_ui_kit/util/const.dart';
import 'package:restaurant_ui_kit/util/services.dart';
import 'package:restaurant_ui_kit/widgets/badge.dart';
import 'package:restaurant_ui_kit/widgets/smooth_star_rating.dart';
import 'package:restaurant_ui_kit/screens/cart.dart';
import 'package:restaurant_ui_kit/screens/chats.dart';
import 'package:restaurant_ui_kit/screens/home.dart';
import 'package:url_launcher/url_launcher.dart';

import 'chats.dart';

class ProductDetails extends StatefulWidget {
  final int index;
  ProductDetails({Key key, @required this.index});
  @override
  _ProductDetailsState createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetails> {
  bool isFav = false;

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
        title: Text(
          "Detalles",
        ),
        elevation: 0.0,
        actions: <Widget>[
          /* IconButton(
            icon: IconBadge(
              icon: Icons.notifications,
              size: 22.0,
            ),
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (BuildContext context) {
                    return Chats();
                  },
                ),
              );
            },
          ),*/
        ],
      ),
      body: Padding(
        padding: EdgeInsets.fromLTRB(10.0, 0, 10.0, 0),
        child: ListView(
          children: <Widget>[
            SizedBox(height: 10.0),
            Stack(
              children: <Widget>[
                Container(
                  height: MediaQuery.of(context).size.height / 3.2,
                  width: MediaQuery.of(context).size.width,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(8.0),
                    child: Image.network(
                      "${services[widget.index]['img']}",
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
/*
                Positioned(
                  right: -10.0,
                  bottom: 3.0,
                  child: RawMaterialButton(
                    onPressed: (){},
                    fillColor: Colors.white,
                    shape: CircleBorder(),
                    elevation: 4.0,
                    child: Padding(
                      padding: EdgeInsets.all(5),
                      child: Icon(
                        isFav
                            ?Icons.favorite
                            :Icons.favorite_border,
                        color: Colors.red,
                        size: 17,
                      ),
                    ),
                  ),
                ),*/
              ],
            ),
            SizedBox(height: 10.0),
            Text(
              "${services[widget.index]['name']}",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w800,
              ),
              maxLines: 2,
            ),
            // Padding(
            //   padding: EdgeInsets.only(bottom: 5.0, top: 2.0),
            //   child: Row(
            //     children: <Widget>[
            //       SmoothStarRating(
            //         starCount: 5,
            //         color: Constants.ratingBG,
            //         allowHalfRating: true,
            //         rating: 5.0,
            //         size: 10.0,
            //       ),
            //       SizedBox(width: 10.0),
            //       Text(
            //         "5.0 (23 Recomendaciones)",
            //         style: TextStyle(
            //           fontSize: 11.0,
            //         ),
            //       ),
            //     ],
            //   ),
            // ),
            Padding(
              padding: EdgeInsets.only(bottom: 5.0, top: 2.0),
              child: Row(
                children: <Widget>[
                  // Text(
                  //   "20 partes",
                  //   style: TextStyle(
                  //     fontSize: 11.0,
                  //     fontWeight: FontWeight.w300,
                  //   ),
                  // ),
                  SizedBox(width: 10.0),
                  Text(
                    "${services[widget.index]['precio']}",
                    style: TextStyle(
                      fontSize: 14.0,
                      fontWeight: FontWeight.w900,
                      color: Theme.of(context).accentColor,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 20.0),
            Text(
              "Descripcion de producto",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w800,
              ),
              maxLines: 2,
            ),
            SizedBox(height: 10.0),
            Text(
              "${services[widget.index]['desc']}",
              style: TextStyle(
                fontSize: 13,
                fontWeight: FontWeight.w300,
              ),
            ),
            SizedBox(height: 20.0),
            // Text(
            //   "Comentarios",
            //   style: TextStyle(
            //     fontSize: 18,
            //     fontWeight: FontWeight.w800,
            //   ),
            //   maxLines: 2,
            // ),
            SizedBox(height: 20.0),
            // ListView.builder(
            //   shrinkWrap: true,
            //   primary: false,
            //   physics: NeverScrollableScrollPhysics(),
            //   itemCount: comments == null ? 0 : comments.length,
            //   itemBuilder: (BuildContext context, int index) {
            //     Map comment = comments[index];
            //     return ListTile(
            //       leading: CircleAvatar(
            //         radius: 25.0,
            //         backgroundImage: NetworkImage(
            //           "${comment['img']}",
            //         ),
            //       ),
            //       title: Text("${comment['name']}"),
            //       subtitle: Column(
            //         children: <Widget>[
            //           Row(
            //             children: <Widget>[
            //               SmoothStarRating(
            //                 starCount: 5,
            //                 color: Constants.ratingBG,
            //                 allowHalfRating: true,
            //                 rating: 5.0,
            //                 size: 12.0,
            //               ),
            //               SizedBox(width: 6.0),
            //               Text(
            //                 "Febrero 14, 2020",
            //                 style: TextStyle(
            //                   fontSize: 12,
            //                   fontWeight: FontWeight.w300,
            //                 ),
            //               ),
            //             ],
            //           ),
            //           SizedBox(height: 7.0),
            //           Text(
            //             "${comment["comment"]}",
            //           ),
            //         ],
            //       ),
            //     );
            //   },
            // ),
            SizedBox(height: 10.0),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        tooltip: "Contactar al vendedor",
        onPressed: () {
          String poison = "${services[widget.index]['celular']}";
          List<String> listlink = ["https://wa.me/57", poison];
          String pruebita = listlink.join();
          launch(pruebita);
          /*
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (BuildContext context) {
                return Chats();
              },
            ),
          );*/
        },
        child: Icon(
          Icons.chat,
        ),
        heroTag: Object(),
      ),
      bottomNavigationBar: Container(
        height: 50.0,
        child: RaisedButton(
          child: Text(
            "Agregar al carrito",
            style: TextStyle(
              color: Colors.white,
            ),
          ),
          color: Theme.of(context).accentColor,
          onPressed: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (BuildContext context) {
                  return CartScreen();
                },
              ),
            );
          },
        ),
      ),
    );
  }
}
