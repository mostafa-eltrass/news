import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AppThemeProvider extends ChangeNotifier {
  static const _kThemeKey = 'isDarkMode';
  bool _isDarkMode = false;
  bool get isDarkMode => _isDarkMode;

  AppThemeProvider() {
    _loadFromPrefs();
  }

  Future<void> _loadFromPrefs() async {
    final sp = await SharedPreferences.getInstance();
    _isDarkMode = sp.getBool(_kThemeKey) ?? false;
    notifyListeners();
  }

  Future<void> setDarkMode() async {
    _isDarkMode = true;
    final sp = await SharedPreferences.getInstance();
    await sp.setBool(_kThemeKey, true);
    notifyListeners();
  }

  Future<void> setLightMode() async {
    _isDarkMode = false;
    final sp = await SharedPreferences.getInstance();
    await sp.setBool(_kThemeKey, false);
    notifyListeners();
  }

  Future<void> toggle() async {
    _isDarkMode = !_isDarkMode;
    final sp = await SharedPreferences.getInstance();
    await sp.setBool(_kThemeKey, _isDarkMode);
    notifyListeners();
  }
}
