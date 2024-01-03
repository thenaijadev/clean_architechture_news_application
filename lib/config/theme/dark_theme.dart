import 'package:flutter/material.dart';

ThemeData darkTheme() {
  return ThemeData(
    scaffoldBackgroundColor: const Color.fromARGB(255, 0, 0, 0),
    fontFamily: "Multi",
    colorScheme: const ColorScheme.dark(
      brightness: Brightness.dark,
      background: Colors.black,
      primary: Colors.white,
    ),
    appBarTheme: const AppBarTheme(
      backgroundColor: Colors.black,
      elevation: 0,
      // color: Colors.white,
      centerTitle: true,
      iconTheme: IconThemeData(color: Colors.grey),
      titleTextStyle:
          TextStyle(color: Color.fromARGB(255, 255, 255, 255), fontSize: 18),
    ),
  );
}
