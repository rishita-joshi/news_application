import 'package:flutter/material.dart';

class LightTheme {
  static ThemeData themeData = ThemeData(
    brightness: Brightness.light,
    primaryColor: Colors.deepOrange.shade600,
    bottomAppBarColor: Colors.white,
    scaffoldBackgroundColor: Colors.white,
    iconTheme: IconThemeData(color: Colors.grey),
    cardTheme: CardTheme(color: Colors.white, surfaceTintColor: Colors.white),
    // iconButtonTheme: IconButtonThemeData(style: ButtonStyle(backgroundColor: MaterialStatePropertyAll(Colors.grey))),
    //  colorScheme: ColorScheme(brightness: Brightness.light, primary: Colors.black, onPrimary: Colors.white, secondary: Colors.grey, ),
    textTheme: TextTheme(
      bodyLarge: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 20),
      bodySmall: TextStyle(color: Colors.grey, fontSize: 14),
      bodyMedium: TextStyle(color: Colors.grey, fontWeight: FontWeight.bold, fontSize: 16),
      titleLarge: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 14),
      titleMedium: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 16),
      titleSmall: TextStyle(color: Colors.black, fontSize: 20),
    ),
  );
}

class DarkTheme {
  static ThemeData themeData = ThemeData(
    brightness: Brightness.dark,
    primaryColor: Colors.deepOrange.shade600,
    primaryColorDark: Colors.black,
    splashColor: Colors.white,
    cardTheme: CardTheme(color: Colors.black26, surfaceTintColor: Colors.black26),
    // iconButtonTheme: IconButtonThemeData(style: ButtonStyle(backgroundColor: MaterialStatePropertyAll(Colors.white))),
    iconTheme: IconThemeData(color: Colors.white),

    // accentColor: Colors.lightBlueAccent,
    scaffoldBackgroundColor: Colors.grey[900],
    textTheme: TextTheme(
      bodyLarge: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 20),
      bodySmall: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 14),
      bodyMedium: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 14),
      titleLarge: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 14),
      titleMedium: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 16),
      titleSmall: TextStyle(color: Colors.black, fontSize: 20),
      // Add more text styles as needed
    ),
    // Define more properties for the dark theme
  );
}
