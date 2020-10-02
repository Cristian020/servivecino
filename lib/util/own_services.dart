import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:restaurant_ui_kit/util/const.dart';

String _user;

List<Map> ownServices = [
  {"img": "https://picsum.photos/250?image=9", "name": "Servicio Demo"},
];

Future<void> readOwnServicesData() async {
  Constants().validateUserToken().then((value) => {_user = value});
  var query = await Firestore.instance
      .collection('formulario')
      .where('User', isEqualTo: _user)
      .getDocuments()
      .then((querySnapshot) {
    List<Map> items = [];
    querySnapshot.documents.forEach((result) {
      var info = result.data();
      items.add({"img": info["Imagen"], "name": info["Titulo"]});
      //print(result.data());
    });
    ownServices = items;
  });
}
