import 'package:flutter/material.dart';

import '../models/category.dart';
import '../models/meal.dart';
import '../widgets/meal_item.dart';

class CategoryMealsScreen extends StatelessWidget {
  static const String screenRouteName = "/category-meals";

  final List<Meal> availableMeals;

  CategoryMealsScreen(this.availableMeals);

  @override
  Widget build(BuildContext context) {
    // Gets the arguemnt that was passed from the routing system
    final routeArgs = ModalRoute.of(context).settings.arguments as Category;
    final Category category = routeArgs;
    // Gets all the meals with the same categories id
    final categoryMeals = availableMeals.where(
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
          return MealItem(categoryMeals.elementAt(index));
        },
        itemCount: categoryMeals.length,
      ),
    );
  }
}
