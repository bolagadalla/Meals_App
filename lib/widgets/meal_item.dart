import 'package:flutter/material.dart';

import '../models/meal.dart';
import '../screens/meal_details_screen.dart';

class MealItem extends StatelessWidget {
  final Meal meal;
  MealItem(this.meal);

  // Returns the string equivilent of the enum Complexity
  String get complexityText {
    switch (meal.complexity) {
      case Complexity.Simple:
        return "Simple";
        break;
      case Complexity.Challenging:
        return "Challenging";
        break;
      case Complexity.Hard:
        return "Hard";
        break;
      default:
        return "Unknown";
    }
  }

  // Returns the string equivilent of the enum Affordability
  String get affordabilityText {
    switch (meal.affordability) {
      case Affordability.Affordable:
        return "Affordable";
        break;
      case Affordability.Luxurious:
        return "Expensive";
        break;
      case Affordability.Pricey:
        return "Pricey";
        break;
      default:
        return "Unknown";
    }
  }

  // Transition to the MealDetailsScreen
  void _selectMeal(BuildContext context) {
    Navigator.of(context).pushNamed(
      MealDetailsScreen.screenRouteName,
      arguments: meal,
    );
  }

  @override
  Widget build(BuildContext context) {
    const double radius = 15;
    return InkWell(
      onTap: () => _selectMeal(context),
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(radius),
        ),
        elevation: 4,
        margin: const EdgeInsets.all(10),
        child: Column(
          children: [
            // Show the image of the recipe
            // On top of that it will show the title of the recipe
            Stack(
              children: [
                // IMAGE - get the image from the web and make it rounded corner
                ClipRRect(
                  // ClipRRect forces the child into a certain shape we define,
                  // in this case its border radius
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(radius),
                    topRight: Radius.circular(radius),
                  ),
                  // this gets an image from the web
                  child: Image.network(
                    meal.imageUrl,
                    height: 250,
                    width: double.infinity,
                    // Fits the image into the container around it
                    fit: BoxFit.cover,
                  ),
                ),
                Positioned(
                  bottom: 20,
                  right: 0,
                  child: Container(
                    width: 320,
                    color: Colors.black54,
                    padding: EdgeInsets.symmetric(
                      vertical: 5,
                      horizontal: 20,
                    ),
                    child: Text(
                      meal.title,
                      style: TextStyle(
                        fontSize: 26,
                        color: Colors.white,
                      ),
                      softWrap: true,
                      overflow: TextOverflow.fade,
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: EdgeInsets.all(20),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  // Duration
                  Row(
                    children: [
                      Icon(
                        Icons.schedule,
                        color: Theme.of(context).accentColor,
                      ),
                      SizedBox(width: 6),
                      Text("${meal.duration} min"),
                    ],
                  ),
                  // Complexity
                  Row(
                    children: [
                      Icon(
                        Icons.work,
                        color: Theme.of(context).accentColor,
                      ),
                      SizedBox(width: 6),
                      Text("$complexityText"),
                    ],
                  ),
                  // Affordability
                  Row(
                    children: [
                      Icon(
                        Icons.attach_money,
                        color: Theme.of(context).accentColor,
                      ),
                      SizedBox(width: 6),
                      Text("$affordabilityText"),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
