import 'package:flutter/material.dart';
import 'package:news/model/source_response.dart';
import 'package:news/ui/home/category_details/news/news_widget.dart';
import 'package:news/ui/home/category_details/source/source_name.dart';
import 'package:news/utils/app_colors.dart';

class SourceTabWidget extends StatefulWidget {
  SourceTabWidget({super.key, required this.sourceList});
  List<Source> sourceList;

  @override
  State<SourceTabWidget> createState() => _SourceTabWidgetState();
}

class _SourceTabWidgetState extends State<SourceTabWidget> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context) .size.height;
    var width = MediaQuery.of(context) .size.width;
    return DefaultTabController(
      length: widget.sourceList.length,
      child: Column(
        children: [
          TabBar(
            onTap: (index) {
              selectedIndex = index;
              setState(() {});
            },
            indicatorColor: Theme.of(context).indicatorColor,
            dividerColor: AppColors.transparentColor,
            tabAlignment: TabAlignment.start,
            isScrollable: true,
            tabs: widget.sourceList.map((source) {
              return SourceName(
                source: source,
                isSelected: selectedIndex == widget.sourceList.indexOf(source),
              );
            }).toList(),
          ),
          SizedBox(height: height * 0.02),
          Expanded(child: NewsWidget(source: widget.sourceList[selectedIndex])),
        ],
      ),
    );
  }
}
