import 'package:flutter/material.dart';
import 'package:news_app/api/http_config.dart';
import 'package:news_app/model/news_details_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../utils/theme_data.dart';

class BasicProvider extends ChangeNotifier {
  List<Article> articleList = [];
  List<Article> bookMarkList = [];
  bool isdark = false;

  getArticleList() async {
    articleList = await HttpConfig().getArticle();
    print("=== list length>${articleList.length}");
    notifyListeners();
  }

  addToBookMarkList(Article articleModel) {
    if (bookMarkList.contains(articleModel)) {
      bookMarkList.remove(articleModel);
    } else {
      bookMarkList.add(articleModel);
    }
    notifyListeners();
  }

  // void toggleTheme() {
  //   if (isDarkTheme) {
  //     isDarkTheme = false;
  //   } else {
  //     isDarkTheme = true;
  //   }
  //   //  isDarkTheme != isDarkTheme;
  //   // _currentTheme = _currentTheme == LightTheme.themeData ? DarkTheme.themeData : LightTheme.themeData;

  //   // isDarkTheme = _currentTheme == LightTheme.themeData ? false : true;
  //   notifyListeners();
  // }

  ThemeData dark = ThemeData.dark().copyWith(
    brightness: Brightness.dark,
    primaryColor: Colors.deepOrange.shade600,
    primaryColorDark: Colors.black,
    splashColor: Colors.white,
    cardTheme: CardTheme(color: Colors.black26, surfaceTintColor: Colors.black26),
    iconTheme: IconThemeData(color: Colors.white),
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
  );

  ThemeData selectedTheme = ThemeData.light().copyWith(
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

  ThemeData light = ThemeData.light().copyWith(
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

  Future<void> swapTheme() async {
    var prefs = await SharedPreferences.getInstance();

    if (selectedTheme == dark) {
      isdark = false;
      selectedTheme = light;
      prefs.setBool("darkTheme", false);
    } else {
      isdark = true;
      selectedTheme = dark;
      prefs.setBool("darkTheme", true);
    }

    notifyListeners();
  }

  ThemeData getTheme(bool isDark) {
    if (isdark) {
      selectedTheme = dark;
    } else {
      selectedTheme = light;
    }
    return selectedTheme;
  }
}
