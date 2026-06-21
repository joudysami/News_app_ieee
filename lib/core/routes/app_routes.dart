import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/Features/news/presentation/screens/Home_screen.dart';
import 'package:news_app/Features/news/presentation/screens/News_screen.dart';
import 'package:news_app/Features/discovery/presentation/screen/discovery_screen.dart';
import 'package:news_app/Features/auth/presentation/screen/login_screen.dart';
import 'package:news_app/Features/profile/presentation/cubit/profile_cubit.dart';
import 'package:news_app/Features/profile/presentation/screens/profile_screen.dart';
import 'package:news_app/Features/auth/presentation/screen/register_screen.dart';
import 'package:news_app/Features/saved/presentation/screens/saved_screen.dart';
import 'package:news_app/Features/auth/presentation/cubit/auth_cubit/auth_cubit.dart';
import 'package:news_app/Features/news/presentation/cubits/home_cubit/home_cubit.dart';
import 'package:news_app/Features/discovery/presentation/cubit/view_post/view_cubit.dart';
import 'package:news_app/Features/splash/splashscreen.dart';
import 'package:news_app/core/DI/core_di/injection.dart';
import 'package:news_app/core/routes/app_routes_named.dart';

class AppRoutes {
  static Route<dynamic>? onGenerateRoute(RouteSettings Settings) {
    switch (Settings.name) {
      case AppRoutesNamed.splash_screen:
        return MaterialPageRoute(
          builder: (context) {
            return  Splashscreen();
          },
        );

      case AppRoutesNamed.login_screen:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => getit<AuthCubit>(),
            child:  LoginScreen(),
          ),
        );

      case AppRoutesNamed.register_screen:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => getit<AuthCubit>(),
            child:  RegisterScreen(),
          ),
        );

      case AppRoutesNamed.Home_screen:
        return MaterialPageRoute(
           builder: (_) => MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => getit<HomeCubit>()..getSource()),
        BlocProvider(create: (_) => UserCubit()),
        BlocProvider(create: (_) => getit<ProfileCubit>()),
      ],
      child: HomeScreen(),
          ),
        );
     case AppRoutesNamed.News_screen:
       // final args = Settings.arguments as Map<String, dynamic>?;
        return MaterialPageRoute(
         builder: (_) => BlocProvider(
    create: (_) => getit<HomeCubit>()..getSource(),

      
      //  child: ViewNews (
      //      title: args?['title'] ?? '',
      //      description: args?['description'] ?? '',
      //      content: args?['content'] ?? '',
      //      imageurl: args?['imageurl'] ?? '',
      //      publishedAt: args?['publishedAt'] ?? '',
      //      category: args?['category'] ?? '',
      //      author: args?['author'] ?? '',
      //    ),
         child:  NewsScreen(),
          ),
        );
         case AppRoutesNamed.discovery_screen:
        return MaterialPageRoute(
          builder: (context) {
            return BlocProvider(
               create: (_) => ViewPostsCubit()..getViewPosts(),
              child:  DiscoveryScreen());
          },
        );
         case AppRoutesNamed.saved_screen:
        return MaterialPageRoute(
          builder: (context) {
            return  SavedScreen();
          },
        );
         case AppRoutesNamed.profile_screen:
        return MaterialPageRoute(
          builder: (context) {
            return MultiBlocProvider(
              providers: [
                BlocProvider(create: (_) => getit<AuthCubit>()),
                BlocProvider(create: (_)=> getit<ProfileCubit>()),
              ],
              child: ProfileScreen(),
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
