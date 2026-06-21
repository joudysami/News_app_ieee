import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AppSettingProvider  extends ChangeNotifier{
  bool LoginCompleted = false;

  Future <void> completedLogin() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool("LoginCompleted", true);
    log("value is true");
    LoginCompleted =true;
    notifyListeners();
  }


 Future <void> getcompletedLogin() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final bool? LoginReadData= prefs.getBool("LoginCompleted");
    LoginCompleted=LoginReadData??false;
    notifyListeners();

  }
}