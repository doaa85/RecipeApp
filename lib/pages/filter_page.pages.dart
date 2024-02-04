import 'package:flutter/material.dart';
import 'package:recipe_app/pages/home_page.pages.dart';
import 'package:recipe_app/utilities/numbers.dart';

class FilterPage extends StatefulWidget {
  const FilterPage({super.key});

  @override
  State<FilterPage> createState() => _FilterPageState();
}

class _FilterPageState extends State<FilterPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const Padding(
          padding:
              EdgeInsets.symmetric(horizontal: Numbers.appHorizontalPadding),
          child: Icon(Icons.menu),
        ),
        actions: [
          Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: Numbers.appHorizontalPadding),
              child:
                  // Icon(Icons.logout_sharp),
                  IconButton(
                onPressed: () {
                  Navigator.push(
                      context, MaterialPageRoute(builder: (_) => HomePage()));
                },
                icon: Icon(Icons.logout_sharp),
              ))
        ],
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  'Filter',
                  style: TextStyle(fontSize: 24),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
