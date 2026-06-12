import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/Features/auth/ui/screens/Home_screen.dart';
import 'package:news_app/Features/auth/ui/screens/News_screen.dart';
import 'package:news_app/Features/auth/ui/screens/login_screen.dart';
import 'package:news_app/Features/auth/ui/screens/register_screen.dart';
import 'package:news_app/Features/cubit/auth_cubit/auth_cubit.dart';
import 'package:news_app/Features/cubit/home_cubit/home_cubit.dart';
import 'package:news_app/Features/splash/splashscreen.dart';
import 'package:news_app/core/routes/app_routes_named.dart';

class AppRoutes {
  static Route<dynamic>? onGenerateRoute(RouteSettings Settings) {
    switch (Settings.name) {
      case AppRoutesNamed.splash_screen:
        return MaterialPageRoute(
          builder: (context) {
            return const Splashscreen();
          },
        );

      case AppRoutesNamed.login_screen:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => AuthCubit(),
            child: const LoginScreen(),
          ),
        );

      case AppRoutesNamed.register_screen:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => AuthCubit(),
            child: const RegisterScreen(),
          ),
        );

      case AppRoutesNamed.Home_screen:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => HomeCubit(),
            child: const HomeScreen(),
          ),
        );
       case AppRoutesNamed.News_screen:
      final homecubit= Settings.arguments  as HomeCubit;
        return MaterialPageRoute(
          builder: (context) {
            return BlocProvider.value(
              value: homecubit,
              child: const NewsScreen(),
            );
          },
        );
      default:
        return MaterialPageRoute(
          builder: (context) {
            return Container();
          },
        );
    }
  }
}
