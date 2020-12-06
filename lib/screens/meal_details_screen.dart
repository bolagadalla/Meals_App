import 'package:flutter/material.dart';

import '../models/meal.dart';

class MealDetailsScreen extends StatelessWidget {
  static const String screenRouteName = "/meal-details";

  // Returns a contianer with stylized text that would act as a heading
  Widget sectionHeader(BuildContext context, String headingText) {
    return Container(
      margin: EdgeInsets.symmetric(
        vertical: 10,
      ),
      child: Text(
        headingText,
        style: Theme.of(context).textTheme.headline6,
      ),
    );
  }

  // Returns a container with a list view that contains a list of strings
  Widget sectionListView(BuildContext context, Widget child) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(10),
      ),
      height: 200,
      width: MediaQuery.of(context).size.width - 20,
      child: child,
    );
  }

  @override
  Widget build(BuildContext context) {
    final routeArg = ModalRoute.of(context).settings.arguments as Meal;
    final Meal meal = routeArg;

    return Scaffold(
      appBar: AppBar(
        title: Text(meal.title),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 300,
              width: double.infinity,
              child: Image.network(
                meal.imageUrl,
                fit: BoxFit.cover,
              ),
            ),
            sectionHeader(context, "Ingredient"),
            sectionListView(
              context,
              ListView.builder(
                itemBuilder: (ctx, index) => Card(
                  elevation: 2,
                  // color: Theme.of(context).accentColor,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      meal.ingredients[index],
                      // style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
                itemCount: meal.ingredients.length,
              ),
            ),
            sectionHeader(context, "Steps"),
            sectionListView(
              context,
              ListView.builder(
                itemCount: meal.steps.length,
                itemBuilder: (context, index) => Card(
                  elevation: 2,
                  child: ListTile(
                    leading: CircleAvatar(
                      child: Text("# ${index + 1}"),
                    ),
                    title: Text(meal.steps[index]),
                  ),
                ),
              ),
            ),
            SizedBox(height: 10),
          ],
        ),
      ),
    );
  }
}
