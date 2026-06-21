import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:news_app/Features/auth/presentation/cubit/auth_cubit/auth_cubit.dart';
import 'package:news_app/Features/news/presentation/cubits/home_cubit/home_cubit.dart';
import 'package:news_app/Features/profile/presentation/cubit/profile_cubit.dart';
import 'package:news_app/Features/saved/presentation/cubit/post_cubit/save_post/save_cubit.dart';
import 'package:news_app/Features/discovery/presentation/cubit/view_post/view_cubit.dart';
import 'package:news_app/Features/settings/cubit/setting_cubit.dart';
import 'package:news_app/core/DI/core_di/injection.dart';
import 'package:news_app/core/DI/features_di/auth_injector.dart';
import 'package:news_app/core/DI/features_di/news_injector.dart';
import 'package:news_app/core/DI/features_di/profile_injector.dart';
import 'package:news_app/core/Themes/app_theme.dart';
import 'package:news_app/core/Themes/theme_provider.dart';
import 'package:news_app/Features/settings/provider/app_setting_provider.dart';
import 'package:news_app/firebase_options.dart';
import 'package:provider/provider.dart';
import 'package:news_app/core/routes/app_routes.dart';
import 'package:news_app/core/routes/app_routes_named.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  await initCore();
  await intiAuthFeature();
  await initNewsFeature();
  await initProfileFeature();
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider<ThemeProvider>(
          create: (context) => ThemeProvider(),
        ),
        ChangeNotifierProvider<AppSettingProvider>(
          create: (context) => AppSettingProvider(),
        ),
        BlocProvider(create: (_) => UserCubit()),
        BlocProvider(create: (_) => getit<AuthCubit>()),
        BlocProvider(create: (_) => getit<HomeCubit>()..getSource()),
        BlocProvider(create: (_) => getit<ProfileCubit>()),
        BlocProvider(create: (_) => SavedPostsCubit()..getSavedPosts()),
        BlocProvider(create: (_) => ViewPostsCubit()),
        BlocProvider(create: (_) => SettingsCubit()),
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
