import 'package:crypto_currency/core/constants.dart';
import 'package:flutter/material.dart';

class Themes {

  static ThemeData lightTheme = ThemeData(textTheme: TextTheme(headline1: TextStyle(color: Colors.black),
    headline2: TextStyle(color: Colors.black,fontWeight: FontWeight.bold),
    bodyText1: TextStyle(color: Colors.black,fontWeight: FontWeight.bold),
    bodyText2: TextStyle(color: Colors.black,fontWeight: FontWeight.bold),

  ),bottomAppBarColor: Colors.white,
    primarySwatch: Colors.green,
    appBarTheme: AppBarTheme(
      titleTextStyle: TextStyle(color: Colors.black, fontSize: 20,
          fontWeight: FontWeight.bold),
      color: Colors.white,
      elevation: 0,
    ),
    brightness: Brightness.light,
    scaffoldBackgroundColor: Color(0xfff3f5ed),
  );


  static ThemeData darkTheme = ThemeData(
    primarySwatch: Colors.green,
    brightness: Brightness.dark,
    appBarTheme: AppBarTheme(
        color: Colors.black,
        elevation: 0,
    ),
    scaffoldBackgroundColor: Colors.black,


  );


  static bool isDarkMode(BuildContext context) {
    //used in if statements to determine colors of widgets and containers
    return Theme
        .of(context)
        .brightness == Brightness.dark;
  }

  static Color checkAndSetTileColor(context){
    return Themes.isDarkMode(context)
        ? listColor
        : Colors.white;
  }

  static Color checkAndSetButtonColor(context){
    return Themes.isDarkMode(context)? listColor:Colors.blueGrey;
  }


}