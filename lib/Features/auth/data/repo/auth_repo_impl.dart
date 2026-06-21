import 'package:news_app/Features/auth/data/data_source/auth_data_source_impl.dart';
import 'package:news_app/Features/auth/domain/entity/user.dart';
import 'package:news_app/Features/auth/domain/repo/auth_repo.dart';
import 'package:news_app/Features/auth/data/data_source/local_data/auth_local_data_source.dart';

class AuthRepoImpl implements AuthRepo {
  final AuthRemoteDataSource remote;
  final AuthLocalDataSource local;

  AuthRepoImpl(this.remote, this.local);

  @override
  Future<User> login(String email, String password) async {
    final user = await remote.login(email, password);

    await local.Username(user.name);

    return user;
  }

  @override
  Future<User> register(String email, String password, String name) async {
    final user = await remote.register(email, password, name);

    await local.Username(user.name);

    return user;
  }

  Future<void> logout() async {
    await remote.logout();   
    await local.clearUser(); 
  }
}