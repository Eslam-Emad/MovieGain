import 'package:flutter/material.dart';

ThemeData get theme {
  return ThemeData(
    backgroundColor: const Color(0xffF4F4F4),
    scaffoldBackgroundColor: const Color(0xffF4F4F4),
    colorScheme: const ColorScheme(
      primary: Color(0xff14463D),
      primaryContainer: Colors.white,
      secondary: Color(0xFF7BD545),
      secondaryContainer: Color(0xFFEAF3E4),
      surface: Color(0xffFFFFFF),
      background: Color(0xffFFFFFF),
      error: Color(0xffB00020),
      onPrimary: Color(0xff1e1e29),
      onSecondary: Color(0xFFF6F5F8),
      onSurface: Color(0xff000000),
      onBackground: Color(0xff000000),
      onError: Color(0xffB00020),
      brightness: Brightness.light,
      onTertiary: Color(0xffF4AA2B),
    ),
    appBarTheme: const AppBarTheme(
      centerTitle: true,
      elevation: 0.0,
      backgroundColor: Color(0xffF4F4F4),
      titleTextStyle: TextStyle(
          color: Color(0xff14463D),
          fontWeight: FontWeight.w700,
          fontSize: 20.0,
          fontFamily: "Euclid-Light"),
      iconTheme: IconThemeData(
        color: Color((0xff14463D)),
      ),
      actionsIconTheme: IconThemeData(
        color: Color(0xff14463D),
      ),
    ),
    toggleableActiveColor: const Color(0xff14463D).withOpacity(0.8),
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      elevation: 0.0,
      backgroundColor: Color(0xffFFFFFF),
      enableFeedback: true,
      showSelectedLabels: true,
      showUnselectedLabels: true,
      selectedLabelStyle: TextStyle(fontSize: 12.0),
      selectedIconTheme: IconThemeData(color: Color(0xff14463D)),
    ),
    textTheme: TextTheme(
      button:
          const TextStyle(color: Color(0xff14463D), fontFamily: "Euclid-Light"),
      overline: TextStyle(
          color: Colors.grey[700],
          fontWeight: FontWeight.w700,
          fontSize: 10.0,
          fontFamily: "Euclid-Light"),
      bodyText1: const TextStyle(
          color: Color(0xff14463D),
          fontWeight: FontWeight.w700,
          fontSize: 15.0,
          fontFamily: "Euclid-Light"),
      bodyText2: const TextStyle(
          fontWeight: FontWeight.w500,
          color: Color(0xff14463D),
          fontSize: 14.0,
          fontFamily: "Euclid-Light"),
      headline1: const TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 50.0,
          color: Color(0xff14463D),
          fontFamily: "Euclid-Light"),
      headline2: const TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 40.0,
          color: Color(0xff14463D),
          fontFamily: "Euclid-Light"),
      headline5:
          const TextStyle(color: Color(0xff14463D), fontFamily: "Euclid-Light"),
      headline6: const TextStyle(
          color: Color(0xff14463D), fontSize: 16.0, fontFamily: "Euclid-Light"),
      subtitle1: const TextStyle(
          fontSize: 14.0, color: Color(0xff14463D), fontFamily: "Euclid-Light"),
      subtitle2:  TextStyle(
          fontSize: 12.0, color: Colors.grey[400], fontFamily: "Euclid-Light"),
    ),
    floatingActionButtonTheme: FloatingActionButtonThemeData(
      backgroundColor: const Color(0xFF7BD545),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.0)),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16.0),
        ),
        padding: const EdgeInsets.all(16.0),
        primary: const Color(0xFF7BD545).withOpacity(0.8),
      ),
    ),
    outlinedButtonTheme: OutlinedButtonThemeData(
      style: OutlinedButton.styleFrom(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16.0),
        ),
        padding: const EdgeInsets.all(16.0),
        primary: const Color(0xFF7BD545).withOpacity(0.8),
      ),
    ),
  );
}
