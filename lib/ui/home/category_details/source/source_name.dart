import 'package:flutter/material.dart';
import 'package:news/model/source_response.dart';

class SourceName extends StatelessWidget {
  SourceName({super.key, required this.source , required this.isSelected});
  Source source;
  bool isSelected;
  @override
  Widget build(BuildContext context) {
    return Text(
      source.name ?? '',
      style: isSelected?
       Theme.of(context).textTheme.labelLarge
       :Theme.of(context).textTheme.labelMedium ,
            
    );
  }
}
