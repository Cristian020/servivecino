import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:restaurant_ui_kit/util/const.dart';

String keyword = "";

List<Map> searchServices = [
  {"img": "https://picsum.photos/250?image=9", "name": "Servicio Demo"},
];

Future<void> readSearchServicesData() async {
  Constants().validateKeyword().then((value) => {keyword = value});
  var query = await Firestore.instance
      .collection('formulario')
      //.orderBy('Keywords')
      //.startAt([keyword])
      //.endAt([keyword + '\uf8ff'])
      .where('Keywords', arrayContains: keyword)
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
    searchServices = items;
  });
}
