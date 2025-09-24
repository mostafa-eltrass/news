import 'package:flutter/material.dart';
import 'package:news/api/api_manager.dart';
import 'package:news/model/category.dart';
import 'package:news/model/source_response.dart';
import 'package:news/ui/home/category_details/source/source_name.dart';
import 'package:news/ui/home/category_details/source/source_tab_widget.dart';
import 'package:news/utils/app_colors.dart';
import 'package:news/utils/app_styles.dart';

class CategoryDetails extends StatefulWidget {
    CategoryDetails({super.key, required this.category});
 newCategory category;
  @override
  State<CategoryDetails> createState() => _CategoryDetailsState();
}

class _CategoryDetailsState extends State<CategoryDetails> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<SourceResponse>(
      future: ApiManager.getSources(widget.category.id),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(
            child: CircularProgressIndicator(color: AppColors.greyColor),
          );
        } else if (snapshot.hasError) {
          return Column(
            children: [
              Text(
                'someThing Wong Erorr',
                style: Theme.of(context).textTheme.labelMedium,
              ),
              ElevatedButton(
                onPressed: () {
                  ApiManager.getSources(widget.category.id);
                  setState(() {});
                },
                child: Text(
                  'Try Again',
                  style: Theme.of(context).textTheme.labelMedium,
                ),
              ),
            ],
          );
        } else if (snapshot.data?.status != 'ok') {
          return Column(
            children: [
              Text(
                snapshot.data!.message!,
                style: Theme.of(context).textTheme.labelMedium,
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.greyColor
                ),
                onPressed: () {
                  ApiManager.getSources(widget.category.id);
                  setState(() {});
                },
                child: Text(
                  'Try Again',
                  style: Theme.of(context).textTheme.labelMedium,
                ),
              ),
            ],
          );
        }
        var sourceList = snapshot.data?.sources ?? [];
        return SourceTabWidget(sourceList: sourceList);
      },
    );
  }
}
