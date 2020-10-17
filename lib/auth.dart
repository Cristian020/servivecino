import 'package:firebase_auth/firebase_auth.dart';

abstract class BasicAuth {
  Future<String> signIn(String email, String pasword);
  Future<String> signUp(String email, String pasword);
  Future<User> getCurrentUser();
  Future<void> signOut();
}

class Auth implements BasicAuth {
  final FirebaseAuth _fbAuth = FirebaseAuth.instance;

  @override
  Future<User> getCurrentUser() async {
    User user = _fbAuth.currentUser;
    return user;
  }

  @override
  Future<String> signIn(String email, String password) async {
    UserCredential result = await _fbAuth.signInWithEmailAndPassword(
        email: email, password: password);
    User user = result.user;
    return user.uid;
  }

  @override
  Future<void> signOut() {
    return _fbAuth.signOut();
  }

  @override
  Future<String> signUp(String email, String password) async {
    UserCredential result = await _fbAuth.createUserWithEmailAndPassword(
        email: email, password: password);
    return result.user.uid;
  }
}