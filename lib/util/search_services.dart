import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:restaurant_ui_kit/util/const.dart';

String keyword = "";

List<Map> ownServices = [
  {"img": "https://picsum.photos/250?image=9", "name": "Servicio Demo"},
];

Future<void> readSearchServicesData() async {
  Constants().validateKeyword().then((value) => {keyword = value});
  var query = await Firestore.instance
      .collection('formulario')
      .orderBy('Titulo')
      .startAt([keyword])
      .endAt([keyword + '\uf8ff'])
      .getDocuments()
      .then((querySnapshot) {
        List<Map> items = [];
        querySnapshot.documents.forEach((result) {
          var info = result.data();
          items.add({"img": info["Imagen"], "name": info["Titulo"]});
          print(result.data());
        });
        ownServices = items;
      });
}
