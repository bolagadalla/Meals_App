import 'package:Meals_App/screens/categories_screen.dart';
import 'package:flutter/material.dart';

class Screen404 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("404"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: const [
            const Icon(
              Icons.clear,
              color: Colors.red,
              size: 100,
            ),
            const Text(
              "404!",
              style: TextStyle(
                fontSize: 42,
                fontWeight: FontWeight.bold,
                fontFamily: "RobotoCondensed",
              ),
            ),
            const Text(
              "COULDN\'T FIND RESULT!",
              style: TextStyle(
                fontSize: 25,
              ),
            ),
            // Container(
            //   margin: const EdgeInsets.only(top: 8),
            //   width: 100,
            //   height: 35,
            //   child: RaisedButton(
            //     onPressed: () => _goHome(context),
            //     child: const Text(
            //       "Home",
            //       style: TextStyle(
            //         fontSize: 16,
            //       ),
            //     ),
            //     color: Theme.of(context).primaryColor,
            //   ),
            // ),
          ],
        ),
      ),
    );
  }
}
