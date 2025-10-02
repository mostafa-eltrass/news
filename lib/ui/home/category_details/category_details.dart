import 'package:flutter/material.dart';
import 'package:news/model/category.dart';
import 'package:news/ui/home/category_details/source/source_tab_widget.dart';
import 'package:news/ui/home/category_details/sources_view_model.dart';
import 'package:news/utils/app_colors.dart';
import 'package:provider/provider.dart';

class CategoryDetails extends StatefulWidget {
  final newCategory category;
  const CategoryDetails({super.key, required this.category});

  @override
  State<CategoryDetails> createState() => _CategoryDetailsState();
}

class _CategoryDetailsState extends State<CategoryDetails> {
  final SourcesViewModel viewModel = SourcesViewModel();

  @override
  void initState() {
    super.initState();
    viewModel.getSources(widget.category.id);
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => viewModel,
      child: Consumer<SourcesViewModel>(
        builder: (context, viewModel, child) {
          if (viewModel.errorMessage != null) {
            return Column(
              children: [
                Text(
                  viewModel.errorMessage!,
                  style: Theme.of(context).textTheme.labelMedium,
                ),
                ElevatedButton(
                  onPressed: () {
                    viewModel.getSources(widget.category.id);
                  },
                  child: Text(
                    'Try Again',
                    style: Theme.of(context).textTheme.labelMedium,
                  ),
                ),
              ],
            );
          } else if (viewModel.sourceList == null) {
            return Center(
              child: CircularProgressIndicator(color: AppColors.greyColor),
            );
          } else {
            return SourceTabWidget(sourceList: viewModel.sourceList!);
          }
        },
      ),
    );
  }
}
