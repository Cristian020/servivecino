import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:restaurant_ui_kit/util/const.dart';

double latitude;
double longitude;

Future<void> readServicesData() async {
  Constants().validateLatitude().then((value) => {latitude = value});
  Constants().validateLongitude().then((value) => {longitude = value});
  var query = await Firestore.instance
      .collection('formulario')
      .where('latitud',
          isGreaterThan: latitude - 0.02, isLessThanOrEqualTo: latitude + 0.02)
      // .where('longitud',
      //     isGreaterThanOrEqualTo: longitude - 0.02,
      //     isLessThanOrEqualTo: longitude + 0.02)
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
    services = items;
  });
}

List<Map> services = [
  {"img": "https://picsum.photos/250?image=9", "name": "Servicio Demo"},
];
