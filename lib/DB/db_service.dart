import 'package:cloud_firestore/cloud_firestore.dart';

import '../models/user.dart';

class DBService {
  var userCollection = FirebaseFirestore.instance.collection('users');
  saveUser(BUser user) async {
    try {
      await userCollection.doc(user.uid).set(user.toJson());
    } on FirebaseException catch (e) {}
  }
}