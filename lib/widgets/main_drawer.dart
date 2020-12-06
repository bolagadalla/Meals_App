import 'package:flutter/material.dart';

import '../screens/filter_screen.dart';

class MainDrawer extends StatelessWidget {
  void _goScreen(BuildContext context, String routeName) {
    Navigator.of(context).pop();
    Navigator.of(context).pushNamed(routeName);
  }

  Widget _drawerButtonItem(
      String title, BuildContext context, Function tapHandler) {
    return Container(
      alignment: Alignment.centerLeft,
      width: double.infinity,
      height: 60,
      margin: EdgeInsets.fromLTRB(0, 8, 0, 8),
      child: FlatButton(
        onPressed: tapHandler,
        child: Text(
          title,
          style: Theme.of(context).textTheme.headline1,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Then heading with the X on the very top
          Container(
            padding: EdgeInsets.fromLTRB(8, 15, 8, 10),
            height: 80,
            width: double.infinity,
            color: Colors.white,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Row(
                  children: [
                    Icon(
                      Icons.menu,
                      size: 40,
                    ),
                    Text(
                      "Menu",
                      style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
                IconButton(
                  icon: Icon(
                    Icons.close_outlined,
                    size: 40,
                    color: Color.fromRGBO(20, 51, 51, 1),
                  ),
                  onPressed: () => Navigator.of(context).pop(),
                  alignment: Alignment.center,
                ),
              ],
            ),
          ),
          SizedBox(height: 10),
          // Flatbutton to take me to a screen
          _drawerButtonItem("Home", context, () => _goScreen(context, "/")),
          _drawerButtonItem("Filter", context,
              () => _goScreen(context, FilterScreen.screenRouteName)),
        ],
      ),
    );
  }
}
