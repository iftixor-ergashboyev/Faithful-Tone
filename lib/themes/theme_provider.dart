import 'package:flutter/material.dart';
import 'package:player/themes/dark_mode.dart';
import 'package:player/themes/light_mode.dart';

class ThemeProvider extends ChangeNotifier {

  ThemeData _themeData =lightMode;

  ThemeData get themeData => _themeData;

  bool get isDarkMode => _themeData == darkMode;

  set themeData(ThemeData themData) {
    _themeData = themData;

    notifyListeners();
  }
  void toggleTheme() {
    if(_themeData == lightMode) {
      themeData = darkMode;
    } else {
      themeData = lightMode;
    }
  }
}