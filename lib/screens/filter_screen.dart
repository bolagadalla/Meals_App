import 'package:flutter/material.dart';

class FilterScreen extends StatelessWidget {
  static const String screenRouteName = "/filter-screen";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Filters"),
      ),
      body: Center(
        child: Text(
          "Filters!",
          style: Theme.of(context).textTheme.headline1,
        ),
      ),
    );
  }
}
