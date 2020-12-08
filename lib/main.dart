import 'package:flutter/material.dart';

import './screens/404_screen.dart';
import './screens/screen_routes.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
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
      routes: screenRoutes,
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
