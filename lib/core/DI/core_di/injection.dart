import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

final getit =GetIt.instance;

Future<void> initCore() async {
  final prefs = await SharedPreferences.getInstance();
  getit.registerLazySingleton(() => prefs);
  getit.registerLazySingleton(() => FirebaseFirestore.instance);
  getit.registerLazySingleton(() => FirebaseAuth.instance);
}