import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart' hide User;
import 'package:news_app/Features/auth/domain/repo/auth_repo.dart';
import 'package:news_app/Features/auth/domain/entity/user.dart' show User;

class AuthRemoteDataSource implements AuthRepo {
  final FirebaseAuth firebaseAuth;
  final FirebaseFirestore firebaseFirestore;

  AuthRemoteDataSource(this.firebaseAuth, this.firebaseFirestore);

  @override
  Future<User> login(String email, String password) async {
    final result = await firebaseAuth.signInWithEmailAndPassword(
      email: email,
      password: password,
    );

    final user = result.user;
    if (user == null) {
      throw Exception("Login failed");
    }

    final doc = await firebaseFirestore
        .collection("users")
        .doc(user.uid)
        .get();

    final data = doc.data();

    return User(
      id: user.uid,
      email: email,
      name: data?["username"] ?? "",
    );
  }

  @override
  Future<User> register(String email, String password, String name) async {
    final result = await firebaseAuth.createUserWithEmailAndPassword(
      email: email,
      password: password,
    );

    final user = result.user;
    if (user == null) {
      throw Exception("Register failed");
    }

    await firebaseFirestore.collection("users").doc(user.uid).set({
      "username": name,
      "useremail": email,
    });

    return User(
      id: user.uid,
      email: email,
      name: name,
    );
  }
  
  @override
  Future<void> logout() async {
  await firebaseAuth.signOut();
  }
}