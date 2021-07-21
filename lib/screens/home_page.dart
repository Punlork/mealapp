// ignore_for_file: use_key_in_widget_constructors

import 'package:flutter/material.dart';

import '../widgets/drawer.dart';
import '../data/dumy_data.dart';
import '../widgets/categories_item.dart';

class HomePage extends StatelessWidget {
  static String tag = 'home-tag';

  final buttomNavi = BottomNavigationBar(
    backgroundColor: Colors.pink,
    selectedItemColor: Colors.orange,
    unselectedItemColor: Colors.white,
    items: const <BottomNavigationBarItem>[
      BottomNavigationBarItem(
        icon: Icon(
          Icons.category,
        ),
        label: 'Categories',
      ),
      BottomNavigationBarItem(
        icon: Icon(
          Icons.star,
        ),
        label: 'Favorites',
      ),
    ],
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Categories'),
      ),
      drawer: DrawerList(),
      body: GridView(
        padding: const EdgeInsets.all(25),
        gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 200,
          childAspectRatio: 3 / 2,
          crossAxisSpacing: 20,
          mainAxisSpacing: 20,
        ),
        children: DUMMY_CATEGORIES
            .map(
              (catData) => CategoryItem(
                catData.id,
                catData.title,
                catData.color,
              ),
            )
            .toList(),
      ),
      bottomNavigationBar: buttomNavi,
    );
  }
}
