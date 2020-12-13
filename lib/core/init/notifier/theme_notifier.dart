import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:templeteproject/core/constants/enums/app_theme_enum.dart';
import 'package:templeteproject/core/init/theme/app_theme_light.dart';

class ThemeNotifier extends ChangeNotifier {
  int value = 5;

  ThemeData _currentTheme = AppThemeLight.instance.theme;

  ThemeData get currentTheme => AppThemeLight.instance.theme;

  void changeValue(AppTheme theme) {
    if (theme == AppTheme.LIGHT) {
      _currentTheme = ThemeData.light();
    } else {
      _currentTheme = ThemeData.dark();
    }
    notifyListeners();
  }
}
