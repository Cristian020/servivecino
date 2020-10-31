import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:restaurant_ui_kit/util/const.dart';

String _category;

List<Map> categoryServices = [
  {"img": "https://picsum.photos/250?image=9", "name": "Servicio Demo"},
];

Future<void> readCategoryServicesData() async {
  Constants().validateCategory().then((value) => {_category = value});
  var query = await Firestore.instance
      .collection('formulario')
      .where('Categoria', isEqualTo: _category)
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
      print(result.data());
    });
    categoryServices = items;
  });
}
