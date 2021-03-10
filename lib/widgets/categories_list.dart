import 'package:flutter/material.dart';
import 'package:todoey_flutter/models/category_data.dart';
import 'package:todoey_flutter/models/task_data.dart';
import 'package:todoey_flutter/widgets/category_tile.dart';
import 'package:provider/provider.dart';


class CategoriesList extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Consumer<CategoryData>(
      builder: (context, categoryData, child) {
        return /*ListView*/GridView.builder(
          gridDelegate: new SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
          ),
          itemBuilder: (context, index) {
            //final category = categoryData.categories[index];
            var category = categoryData.categories[index];

            return ChangeNotifierProvider(
              create: (context) => TaskData(),
              child:
              // Text('123')
              CategoryContainer(
                categoryTitle: category.category,
                isChecked: category.isDone,
                checkboxCallback: (checkboxState) {
                  categoryData.updateCategory(category);
                },
                longPressCallback: () {
                  categoryData.deleteCategory(category);
                },
              ),
            );

            // return CategoryTile(
            //   categoryTitle: category.category, /*task.name*/
            //   isChecked: category.isDone, /*task.isDone*/
            //   checkboxCallback: (checkboxState) {
            //     categoryData.updateCategory(category);
            //   },
            //   longPressCallback: () {
            //     categoryData.deleteCategory(category);
            //   },
            // );
          },
          itemCount: categoryData.categoryCount,
        );
      },
    );
  }
}
