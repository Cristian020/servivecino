import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:restaurant_ui_kit/pasarela/pay.dart';
import 'package:restaurant_ui_kit/util/services.dart';
import 'package:restaurant_ui_kit/widgets/cart_item.dart';
import 'package:restaurant_ui_kit/screens/creditCard_form.dart';
import 'package:restaurant_ui_kit/pasarela/create_customer.dart';
import 'package:restaurant_ui_kit/util/shoppingCart_services.dart';

class Checkout extends StatefulWidget {
  @override
  _CheckoutState createState() => _CheckoutState();
}

class _CheckoutState extends State<Checkout> {
  //final TextEditingController _couponlControl = new TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  final List<String> _numeroCuotas = [
    '1',
    '2',
    '3',
    '4',
    '5',
    '6',
    '7',
    '8',
    '9',
    '10',
    '11',
    '12',
    '13',
    '14',
    '15',
    '16',
    '17',
    '18',
    '19',
    '20',
    '21',
    '22',
    '23',
    '24',
    '25',
    '26',
    '27',
    '28',
    '29',
    '30',
    '31',
    '32',
    '33',
    '34',
    '35',
    '36'
  ];
  var _cuotaSeleccionada;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text(
          "Pagar",
          style: TextStyle(
            fontSize: 23,
            fontWeight: FontWeight.w800,
          ),
        ),
        elevation: 0.0,
        actions: <Widget>[
          IconButton(
            tooltip: "Atras",
            icon: Icon(
              Icons.clear,
              color: Theme.of(context).accentColor,
            ),
            onPressed: () => Navigator.pop(context),
          ),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.fromLTRB(10.0, 0, 10.0, 130),
        child: ListView(
          children: <Widget>[
            Text(
              "Servicio",
              style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.w400,
              ),
            ),
            ListView.builder(
              primary: false,
              shrinkWrap: true,
              itemCount: shoppingCart == null ? 0 : shoppingCart.length,
              itemBuilder: (BuildContext context, int index) {
//                service service = service.fromJson(services[index]);
                Map service = services[index];
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
            ),
            SizedBox(height: 10.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  "Direccion",
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.edit,
                  ),
                ),
              ],
            ),
            SizedBox(height: 10.0),
            ListTile(
              title: Text(
                "John Doe",
                style: TextStyle(
//                    fontSize: 15,
                  fontWeight: FontWeight.w900,
                ),
              ),
              subtitle: Text("Calle falsa 123"),
            ),
            SizedBox(height: 10.0),
            Text(
              "Medio de pago",
              style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.w400,
              ),
            ),
            Container(
                child: Column(
              children: [
                DropdownButtonFormField(
                  items: _numeroCuotas.map((value) {
                    return DropdownMenuItem(
                      child: Text(
                        value,
                      ),
                      value: value,
                    );
                  }).toList(),
                  onChanged: (selectAccountType) {
                    setState(() {
                      _cuotaSeleccionada = selectAccountType;
                    });
                  },
                  value: _cuotaSeleccionada,
                  isExpanded: false,
                  hint: Text('Numero de cuotas'),
                  validator: (value) {
                    return value == null
                        ? "El numero de cuota es requerida"
                        : null;
                  },
                  onSaved: (value) {
                    return _cuotaSeleccionada = value;
                  },
                ),
                Card(
                  elevation: 4.0,
                  child: ListTile(
                    title: Text("John Doe"),
                    subtitle: Text(
                      "5506 7744 8610 9638",
                      style: TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                    onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (BuildContext context) {
                            return AddCreditCard();
                          },
                        ),
                      );
                    },
                    leading: Icon(
                      FontAwesomeIcons.creditCard,
                      size: 50.0,
                      color: Theme.of(context).accentColor,
                    ),
                    trailing: IconButton(
                      onPressed: () {
                        return AddCreditCard();
                      },
                      icon: Icon(
                        Icons.keyboard_arrow_down,
                      ),
                    ),
                  ),
                ),
              ],
            )),
            SizedBox(height: 20.0),
          ],
        ),
      ),
      bottomSheet: Card(
        elevation: 4.0,
        child: Container(
          child: ListView(
            physics: NeverScrollableScrollPhysics(),
            children: <Widget>[
              /*ListTile(
               title: Text(
                 "Nombre",
                 style: TextStyle(
                   fontSize: 17,
                   fontWeight: FontWeight.w700,
                 ),
               ),
               subtitle: Text(
                 "Jane Mary Doe",
              ),*/
              // Padding(
              //   padding: EdgeInsets.all(10),
              //   child: Container(
              //     decoration: BoxDecoration(
              //       color: Colors.grey[200],
              //       borderRadius: BorderRadius.all(
              //         Radius.circular(5.0),
              //       ),
              //     ),
              //     child: TextField(
              //       style: TextStyle(
              //         fontSize: 15.0,
              //         color: Colors.black,
              //       ),
              //       decoration: InputDecoration(
              //         contentPadding: EdgeInsets.all(10.0),
              //         border: OutlineInputBorder(
              //           borderRadius: BorderRadius.circular(5.0),
              //           borderSide: BorderSide(
              //             color: Colors.grey[200],
              //           ),
              //         ),
              //         enabledBorder: OutlineInputBorder(
              //           borderSide: BorderSide(
              //             color: Colors.grey[200],
              //           ),
              //           borderRadius: BorderRadius.circular(5.0),
              //         ),
              //         hintText: "Cupon",
              //         prefixIcon: Icon(
              //           Icons.redeem,
              //           color: Theme.of(context).accentColor,
              //         ),
              //         hintStyle: TextStyle(
              //           fontSize: 15.0,
              //           color: Colors.black,
              //         ),
              //       ),
              //       maxLines: 1,
              //       controller: _couponlControl,
              //     ),
              //   ),
              // ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.fromLTRB(10, 5, 5, 5),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          "Total",
                          style: TextStyle(
                            fontSize: 13,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        Text(
                          r"$ 21200",
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w900,
                            color: Theme.of(context).accentColor,
                          ),
                        ),
                        Text(
                          "Costo de entrega incluido",
                          style: TextStyle(
                            fontSize: 11,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.fromLTRB(5, 5, 10, 5),
                    width: 150.0,
                    height: 50.0,
                    child: FlatButton(
                      color: Theme.of(context).accentColor,
                      child: Text(
                        "Pagar".toUpperCase(),
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                      onPressed: () {
                        //Aca va la funcionalidad de consumir api de pasarela
                        createPay();
                      },
                    ),
                  ),
                ],
              ),
            ],
          ),
          height: 130,
        ),
      ),
    );
  }
}
