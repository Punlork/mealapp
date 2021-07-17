// ignore_for_file: use_key_in_widget_constructors

import 'package:flutter/material.dart';

import './widgets/home_page.dart';
import './widgets/filter_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  final routes = <String, WidgetBuilder>{
    HomePage.tag: (context) => HomePage(),
    FilterPage.tag: (context) => const FilterPage(),
  };

  @override
  Widget build(BuildContext context) {
    const String _category = 'Categories';

    return MaterialApp(
      title: _category,
      theme: ThemeData(primaryColor: Colors.pink),
      home: HomePage(),
      debugShowCheckedModeBanner: false,
      routes: routes,
    );
  }
}
