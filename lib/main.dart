import 'package:flutter/material.dart';

import './dummy_categories.dart';
import './screens/404_screen.dart';
import './screens/tabs_screen.dart';
import './screens/filter_screen.dart';
import './screens/category_meals_screen.dart';
import './screens/meal_details_screen.dart';
import './screens/categories_screen.dart';
import './models/meal.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  // This widget is the root of your application.
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Map<String, bool> _filters = {
    "gluten": false,
    "lactose": false,
    "vegan": false,
    "vegetarian": false,
  };

  List<Meal> _availabelMeals = DUMMY_MEALS;
  List<Meal> _favoriteMeals = [];

  void _setFilter(Map<String, bool> filterData) {
    setState(() {
      _filters = filterData;
      _availabelMeals = DUMMY_MEALS.where((meal) {
        if (_filters["gluten"] && !meal.isGlutenFree) return false;
        if (_filters["lactose"] && !meal.isLactoseFree) return false;
        if (_filters["vegan"] && !meal.isVegan) return false;
        if (_filters["vegetarian"] && !meal.isVegetarian) return false;

        return true;
      }).toList();
    });
  }

  // This method is triggered when i click on the "make favorite" button
  // It will add the meal as favorite or remove it if it was already a favorite
  // Not a good idea to do this becuase it will rebuild the whole app just to add or remove a favorite app
  void _toggleFavorite(String mealID) {
    // If i dont find the existingIndex then it will be -1
    final existingIndex =
        _favoriteMeals.indexWhere((element) => element.id == mealID);
    if (existingIndex >= 0) {
      setState(() {
        _favoriteMeals.removeAt(existingIndex);
      });
    } else {
      setState(() {
        _favoriteMeals
            .add(DUMMY_MEALS.firstWhere((element) => element.id == mealID));
      });
    }
  }

  bool _isMealFavorite(String mealID) {
    return _favoriteMeals.any((element) => element.id == mealID);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Meals App',
      theme: ThemeData(
        primaryColor: Colors.amber[800],
        accentColor: Colors.indigo[900],
        canvasColor: Color.fromRGBO(255, 254, 229, 1),
        fontFamily: "Raleway",
        textTheme: ThemeData.light().textTheme.copyWith(
            bodyText1: TextStyle(
              color: Color.fromRGBO(20, 51, 51, 1),
            ),
            bodyText2: TextStyle(
              color: Color.fromRGBO(20, 51, 51, 1),
            ),
            headline6: TextStyle(
              fontSize: 20,
              fontFamily: "RobotoCondensed",
              fontWeight: FontWeight.bold,
            ),
            headline1: TextStyle(
              fontSize: 30,
              fontFamily: "RobotoCondensed",
              fontWeight: FontWeight.bold,
              color: Color.fromRGBO(20, 51, 51, 1),
            )),
      ),
      // This is a map of screen names and routes for those screens
      routes: {
        TabsScreen.screenRouteName: (ctx) => TabsScreen(_favoriteMeals),
        CategoriesScreen.screenRouteName: (ctx) => CategoriesScreen(),
        CategoryMealsScreen.screenRouteName: (ctx) =>
            CategoryMealsScreen(_availabelMeals),
        MealDetailsScreen.screenRouteName: (ctx) =>
            MealDetailsScreen(_toggleFavorite, _isMealFavorite),
        FilterScreen.screenRouteName: (ctx) =>
            FilterScreen(_filters, _setFilter),
      },
      // A fallback screen that it would go to if it couldnt find the route screen
      // onGenerateRoute: (settings) {
      //   // print(settings.arguments);
      //   // return MaterialPageRoute(builder: (ctx) => CategoriesScreen(),);
      //   //if(settings.name =="/somescreen") return MaterialPageRoute(builder: null)
      // },

      // A fallback to a default screen if it couldnt navigate to a correct screen
      // That means you defined nothing for a root route of the screen you are trying to go to
      onUnknownRoute: (settings) {
        return MaterialPageRoute(builder: (ctx) => Screen404());
      },
    );
  }
}
