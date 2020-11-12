import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:restaurant_ui_kit/util/const.dart';
import 'package:geoflutterfire/geoflutterfire.dart';

double latitude;
double longitude;
double radius = 50;
String field = 'Geopoint';
final geo = Geoflutterfire();
final _firestore = FirebaseFirestore.instance;

Future<void> readServicesData() async {
  Constants().validateLatitude().then((value) => {latitude = value});
  Constants().validateLongitude().then((value) => {longitude = value});

// Create a geoFirePoint
  // GeoFirePoint center = geo.point(latitude: latitude, longitude: longitude);
  // var collectionReference = _firestore.collection('formulario');
  // Stream<List<DocumentSnapshot>> stream = geo
  //     .collection(collectionRef: collectionReference)
  //     .within(center: center, radius: radius, field: field, strictMode: true);
  // stream.listen((List<DocumentSnapshot> documentList) {
  //   print(stream.length);
  //   print(documentList[0].data());
  //   List<Map> items = [];
  //   documentList.forEach((DocumentSnapshot document) {
  //     var info = document.data();
  //     items.add({
  //       "img": info["Imagen"],
  //       "name": info["Titulo"],
  //       "desc": info['Descripcion'],
  //       "precio": info['Precio'],
  //       "celular": info['Celular'],
  //       "categoria": info['Categoria'],
  //       "dir": info['Direccion'],
  //     });
  //     print(document.data());
  //   });
  //   services = items;
  // });

  var query = await Firestore.instance
      .collection('formulario')
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
  //{"img": "https://picsum.photos/250?image=9", "name": "Servicio Demo"},
];
