import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class ThemeProvider extends ChangeNotifier {
  ThemeMode _thememode = ThemeMode.dark;
  ThemeMode get thememode => _thememode;

  void toggleTheme() {
    if (thememode == ThemeMode.light) {
      _thememode = ThemeMode.dark;
    } else {
      _thememode = ThemeMode.light;
    }
    notifyListeners();
  }
}
