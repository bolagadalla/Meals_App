import 'package:flutter/material.dart';

import '../dummy_categories.dart';
import '../widgets/category_item.dart';

class CategoriesScreen extends StatelessWidget {
  static const String screenRouteName = "/categories";
  @override
  Widget build(BuildContext context) {
    // Grids build widgets side by side
    return GridView(
      padding: const EdgeInsets.all(25),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisSpacing: 20,
        mainAxisSpacing: 20,
        childAspectRatio: 3 / 2,
        crossAxisCount: 2,
      ),
      children: DUMMY_CATEGORIES
          .map(
            (catData) => CategoryItem(
              catData,
            ),
          )
          .toList(),
    );
  }
}
