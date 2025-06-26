import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:qabilati/core/class/local_storage.dart';
import 'package:qabilati/core/theme/color_app.dart';

class ThemeApp {
  static ThemeData light = ThemeData(
    scaffoldBackgroundColor: ColorApp.white,
    appBarTheme: AppBarTheme(
      backgroundColor: ColorApp.white,
      iconTheme: IconThemeData(color: ColorApp.black),
      titleTextStyle: TextStyle(
        fontSize: 20.0.sp,
        fontWeight: FontWeight.bold,
        color: ColorApp.black,
      ),
    ),
    fontFamily: LocalStorageApp.getData("local") == "en" ? "inter" : "cairo",
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: ColorApp.greymiddle,
      selectedItemColor: ColorApp.coral,
      unselectedItemColor: ColorApp.black,
      selectedLabelStyle: TextStyle(fontSize: 12.0.sp),
      unselectedLabelStyle: TextStyle(fontSize: 12.0.sp),
    ),
    iconTheme: IconThemeData(color: ColorApp.black),
  );

  static ThemeData dark = ThemeData(
    scaffoldBackgroundColor: ColorApp.black,
    appBarTheme: AppBarTheme(
      backgroundColor: ColorApp.black,
      iconTheme: IconThemeData(color: ColorApp.white, size: 20.0),
      titleTextStyle: TextStyle(
        fontSize: 20.0.sp,
        fontWeight: FontWeight.bold,
        color: ColorApp.white,
      ),
    ),
    fontFamily: LocalStorageApp.getData("local") == "en" ? "inter" : "cairo",
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: ColorApp.black,
      selectedItemColor: ColorApp.coral,
      unselectedItemColor: ColorApp.white,
      selectedLabelStyle: TextStyle(fontSize: 12.0.sp),
      unselectedLabelStyle: TextStyle(fontSize: 12.0.sp),
    ),
    iconTheme: IconThemeData(color: ColorApp.white),
  );
}
