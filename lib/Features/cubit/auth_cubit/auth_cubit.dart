import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/Features/auth/repo/auth_repo.dart';
import 'package:news_app/Features/auth/repo/auth_repo_impl.dart';
import 'package:news_app/Features/cubit/auth_cubit/auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(AuthInitialState());
  final AuthRepo _authRepo = FirebaseAuthRepoImpl();
  void login({required String email, required String password}) async {
    emit(AuthLoadingState());
    try {
      await _authRepo.login(email, password);
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
      await _authRepo.register(email, password, name);

      emit(AuthSuccessState());
    } catch (e) {
      emit(AuthFailureState(e.toString()));
    }
  }
}
