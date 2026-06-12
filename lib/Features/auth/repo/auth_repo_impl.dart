import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:news_app/Features/auth/repo/auth_repo.dart';

class FirebaseAuthRepoImpl implements AuthRepo {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;
  @override
  Future<void> login(String email, String password) {
    try {
      return _firebaseAuth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  @override
  Future<void> register(String email, String password, String name) async {
    try {
      final Newuser = await _firebaseAuth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      final userid = Newuser.user?.uid ?? "";
      await _firebaseFirestore.collection("user").doc(userid).set({
        "useremail": email,
        "username": name,
        "userID": userid,
      });
    } catch (e) {
      throw Exception(e.toString());
    }
  }
}
