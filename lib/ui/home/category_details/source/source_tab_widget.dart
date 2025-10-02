import 'package:flutter/material.dart';
import 'package:news/model/source_response.dart';
import 'package:news/ui/home/category_details/news/news_widget.dart';
import 'package:news/ui/home/category_details/source/source_name.dart';
import 'package:news/utils/app_colors.dart';

class SourceTabWidget extends StatelessWidget {
  SourceTabWidget({super.key, required this.sourceList});
  final List<Source> sourceList;

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;

    return DefaultTabController(
      length: sourceList.length,
      child: Column(
        children: [
          TabBar(
            indicatorColor: Theme.of(context).indicatorColor,
            dividerColor: AppColors.transparentColor,
            tabAlignment: TabAlignment.start,
            isScrollable: true,
            tabs: sourceList.map((source) {
              return SourceName(
                source: source,
                isSelected: false, // TabBarView هو اللي هيتحكم
              );
            }).toList(),
          ),
          SizedBox(height: height * 0.02),
          // هنا أهم جزء 👇
          Expanded(
            child: TabBarView(
              children: sourceList.map((source) {
                return NewsWidget(source: source);
              }).toList(),
            ),
          ),
        ],
      ),
    );
  }
}
