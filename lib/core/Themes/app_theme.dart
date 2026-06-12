import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news_app/core/constant/app_color.dart';

class AppTheme {
  AppTheme._();

  static final lighttheme = ThemeData(
    primaryColor: AppColor.white,
    scaffoldBackgroundColor: AppColor.white,
    appBarTheme: AppBarTheme(backgroundColor: AppColor.white),
    textTheme: TextTheme(
      bodyMedium: TextStyle(color: AppColor.grey, fontSize: 16),
      bodyLarge: TextStyle(
        color: AppColor.black,
        fontSize: 32,
        fontWeight: FontWeight.bold,
      ),
      titleLarge: TextStyle(
        color: AppColor.black,
        fontSize: 24,
        fontWeight: FontWeight.w500,
      ),
      titleMedium: TextStyle(
        color: AppColor.black,
        fontSize: 18,
        fontWeight: FontWeight.w500,
      ),
      titleSmall: TextStyle(
        color: AppColor.black,
        fontSize: 12.sp,
        fontWeight: FontWeight.w500,
      ),
    ),
    brightness: Brightness.light,
    textSelectionTheme: TextSelectionThemeData(
      cursorColor: Colors.white, // Sets the global cursor color
      selectionColor: AppColor.blue, // Sets the text selection background color
      selectionHandleColor: AppColor.grey,
    ),
    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: Color(0xfff404752),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(6.r),
        borderSide: BorderSide(color: AppColor.babygrey, width: 1.w),
      ),

      outlineBorder: BorderSide(color: AppColor.babygrey, width: 1.w),

      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(6.r),
        borderSide: BorderSide(color: Colors.red, width: 1.w),
      ),

      disabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(6.r),
        borderSide: BorderSide(color: AppColor.blue, width: 1.w),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(6.r),
        borderSide: BorderSide(color: AppColor.blue, width: 1.w),
      ),
    ),
  );

  static final darktheme = ThemeData(
    primaryColor: AppColor.black,
    scaffoldBackgroundColor: AppColor.black,
    appBarTheme: AppBarTheme(backgroundColor: AppColor.black),
    textTheme: TextTheme(
      bodyMedium: TextStyle(color: AppColor.grey, fontSize: 16),
      bodyLarge: TextStyle(
        color: AppColor.white,
        fontSize: 32,
        fontFamily: "Inter",
      ),
      titleLarge: TextStyle(
        color: AppColor.white,
        fontSize: 24,
        fontWeight: FontWeight.w500,
      ),
      bodySmall: TextStyle(color: AppColor.white, fontSize: 12.sp),
      titleMedium: TextStyle(
        color: AppColor.white,
        fontWeight: FontWeight.w500,
      ),
    ),
    brightness: Brightness.dark,
    textSelectionTheme: TextSelectionThemeData(
      cursorColor: Colors.white, // Sets the global cursor color
      selectionColor: AppColor.blue, // Sets the text selection background color
      selectionHandleColor: AppColor.grey,
    ),
    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: Color(0xfff404752),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(6.r),
        borderSide: BorderSide(color: AppColor.babygrey, width: 1.w),
      ),

      outlineBorder: BorderSide(color: AppColor.babygrey, width: 1.w),

      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(6.r),
        borderSide: BorderSide(color: Colors.red, width: 1.w),
      ),

      disabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(6.r),
        borderSide: BorderSide(color: AppColor.blue, width: 1.w),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(6.r),
        borderSide: BorderSide(color: AppColor.blue, width: 1.w),
      ),
    ),
  );
}
