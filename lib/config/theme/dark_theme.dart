import 'package:flutter/material.dart';

ThemeData darkTheme() {
  return ThemeData(
    scaffoldBackgroundColor: Colors.white,
    fontFamily: "Multi",
    appBarTheme: const AppBarTheme(
        color: Colors.white,
        elevation: 0,
        centerTitle: true,
        iconTheme: IconThemeData(color: Colors.grey),
        titleTextStyle: TextStyle(color: Colors.grey, fontSize: 18)),
  );
}
