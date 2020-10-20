import 'package:cloud_firestore/cloud_firestore.dart';

Future<void> readServicesData() async {
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
  {"img": "https://picsum.photos/250?image=9", "name": "Servicio Demo"},
];
