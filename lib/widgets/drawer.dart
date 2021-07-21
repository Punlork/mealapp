// ignore_for_file: use_key_in_widget_constructors

import 'package:flutter/material.dart';

import '../screens/filter_page.dart';
import '../screens/home_page.dart';

class DrawerList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
            decoration: BoxDecoration(
              color: Colors.yellow.shade800,
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
          ListTile(
            leading: const Icon(Icons.emoji_food_beverage),
            title: const Text(
              'Meals',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
            onTap: () {
              Navigator.of(context).pushNamed(HomePage.tag);
            },
          ),
          ListTile(
            leading: const Icon(Icons.settings),
            title: const Text(
              'Filters',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
            onTap: () {
              Navigator.of(context).pushNamed(FilterPage.tag);
            },
          ),
        ],
      ),
    );
  }
}
