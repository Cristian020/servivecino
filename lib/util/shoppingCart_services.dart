import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:restaurant_ui_kit/util/const.dart';

String keyword = "";

List<Map> shoppingCart = [
  {"img": "https:// picsum.photos/250?image=9", "name": "Servicio Demo"},
];

Future<void> readshoppingCartServicesData() async {
  var query = await Firestore.instance
      .collection('cart')
      .getDocuments()
      .then((querySnapshot) {
    List<Map> items = [];
    querySnapshot.documents.forEach((result) {
      var info = result.data();
      items.add({
        "img": info["Imagen"],
        "name": info["Titulo"],
        "desc": info['Descripcion'],
        "precio": info['Precio'],
        "celular": info['Celular'],
        "categoria": info['Categoria'],
        "dir": info['Direccion'],
      });
      //print(result.data());
    });
    shoppingCart = items;
  });
}

Future<void> addshoppingCartServicesData() async {}
