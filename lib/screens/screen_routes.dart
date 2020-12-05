import '../screens/category_meals_screen.dart';
import 'package:flutter/material.dart';

// Map of screen routes
Map<String, Widget Function(BuildContext)> screenRoutes = {
  CategoryMealsScreen.screenRouteName: (ctx) => CategoryMealsScreen(),
};
