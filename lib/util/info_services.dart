import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:restaurant_ui_kit/util/const.dart';

List<Map> infoServices = [
  //{"img": "https://picsum.photos/250?image=9", "name": "Servicio Demo"},
];

Future<void> readInfoServicesData() async {
  Constants().validateUserToken().then((String value) {
    List<Map> items = [];
    FirebaseFirestore.instance
        .collection('user')
        .doc(value)
        .get()
        .then((DocumentSnapshot documentSnapshot) {
      if (documentSnapshot.exists) {
        items.add(documentSnapshot.data());
        infoServices = items;
        print('Document data: ${documentSnapshot.data()}');
      } else {
        print('Document does not exist on the database');
      }
    });
  });
}
