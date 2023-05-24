import 'package:booking_gym/DB/db_service.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../models/user.dart';

class AuthServices {
  final _auth = FirebaseAuth.instance;

  User get currentUser => FirebaseAuth.instance.currentUser!;
  Stream<User?> get onChangeUser => _auth.authStateChanges();

  Future<bool> signIn(String email, String password) async {
    try {
      await _auth.signInWithEmailAndPassword(email: email, password: password);
      return true;
    } on FirebaseException catch (e) {
      return false;
    }
  }

  signUp(String email, String password, String username) async {
    try {
      await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      DBService()
          .saveUser(BUser(email: email, name: username, uid: currentUser.uid));
      return true;
    } on FirebaseException catch (e) {
      return false;
    }
  }

  signOut() async {
    try {
      await _auth.signOut();
      return true;
    } on FirebaseException catch (e) {
      return false;
    }
  }
}