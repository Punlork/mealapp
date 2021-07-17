// ignore_for_file: use_key_in_widget_constructors

import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  static String tag = 'home-tag';

  Widget mealCategories(
    Size mediaQuery,
    String title,
    Color color,
  ) {
    return GestureDetector(
      onTap: () {
        print('hello');
      },
      child: Card(
        color: color,
        margin: const EdgeInsets.all(15),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        child: Container(
          padding: const EdgeInsets.all(10),
          height: mediaQuery.height * 0.15,
          width: mediaQuery.width * 0.6,
          alignment: Alignment.topLeft,
          child: Text(
            title,
            style: const TextStyle(
              fontSize: 20,
              color: Colors.black,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }

  final drawer = Drawer(
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
          onTap: () {},
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
          onTap: () {},
        ),
      ],
    ),
  );

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
    final mediaQeury = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Categories'),
      ),
      drawer: drawer,
      body: Card(
        child: Table(
          children: [
            TableRow(
              children: [
                mealCategories(mediaQeury, 'Italian', Colors.purple.shade400),
                mealCategories(mediaQeury, 'Quick & Easy', Colors.red.shade400),
              ],
            ),
            TableRow(
              children: [
                mealCategories(mediaQeury, 'Hamburgers', Colors.orange),
                mealCategories(mediaQeury, 'German', Colors.yellow.shade700),
              ],
            ),
            TableRow(
              children: [
                mealCategories(
                    mediaQeury, 'Light & Lovely', Colors.blue.shade600),
                mealCategories(mediaQeury, 'Exotic', Colors.green.shade400),
              ],
            ),
            TableRow(
              children: [
                mealCategories(mediaQeury, 'Breakfast', Colors.blue.shade400),
                mealCategories(mediaQeury, 'Asain', Colors.green.shade300),
              ],
            ),
          ],
        ),
      ),
      bottomNavigationBar: buttomNavi,
    );
  }
}
