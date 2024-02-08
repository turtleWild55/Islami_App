import 'package:flutter/material.dart';

class Themes {
  static Color blackColor = Color(0xff242424);
  static Color primColor = Color(0xffB7935F);
  static Color darkBlue = Color(0xff141A2E);
  static Color yellow = Color(0xffFACC1D);
  static Color white = Color(0xffF8F8F8);

  static ThemeData MyTheme = ThemeData(
    primaryColor: primColor,
    scaffoldBackgroundColor: Colors.transparent,
    appBarTheme: AppBarTheme(
      iconTheme: IconThemeData(color: blackColor),
      centerTitle: true,
      backgroundColor: Colors.transparent,
      elevation: 0,
    ),
    textTheme: TextTheme(
        titleLarge: TextStyle(
            fontSize: 30,
            color: Themes.blackColor,
            fontWeight: FontWeight.bold)),
  );

  static ThemeData darkTheme = ThemeData(
      primaryColor: darkBlue,
      scaffoldBackgroundColor: Colors.transparent,
      appBarTheme: AppBarTheme(
        iconTheme: IconThemeData(color: yellow),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      textTheme: TextTheme(
          titleLarge: TextStyle(
              fontSize: 30, color: Themes.white, fontWeight: FontWeight.bold)));
}
