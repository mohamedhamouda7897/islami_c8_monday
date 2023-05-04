import 'package:flutter/material.dart';

class MyProvider extends ChangeNotifier {
  ThemeMode themeMode = ThemeMode.light;
  String languageCode = "en";

  void changeTheme(ThemeMode theme) {
    themeMode = theme;
    notifyListeners();
  }

  void changLanguage(String lang) {
    languageCode = lang;
    notifyListeners();
  }
}
