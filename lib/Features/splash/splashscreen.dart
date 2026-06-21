import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:news_app/core/constant/app_color.dart';
import 'package:news_app/core/Themes/theme_provider.dart';
import 'package:news_app/Features/settings/provider/app_setting_provider.dart';
import 'package:news_app/core/routes/app_routes_named.dart';
import 'package:provider/provider.dart';

class Splashscreen extends StatefulWidget {
  const Splashscreen({super.key});

  @override
  State<Splashscreen> createState() => _SplashscreenState();
}

class _SplashscreenState extends State<Splashscreen> {
 late final AppSettingProvider _appSettingProvider;
 @override
  void initState() {
    super.initState();
    _appSettingProvider = context.read<AppSettingProvider>();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await _appSettingProvider.getcompletedLogin();
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ZoomIn(
        duration: const Duration(seconds: 2),
        onFinish: (direction) {
          if(_appSettingProvider.LoginCompleted){
          Navigator.pushNamed(context, AppRoutesNamed.Home_screen);}
          else{
            Navigator.pushNamed(context,AppRoutesNamed.login_screen);

          }
        },
        child: Center(
          child: Image.asset(
            'assets/images/news_logo.png',
            color: context.read<ThemeProvider>().thememode == ThemeMode.light
                ? AppColor.black
                : AppColor.white,
          ),
        ),
      ),
    );
  }
}
