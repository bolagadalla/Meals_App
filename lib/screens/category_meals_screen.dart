import 'package:flutter/material.dart';

import '../dummy_categories.dart';
import '../models/category.dart';

class CategoryMealsScreen extends StatelessWidget {
  static const String screenRouteName = "/category-meals";
  @override
  Widget build(BuildContext context) {
    // Gets the arguemnt that was passed from the routing system
    final routeArgs = ModalRoute.of(context).settings.arguments as Category;
    final Category category = routeArgs;
    // Gets all the meals with the same categories id
    final categoryMeals = DUMMY_MEALS.where(
      (meal) {
        // Returns all the meals that contains the same id
        return meal.categories.contains(category.id);
      },
    );
    return Scaffold(
      appBar: AppBar(
        title: Text("${category.title} Recipes"),
      ),
      body: ListView.builder(
        itemBuilder: (ctx, index) {
          return Text(categoryMeals.elementAt(index).title);
        },
        itemCount: categoryMeals.length,
      ),
    );
  }
}
