import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news_app/Features/cubit/auth_cubit/auth_cubit.dart';
import 'package:news_app/Features/cubit/home_cubit/home_cubit.dart';
import 'package:news_app/core/Themes/app_theme.dart';
import 'package:news_app/core/Themes/theme_provider.dart';
import 'package:news_app/firebase_options.dart';
import 'package:provider/provider.dart';
import 'package:news_app/core/routes/app_routes.dart';
import 'package:news_app/core/routes/app_routes_named.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(
    MultiProvider(
      providers: [ ChangeNotifierProvider<ThemeProvider>(
        create: (context) => ThemeProvider(),
      ),
        BlocProvider(create: (_) => AuthCubit()),
        BlocProvider(

      create: (_) => HomeCubit()..getSource(),
        )
        ],
     
        child: const MyApp(),
      ),
  
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(390, 884),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: AppTheme.lighttheme,
          darkTheme: AppTheme.darktheme,
          themeMode: context.watch<ThemeProvider>().thememode,
          initialRoute: AppRoutesNamed.splash_screen,
          onGenerateRoute: AppRoutes.onGenerateRoute,
        );
      },
    );
  }
}
