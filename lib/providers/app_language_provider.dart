import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AppLanguageProvider extends ChangeNotifier {
  static const _kLangKey = 'appLanguage';
  String _appLanguage = 'en'; // 'en' or 'ar'
  String get appLanguage => _appLanguage;

  AppLanguageProvider() {
    _loadFromPrefs();
  }

  Future<void> _loadFromPrefs() async {
    final sp = await SharedPreferences.getInstance();
    _appLanguage = sp.getString(_kLangKey) ?? 'en';
    notifyListeners();
  }

  Future<void> changeLanguage(String code) async {
    if (code != 'en' && code != 'ar') return;
    _appLanguage = code;
    final sp = await SharedPreferences.getInstance();
    await sp.setString(_kLangKey, code);
    notifyListeners();
  }

  Locale get locale => Locale(_appLanguage);
}
