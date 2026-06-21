import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:news_app/Features/auth/data/data_source/auth_data_source_impl.dart';
import 'package:news_app/Features/auth/data/data_source/local_data/auth_local_data_source.dart';
import 'package:news_app/Features/auth/data/repo/auth_repo_impl.dart';
import 'package:news_app/Features/auth/domain/repo/auth_repo.dart';
import 'package:news_app/Features/auth/presentation/cubit/auth_cubit/auth_cubit.dart';
import 'package:news_app/core/DI/core_di/injection.dart';

Future<void> intiAuthFeature() async {
  getit.registerLazySingleton<AuthRemoteDataSource>(
    () => AuthRemoteDataSource(
      getit<FirebaseAuth>(),
      getit<FirebaseFirestore>(),
    ),
  );

  getit.registerLazySingleton<AuthLocalDataSource>(() => AuthLocalDataSource(
        getit<SharedPreferences>(),
      ));

  getit.registerLazySingleton<AuthRepo>(
    () => AuthRepoImpl(
      getit<AuthRemoteDataSource>(),
      getit<AuthLocalDataSource>(),
      ),
  );

  getit.registerFactory(() => AuthCubit(
        getit<AuthRepo>(),
      ));
}
