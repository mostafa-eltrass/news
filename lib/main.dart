import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:news/providers/app_theme_provider.dart';
import 'package:news/providers/app_language_provider.dart';
import 'package:news/gen_l10n/app_localizations.dart';
import 'package:news/ui/home/home_screen.dart'; // استبدل بمسار شاشتك

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => AppThemeProvider()),
        ChangeNotifierProvider(create: (_) => AppLanguageProvider()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return Consumer2<AppThemeProvider, AppLanguageProvider>(
      builder: (context, themeProvider, languageProvider, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'News App',
          localizationsDelegates: AppLocalizations.localizationsDelegates,
          supportedLocales: AppLocalizations.supportedLocales,
          locale: languageProvider.locale,
          theme: ThemeData.light(), // أو AppTheme.lightTheme
          darkTheme: ThemeData.dark(), // أو AppTheme.darkTheme
          themeMode: themeProvider.isDarkMode ? ThemeMode.dark : ThemeMode.light,
          home: const HomeScreen(),
        );
      },
    );
  }
}
