import 'package:flutter/material.dart';
import 'package:responsive/models/category_model.dart';
import '../sizes_helper.dart';
import 'category_item.dart';

class CategoryContainer extends StatelessWidget {
  const CategoryContainer({required this.categoriesList});

  final List<CategoryModel> categoriesList;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: dispalyWidth(context),
      height: dispalyHeight(context),
      child: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 1.5,
        ),
        itemCount: categoriesList.length,
        itemBuilder: (context, index) {
          return CategoryItem(
            name: categoriesList[index].title,
            path: categoriesList[index].path,
            id: categoriesList[index].id,
          );
        },
      ),
    );
  }
}
