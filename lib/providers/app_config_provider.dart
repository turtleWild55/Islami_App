import 'package:flutter/material.dart';

class AppConfigProvider extends ChangeNotifier {
  String lang = 'ar';
  ThemeMode appTheme = ThemeMode.light;

  void checkLanguage(String settedLanguage) {
    if (lang != settedLanguage) {
      lang = settedLanguage;
    }
    notifyListeners();
  }

  void changeTheme(ThemeMode settedTheme) {
    if (appTheme != settedTheme) {
      appTheme = settedTheme;
    }
    notifyListeners();
  }

  bool isLight() {
    return appTheme == ThemeMode.light;
  }
}
