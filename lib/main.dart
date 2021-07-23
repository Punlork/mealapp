// ignore_for_file: deprecated_member_use, use_key_in_widget_constructors

import 'package:flutter/material.dart';

import './data/dumy_data.dart';
import './screens/Tabs_screen.dart';
import './screens/meal_detail_screen.dart';
import './screens/home_page.dart';
import './screens/filter_page.dart';
import './screens/category_meal_screen.dart';
import './models/meal.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Map<String, bool> _filters = {
    'gluten': false,
    'lactose': false,
    'vegan': false,
    'vegetarian': false,
  };

  List<Meal> _availableMeals = DUMMY_MEALS;
  final List<Meal> _favoritedMeals = [];

  void _setFilters(Map<String, bool> filterData) {
    setState(() {
      _filters = filterData;

      _availableMeals = DUMMY_MEALS.where(
        (meal) {
          if (_filters['gluten'] && !meal.isGlutenFree) {
            return false;
          }
          if (_filters['lactose'] && !meal.isLactoseFree) {
            return false;
          }
          if (_filters['vegan'] && !meal.isVegan) {
            return false;
          }
          if (_filters['vegetarian'] && !meal.isVegetarian) {
            return false;
          }
          return true;
        },
      ).toList();
    });
  }

  void _toggleFavorite(String mealId) {
    final existingIndex =
        _favoritedMeals.indexWhere((meal) => meal.id == mealId);
    if (existingIndex >= 0) {
      setState(() {
        _favoritedMeals.removeAt(existingIndex);
      });
    } else {
      setState(() {
        _favoritedMeals.add(
          DUMMY_MEALS.firstWhere((meal) => meal.id == mealId),
        );
      });
    }
  }

  bool _isMealFavorite(String id) {
    return _favoritedMeals.any(
      (meal) => meal.id == id,
    );
  }

  @override
  Widget build(BuildContext context) {
    const String _category = 'Categories';

    final routes = <String, WidgetBuilder>{
      TabsScreen.tag: (context) => TabsScreen(_favoritedMeals),
      FilterPage.tag: (context) => FilterPage(_filters, _setFilters),
      CategoryMealScreen.tag: (context) => CategoryMealScreen(_availableMeals),
      MealDetailScreen.tag: (context) =>
          MealDetailScreen(_toggleFavorite, _isMealFavorite),
    };

    return MaterialApp(
      title: _category,
      theme: ThemeData(
        primarySwatch: Colors.pink,
        accentColor: Colors.amber,
        canvasColor: const Color.fromRGBO(225, 254, 229, 1),
        fontFamily: 'Raleway',
        textTheme: ThemeData.light().textTheme.copyWith(
              bodyText1: const TextStyle(
                color: Color.fromRGBO(20, 51, 51, 1),
              ),
              bodyText2: const TextStyle(
                color: Color.fromRGBO(20, 51, 51, 1),
              ),
              headline5: const TextStyle(
                fontSize: 24,
                fontFamily: 'RobotoCondensed',
                fontWeight: FontWeight.bold,
              ),
            ),
      ),
      home: TabsScreen(_favoritedMeals),
      debugShowCheckedModeBanner: false,
      routes: routes,
      onUnknownRoute: (settings) {
        return MaterialPageRoute(
          builder: (ctx) => HomePage(),
        );
      },
    );
  }
}
