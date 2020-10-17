import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:restaurant_ui_kit/auth.dart';

class UserModel {
  static const String collectionName = 'user';

  static const String _name = 'name';
  static const String _lastName = 'lastName';
  static const String _telefono = 'telefono';
  static const String _email = 'email';
  static const String _document = 'document';
  static const String _direccion = 'direccion';
  static const String _authId = 'authId';

  static final CollectionReference collectionReference =
      FirebaseFirestore.instance.collection(UserModel.collectionName);

  static UserModel currentUser;

  User _userAuth;

  String name;
  String lastName;
  String telefono;
  String document;
  String direccion;
  String email;

  DocumentReference reference;

  UserModel(
      {this.name,
      this.lastName,
      this.reference,
      this.telefono,
      this.email,
      this.document,
      this.direccion});

  UserModel.fromMap(Map<String, dynamic> map, {this.reference, User userAuth})
      : assert(map[_name] != null),
        assert(map[_lastName] != null),
        assert(map[_telefono] != null),
        assert(map[_email] != null),
        assert(map[_document] != null),
        assert(map[_direccion] != null),
        name = map[_name],
        lastName = map[_lastName],
        email = map[_email],
        document = map[_document],
        telefono = map[_telefono],
        direccion = map[_direccion],
        _userAuth = userAuth;

  UserModel.fromSnapshot(DocumentSnapshot snapshot, {User userAuth})
      : this.fromMap(snapshot.data(),
            reference: snapshot.reference, userAuth: userAuth);

  static Future<UserModel> signin(String email, String password) async {
    await (new Auth()).signIn(email, password);

    User userAuth = FirebaseAuth.instance.currentUser;

    final query = await FirebaseFirestore.instance
        .collection(UserModel.collectionName)
        .where(_authId, isEqualTo: userAuth.uid)
        .get();

    final user =
        await UserModel.fromSnapshot(query.docs.first, userAuth: userAuth);

    UserModel.currentUser = user;

    return user;
  }

  static Stream<QuerySnapshot> snapshot() => FirebaseFirestore.instance
      .collection(UserModel.collectionName)
      .snapshots();

  Future<void> signOut() {
    (new Auth()).signOut();
    UserModel.currentUser = null;
  }

  static Future<void> signUp(
      {String name,
      String lastName,
      String email,
      String telefono,
      String password,
      String document,
      String direccion,
      DocumentReference documentType}) async {
    String uid = await (new Auth()).signUp(email, password);

    Map<String, dynamic> userData = {
      _authId: uid,
      _name: name,
      _lastName: _lastName,
      _email: email,
      _telefono: telefono,
      _document: document,
      _direccion: direccion
    };
    await UserModel.collectionReference.add(userData);
  }

  Future<void> update({
    String name,
    String lastName,
    String telefono,
    String direccion,
  }) async {
    this.name = name;
    this.lastName = lastName;
    this.telefono = telefono;
    this.direccion = direccion;
    Map<String, dynamic> userData = {
      _name: name,
      _lastName: lastName,
      _telefono: telefono,
      _direccion: direccion
    };
    await this.reference.update(userData);
  }
}
