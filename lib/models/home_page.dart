// ignore_for_file: use_key_in_widget_constructors

import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  static String tag = 'home-tag';

  Widget mealCategories() {
    return Card(
      color: Colors.pink,
      margin: EdgeInsets.all(20),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      child: Container(
        padding: EdgeInsets.all(10),
        height: 40,
        width: 100,
        alignment: Alignment.centerLeft,
        child: Text(
          'Hello',
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Categories',
        ),
      ),
      body: mealCategories(),
    );
  }
}
