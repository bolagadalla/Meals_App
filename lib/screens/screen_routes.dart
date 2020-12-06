import 'package:flutter/material.dart';

import '../screens/tabs_screen.dart';
import '../screens/filter_screen.dart';
import '../screens/category_meals_screen.dart';
import '../screens/meal_details_screen.dart';
import '../screens/categories_screen.dart';

// Map of screen routes
Map<String, Widget Function(BuildContext)> screenRoutes = {
  TabsScreen.screenRouteName: (ctx) => TabsScreen(),
  CategoriesScreen.screenRouteName: (ctx) => CategoriesScreen(),
  CategoryMealsScreen.screenRouteName: (ctx) => CategoryMealsScreen(),
  MealDetailsScreen.screenRouteName: (ctx) => MealDetailsScreen(),
  FilterScreen.screenRouteName: (ctx) => FilterScreen(),
};
