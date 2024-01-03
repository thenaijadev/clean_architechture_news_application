import 'package:flutter/material.dart';

ThemeData lightTheme() {
  return ThemeData(
    scaffoldBackgroundColor: Colors.white,
    fontFamily: "Multi",
    colorScheme: const ColorScheme.light(
        brightness: Brightness.light,
        primary: Colors.black,
        secondary: Colors.white),
    appBarTheme: const AppBarTheme(
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        iconTheme: IconThemeData(color: Colors.grey),
        titleTextStyle: TextStyle(color: Colors.grey, fontSize: 18)),
  );
}
