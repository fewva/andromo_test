import 'package:flutter/material.dart';

class AppTheme {
  AppTheme._();
  static ThemeData darkTheme = ThemeData.light().copyWith(
    scaffoldBackgroundColor: Colors.black54,
    textTheme: const TextTheme(
      bodyText1: TextStyle(color: Colors.white),
      bodyText2: TextStyle(color: Colors.white),
    ),
    appBarTheme: const AppBarTheme(
      elevation: 5,
      centerTitle: true,
      backgroundColor: Colors.black54,
      titleTextStyle: TextStyle(
        fontSize: 28,
        color: Colors.white,
        fontWeight: FontWeight.w400,
      ),
      iconTheme: IconThemeData(color: Colors.white),
    ),
    colorScheme: const ColorScheme.dark(primary: Colors.yellow),
  );

  static ThemeData get lightTheme => darkTheme;
}
