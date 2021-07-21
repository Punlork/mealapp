// ignore_for_file: use_key_in_widget_constructors

import 'package:flutter/material.dart';

import '../widgets/drawer.dart';

class FilterPage extends StatefulWidget {
  static String tag = 'filter-tag';

  @override
  State<FilterPage> createState() => _FilterPageState();
}

class _FilterPageState extends State<FilterPage> {
  Map<String, bool> isSwitched = {};

  Widget title(Size mediaQuery) {
    return Container(
      height: mediaQuery.height * 0.1,
      padding: const EdgeInsets.all(10),
      alignment: Alignment.center,
      child: const Text(
        'Adjust your meal selection.',
        style: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.bold,
          color: Colors.black,
        ),
      ),
    );
  }

  Widget filterList(String title, String subText, Size mediaQuery) {
    return Container(
      margin: const EdgeInsets.all(15),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: const TextStyle(
                  fontSize: 17,
                ),
              ),
              Text(
                subText,
                style: const TextStyle(
                  color: Colors.grey,
                  fontSize: 15,
                ),
              ),
            ],
          ),
          Switch(
            value: isSwitched[title] ?? false,
            onChanged: (value) {
              setState(() {
                isSwitched[title] = value;
              });
            },
            activeTrackColor: Colors.pinkAccent,
            activeColor: Colors.pink,
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Your Filters',
          textAlign: TextAlign.start,
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.save,
            ),
          ),
        ],
      ),
      drawer: DrawerList(),
      body: Column(
        children: [
          title(mediaQuery),
          filterList(
            'Gluten-free',
            'Only include gluten-free meals',
            mediaQuery,
          ),
          filterList(
            'Lactose-free',
            'Only include lactose-free meals',
            mediaQuery,
          ),
          filterList(
            'Vegeterian',
            'Only include vegeterian meals',
            mediaQuery,
          ),
          filterList(
            'Vegan',
            'Only include vegan meals',
            mediaQuery,
          ),
        ],
      ),
    );
  }
}
