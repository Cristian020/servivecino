import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:restaurant_ui_kit/util/const.dart';

//String _user;

List<Map> infoServices = [
  {"img": "https://picsum.photos/250?image=9", "name": "Servicio Demo"},
];

Future<void> readInfoServicesData() async {
  //Constants().validateUserToken().then((value) => {_user = value});
  var query = await Firestore.instance
      .collection('user')
      //.where('authId', isEqualTo: _user)
      .getDocuments()
      .then((querySnapshot) {
    List<Map> items = [];
    querySnapshot.documents.forEach((result) {
      var info = result.data();
      items.add({
        "name": info['name'],
        "lastname": info['lastname'],
        "document": info['document'],
        "telefono": info['telefono'],
        "email": info['email'],
        "direccion": info['direccion'],
      });
      //print(result.data());
    });
    infoServices = items;
  });
}
