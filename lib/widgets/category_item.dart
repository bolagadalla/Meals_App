import 'package:flutter/material.dart';

import '../screens/category_meals_screen.dart';
import '../models/category.dart';

class CategoryItem extends StatelessWidget {
  final Category category;

  CategoryItem(this.category);

  void selectCategory(BuildContext ctx) {
    // Push the screen with the string idetifier of "/categories"
    // This is grabbed from the SCREEN_ROUTES file
    // which was assigned in the "routes" variable in the main.dart
    Navigator.of(ctx).pushNamed(
      CategoryMealsScreen.screenRouteName,
      arguments: category,
    );
  }

  @override
  Widget build(BuildContext context) {
    const double radius = 15;
    // A container with a gradient color
    return InkWell(
      child: Container(
        padding: const EdgeInsets.all(15),
        child: Center(
          child: Text(
            category.title,
            style: Theme.of(context).textTheme.headline6,
          ),
        ),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              category.color.withOpacity(0.7),
              category.color,
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          borderRadius: BorderRadius.circular(radius),
        ),
      ),
      splashColor: Theme.of(context).primaryColor,
      borderRadius: BorderRadius.circular(radius),
      onTap: () => selectCategory(context),
    );
  }
}
