// ignore_for_file: deprecated_member_use, use_key_in_widget_constructors

import 'package:flutter/material.dart';

import 'screens/home_page.dart';
import 'screens/filter_page.dart';
import 'screens/category_meal_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  final routes = <String, WidgetBuilder>{
    HomePage.tag: (context) => HomePage(),
    FilterPage.tag: (context) => FilterPage(),
    CategoryMealScreen.tag: (context) => CategoryMealScreen(),
  };

  @override
  Widget build(BuildContext context) {
    const String _category = 'Categories';

    return MaterialApp(
      title: _category,
      theme: ThemeData(
        primaryColor: Colors.pink,
        accentColor: Colors.amber,
        canvasColor: const Color.fromRGBO(225, 254, 229, 1),
        fontFamily: 'Raleway',
        textTheme: ThemeData.light().textTheme.copyWith(
              bodyText2: const TextStyle(
                color: Color.fromRGBO(20, 51, 51, 1),
              ),
              bodyText1: const TextStyle(
                color: Color.fromRGBO(20, 51, 51, 1),
              ),
              headline6: const TextStyle(
                fontSize: 24,
                fontFamily: 'RobotoCondensed',
                fontWeight: FontWeight.bold,
              ),
            ),
      ),
      home: HomePage(),
      debugShowCheckedModeBanner: false,
      routes: routes,
    );
  }
}
