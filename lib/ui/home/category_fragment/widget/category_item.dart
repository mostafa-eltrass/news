import 'package:flutter/material.dart';
import 'package:news/model/category.dart';
import 'package:news/utils/app_colors.dart';

class CategoryItem extends StatelessWidget {
    CategoryItem({super.key, required this.Category, required this.index});
   newCategory  Category;
   int index;
  @override

  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(2),

        border: Border.all(
          color: AppColors.greyColor
        )
      ),
      child: Stack(
        alignment: (index%2==0)?Alignment.bottomRight :Alignment.bottomLeft,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(16),
            child: Image.asset(Category.image),
          ),
          Container(
            margin: EdgeInsets.symmetric(
              horizontal: width*0.02,
              vertical: height*0.02
            ),
            width: width*0.40,
            padding: EdgeInsetsDirectional.only(
              start: (index%2 == 0)?width*0.02 :0,
              end:  (index %2 == 0)? 0 : width*0.02
            ),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(84),
              color: AppColors.greyColor,
            ),
            child: Row(
              textDirection: (index % 2 == 0)?TextDirection.ltr :TextDirection.rtl ,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                    'View All',
                  style: Theme.of(context).textTheme.headlineMedium,
                ),
                CircleAvatar(
                  radius: 25,
                  backgroundColor: Theme.of(context).primaryColor,
                  child: Icon(
                    (index %2==0)?
                    Icons.arrow_forward_ios_rounded
                        :Icons.arrow_back_ios_rounded,

                    color: Theme.of(context).indicatorColor,
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
