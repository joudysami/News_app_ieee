import 'package:news_app/Features/auth/domain/entity/user.dart' show User;

abstract class AuthRepo {
  Future<User> login(String email, String password);

  Future<User> register(String email, String password, String name);
   Future<void> logout();
}
