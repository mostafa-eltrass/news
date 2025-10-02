import 'package:flutter/material.dart';
import 'package:news/gen_l10n/app_localizations.dart';
import 'package:news/model/category.dart';
import 'package:news/ui/home/app_drawer.dart';
import 'package:news/ui/home/category_details/category_details.dart';
import 'package:news/ui/home/category_fragment/category_fragment.dart';
import 'package:news/utils/assets_manager.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  newCategory? selectedCategory; // ✨ هنا حطيت الـ state variable في مكانه الصح

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      drawer: AppDrawer(onRrowerItemClick: onDrawerItemClick), // ✅ Drawer

      appBar: AppBar(
        centerTitle: true,
        leading: Builder(
          builder: (context) => IconButton(
            onPressed: () {
              Scaffold.of(context).openDrawer(); // ✅ فتح الـ Drawer
            },
            icon: Image.asset(
              isDark
                  ? AssetsManager.homeIcon
                  : AssetsManager.homeIconDart,
            ),
          ),
        ),
        title: Text(
          selectedCategory == null
              ? AppLocalizations.of(context)!.home
              : selectedCategory!.title,
          style: Theme.of(context).textTheme.headlineLarge,
        ),
      ),

      body: selectedCategory == null
          ? CategoryFragment(onCategoryItemClick: onCategoryItemClick)
          : CategoryDetails(category: selectedCategory!),
    );
  }

  // ✅ ده لما تضغط على أي كاتيجوري
  void onCategoryItemClick(newCategory newSelectedCategory) {
    setState(() {
      selectedCategory = newSelectedCategory;
    });
  }

  // ✅ ده لما تضغط على أي عنصر في الـ Drawer
  void onDrawerItemClick() {
    setState(() {
      selectedCategory = null;
    });
    Navigator.pop(context);
  }
}
