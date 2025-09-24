import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:news/model/category.dart';
import 'package:news/ui/home/category_fragment/widget/category_item.dart';

 typedef OnCategoryItemClick = void  Function(newCategory);
class CategoryFragment extends StatelessWidget {
    CategoryFragment({super.key,required this.onCategoryItemClick});
 List<newCategory> CategoriesList =[];
 OnCategoryItemClick  onCategoryItemClick;
    @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    bool isDark = Theme.of(context).brightness == Brightness.dark;
    CategoriesList = newCategory.getCategoriesList(isDark);
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: width * 0.04),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            'Good Morning\nHere is some news for you',
            style: Theme.of(context).textTheme.headlineMedium,
          ),
          SizedBox(height: height * 0.02),
           Expanded(child: ListView.separated(
               itemBuilder:(context,index) {
                 return InkWell(
                   onTap: (){
                     onCategoryItemClick(CategoriesList[index]);
                   },
                     child : CategoryItem(Category: CategoriesList[index],index: index,),
                 );

               } ,
               separatorBuilder: (context,index)  {
                 return SizedBox(height: height*0.02,);
               },
               itemCount: CategoriesList.length))
        ],
      ),
    );
  }
}


