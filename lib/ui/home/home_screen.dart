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
  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      drawer:   AppDrawer(onRrowerItemClick:onDrowerItemClick ,), // ✨ هنا بتحط الـ Drawer الفعلي

      appBar: AppBar(
        centerTitle: true,
        leading: Builder(
          builder: (context) => IconButton(
            onPressed: () {
              Scaffold.of(context).openDrawer(); // ✅ هنا بتفتح الـ Drawer
            },
            icon: Image.asset(
              isDark
                  ? AssetsManager.homeIcon// بيضاء في الدارك
                  :  AssetsManager.homeIconDart ,    // سوداء في اللايت
            ),
          ),

        ),

        title: Center(
            child:
            Text( selectedCategory == null?

                AppLocalizations.of(context)!.home
                :selectedCategory!.title,
                style: Theme.of(context).textTheme.headlineLarge)
      )

      ),

      body:  selectedCategory == null ?
      CategoryFragment(onCategoryItemClick: onCategoryItemClick ,)
          : CategoryDetails( category: selectedCategory!,)
    );
  }
  newCategory? selectedCategory;
  void onCategoryItemClick(newCategory newSelectedCategory){
       selectedCategory = newSelectedCategory;
       setState(() {

       });
  }
    void onDrowerItemClick(){
    selectedCategory = null;
    Navigator.pop(context);
    setState(() {

    });
    }
}
