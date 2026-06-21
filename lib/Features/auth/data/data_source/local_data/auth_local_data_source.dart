import 'package:shared_preferences/shared_preferences.dart';

class AuthLocalDataSource {
  final SharedPreferences prefs;

  AuthLocalDataSource(this.prefs);

  Future<void> Username(String name) async {
    await prefs.setString("username", name);
  }

  String? getUsername() {
    return prefs.getString("username");
  }
  Future<void> clearUser() async {
    await prefs.remove("username"); 
  }
}