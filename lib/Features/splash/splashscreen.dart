import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:news_app/core/constant/app_color.dart';
import 'package:news_app/core/Themes/theme_provider.dart';
import 'package:news_app/core/routes/app_routes_named.dart';
import 'package:provider/provider.dart';

class Splashscreen extends StatelessWidget {
  const Splashscreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ZoomIn(
        duration: const Duration(seconds: 2),
        onFinish: (direction) {
          Navigator.pushNamed(context, AppRoutesNamed.login_screen);
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
