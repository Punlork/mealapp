// ignore_for_file: use_key_in_widget_constructors, deprecated_member_use

import 'package:flutter/material.dart';
import 'package:mealapp/screens/Tabs_screen.dart';

import '../screens/filter_page.dart';

class DrawerList extends StatelessWidget {
  Widget buildListTile(IconData icons, String title, Function taphandler) {
    return ListTile(
      leading: Icon(
        icons,
      ),
      title: Text(
        title,
        style: const TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 24,
          fontFamily: 'RobotoCondensed',
        ),
      ),
      onTap: taphandler,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          SizedBox(
            height: 150,
            width: double.infinity,
            child: DrawerHeader(
              decoration: BoxDecoration(
                color: Theme.of(context).accentColor,
              ),
              child: Text(
                'Cooking Up!',
                textAlign: TextAlign.left,
                style: TextStyle(
                  color: Colors.red.shade600,
                  fontWeight: FontWeight.bold,
                  fontSize: 35,
                ),
              ),
            ),
          ),
          buildListTile(
            Icons.restaurant,
            'Meals',
            () => Navigator.of(context).pushReplacementNamed(
              TabsScreen.tag,
            ),
          ),
          buildListTile(
            Icons.settings,
            'Filters',
            () => Navigator.of(context).pushReplacementNamed(
              FilterPage.tag,
            ),
          ),
        ],
      ),
    );
  }
}
