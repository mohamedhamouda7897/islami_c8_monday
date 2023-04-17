import 'package:flutter/material.dart';

class MyThemeData {
  static const Color lightColor = Color(0xFFB7935F);
  static ThemeData lightTheme = ThemeData(
      scaffoldBackgroundColor: Colors.transparent,
      primaryColor: lightColor,
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        backgroundColor: lightColor,
        type: BottomNavigationBarType.fixed,
        selectedItemColor: Colors.black,
        unselectedItemColor: Colors.white,
      ),
      textTheme: TextTheme(
        bodySmall: TextStyle(
            fontSize: 20, fontWeight: FontWeight.w600, color: lightColor),
        bodyMedium: TextStyle(
            fontSize: 25, fontWeight: FontWeight.bold, color: lightColor),
        bodyLarge: TextStyle(
            fontSize: 30, fontWeight: FontWeight.bold, color: Colors.black),
      ),
      appBarTheme: AppBarTheme(
          iconTheme: IconThemeData(color: lightColor, size: 35),
          backgroundColor: Colors.transparent,
          elevation: 0.0,
          centerTitle: true));
  static ThemeData darkTheme = ThemeData();
}
