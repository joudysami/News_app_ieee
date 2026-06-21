import 'dart:developer';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/Features/auth/domain/repo/auth_repo.dart';
import 'package:news_app/Features/auth/presentation/cubit/auth_cubit/auth_state.dart';
import 'package:shared_preferences/shared_preferences.dart';
class AuthCubit extends Cubit<AuthState> {
  final AuthRepo authRepo;

  AuthCubit(this.authRepo) : super(AuthInitialState());

  Future<void> login({
    required String email,
    required String password,
  }) async {
    emit(AuthLoadingState());

    try {
      await authRepo.login(email, password);
      emit(AuthSuccessState());
      log("login success");
    } catch (e) {
      emit(AuthFailureState(e.toString()));
    }
  }

  Future<void> register({
    required String email,
    required String password,
    required String name,
  }) async {
    emit(AuthLoadingState());

    try {
      await authRepo.register(email, password, name);
      emit(AuthSuccessState());
    } catch (e) {
      emit(AuthFailureState(e.toString()));
    }
  }
  Future<void> logout() async {
  emit(AuthLoadingState());

  try {
    await authRepo.logout();
    emit(AuthInitialState()); 
    log("logout success");
  } catch (e) {
    emit(AuthFailureState(e.toString()));
  }
}
}


class UserCubit extends Cubit<String?> {
  UserCubit() : super(null);

  Future<void> loadUserName() async {
    final prefs = await SharedPreferences.getInstance();
    emit(prefs.getString("username"));
  }
}