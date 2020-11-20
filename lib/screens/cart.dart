import 'package:flutter/material.dart';
import 'package:restaurant_ui_kit/screens/checkout.dart';
import 'package:restaurant_ui_kit/widgets/grid_product_shopping_cart.dart';
import 'package:restaurant_ui_kit/util/services.dart';
import 'package:restaurant_ui_kit/widgets/cart_item.dart';
import 'package:restaurant_ui_kit/screens/details_shopping_cart.dart  ';
import 'package:restaurant_ui_kit/util/shoppingCart_services.dart';

class CartScreen extends StatefulWidget {
  @override
  _CartScreenState createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen>
    with AutomaticKeepAliveClientMixin<CartScreen> {
  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.fromLTRB(10.0, 0, 10.0, 0),
        child: ListView(
          children: <Widget>[
            SizedBox(height: 20.0),
            Text(
              "Carrito de compras",
              style: TextStyle(
                fontSize: 23,
                fontWeight: FontWeight.w800,
              ),
            ),
            SizedBox(height: 25.0),
            ListView.builder(
              shrinkWrap: true,
              primary: false,
              physics: NeverScrollableScrollPhysics(),
              itemCount: shoppingCart == null ? 0 : shoppingCart.length,
              itemBuilder: (BuildContext context, int index) {
                Map service = shoppingCart[index];
                return ListTile(
                  title: Text(
                    "${service['name']}",
                    style: TextStyle(
//                    fontSize: 15,
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                  leading: CircleAvatar(
                    radius: 22.5,
                    backgroundImage: NetworkImage(
                      "${service['img']}",
                    ),
                  ),
                  trailing: Text("${service['precio']}"),
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (BuildContext context) {
                          return ProductDetails(
                            index: index,
                          );
                        },
                      ),
                    );
                  },
                );
              },
            ),
            SizedBox(height: 40),
          ],
        ),
        /*ListView.builder(
          itemCount: shoppingCart == null ? 0 : shoppingCart.length,
          itemBuilder: (BuildContext context, int index) {
//                service service = service.fromJson(services[index]);
            Map service = shoppingCart[index];
//                print(services);
//                print(services.length);
            return CartItem(
              img: service['img'],
              isFav: false,
              name: service['name'],
              rating: 5.0,
              raters: 23,
            );
          },
        ),*/
      ),
      floatingActionButton: FloatingActionButton(
        tooltip: "Pagar",
        onPressed: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (BuildContext context) {
                return Checkout();
              },
            ),
          );
        },
        child: Icon(
          Icons.credit_card,
        ),
        heroTag: Object(),
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
