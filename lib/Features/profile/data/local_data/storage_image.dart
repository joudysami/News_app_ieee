import 'package:shared_preferences/shared_preferences.dart';

class ProfileLocalService {
  static const String imageKey = "profile_image";

  Future<void> saveImagePath(String path) async {
    final prefs = await SharedPreferences.getInstance();

    await prefs.setString(
      imageKey,
      path,
    );
  }

  Future<String?> getImagePath() async {
    final prefs = await SharedPreferences.getInstance();

    return prefs.getString(imageKey);
  }
}