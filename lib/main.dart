import 'package:flutter/material.dart';

import './models/home_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    const String _category = 'Categories';

    return MaterialApp(
      title: _category,
      theme: ThemeData(primaryColor: Colors.pink),
      home: HomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}
