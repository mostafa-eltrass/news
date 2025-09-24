import 'package:flutter/material.dart';
import 'package:news/gen_l10n/app_localizations.dart';
import 'package:news/utils/app_colors.dart';
import 'package:news/utils/assets_manager.dart';
import 'package:provider/provider.dart';
import 'package:news/providers/app_theme_provider.dart';
import 'package:news/providers/app_language_provider.dart';
 typedef OnRrowerItemClick = void Function();
class AppDrawer extends StatelessWidget {
  VoidCallback onRrowerItemClick;
    AppDrawer({super.key,required this.onRrowerItemClick});

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<AppThemeProvider>(context);
    final languageProvider = Provider.of<AppLanguageProvider>(context);

    final isDark = themeProvider.isDarkMode;
    final headerBg = isDark ? Colors.grey[900] : Colors.white;
    final iconColor = isDark ? Colors.white : Colors.black;
    final local = AppLocalizations.of(context);

    return Drawer(
      child: Column(
        children: [
          Container(
            color: AppColors.whiteColor,
            width: double.infinity,
            padding: const EdgeInsets.symmetric(vertical: 50),
            child: Center(
              child: Text(
                local?.appTitle ?? 'News App', // لو عندك مفتاح في l10n استخدمه
                style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                      fontWeight: FontWeight.bold,
                      color:  AppColors.blackColor,
                    ),
              ),
            ),
          ),
          Expanded(
            child: Container(
              color: isDark ? Colors.black : Colors.white,
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  InkWell(
                    onTap: (){
               onRrowerItemClick();
                    },
                    child: Row(
                      children: [
                        Icon(Icons.home, color: iconColor),
                        const SizedBox(width: 8),
                        Text(local!.goToHome,
                            style: Theme.of(context)
                                .textTheme
                                .bodyLarge
                                ?.copyWith(color: iconColor)),
                      ],
                    ),
                  ),

                  const SizedBox(height: 8),
                  Divider(color: iconColor.withOpacity(0.3)),
                  const SizedBox(height: 8),

                  // Theme
                  Row(
                    children: [
                      ImageIcon(AssetImage(AssetsManager.themeIcon), color: iconColor),
                      const SizedBox(width: 8),
                      Text(local.theme,
                          style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                                fontWeight: FontWeight.bold,
                                color: iconColor,
                              )),
                    ],
                  ),
                  const SizedBox(height: 8),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 12),
                    decoration: BoxDecoration(
                      border: Border.all(color: isDark ? Colors.white54 : Colors.black54),
                      borderRadius: BorderRadius.circular(8),
                      color: isDark ? Colors.grey[850] : Colors.transparent,
                    ),
                    child: DropdownButton<String>(
                      dropdownColor: isDark ? Colors.grey[900] : Colors.white,
                      value: isDark ? 'dark' : 'light',
                      style: TextStyle(color: iconColor),
                      underline: const SizedBox(),
                      isExpanded: true,
                      onChanged: (value) async {
                        if (value == null) return;
                        if (value == 'dark') {
                          await themeProvider.setDarkMode();
                        } else {
                          await themeProvider.setLightMode();
                        }
                      },
                      items: [
                        DropdownMenuItem(value: 'light', child: Text(local.light)),
                        DropdownMenuItem(value: 'dark', child: Text(local.dark)),
                      ],
                    ),
                  ),
                  const SizedBox(height: 8),
                  Divider(color: iconColor.withOpacity(0.3)),
                  const SizedBox(height: 8),

                  // Language
                  Row(
                    children: [
                      ImageIcon(AssetImage(AssetsManager.languageIcon), color: iconColor),
                      const SizedBox(width: 8),
                      Text(local.language,
                          style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                                fontWeight: FontWeight.bold,
                                color: iconColor,
                              )),
                    ],
                  ),
                  const SizedBox(height: 8),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 12),
                    decoration: BoxDecoration(
                      border: Border.all(color: isDark ? Colors.white54 : Colors.black54),
                      borderRadius: BorderRadius.circular(8),
                      color: isDark ? Colors.grey[850] : Colors.transparent,
                    ),
                    child: DropdownButton<String>(
                      dropdownColor: isDark ? Colors.grey[900] : Colors.white,
                      value: languageProvider.appLanguage,
                      style: TextStyle(color: iconColor),
                      underline: const SizedBox(),
                      isExpanded: true,
                      onChanged: (value) async {
                        if (value == null) return;
                        await languageProvider.changeLanguage(value);
                      },
                      items: [
                        DropdownMenuItem(value: 'en', child: Text(local.english)),
                        DropdownMenuItem(value: 'ar', child: Text(local.arabic)),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
