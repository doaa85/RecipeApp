// import 'package:flutter/material.dart';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:recipe_app/provider/recipes_provider.dart';
import 'package:recipe_app/utilities/colores.dart';
import 'package:recipe_app/widgets/slider_widget.widgets.dart';

class FilterPage extends StatefulWidget {
  const FilterPage({super.key});

  @override
  State<FilterPage> createState() => _FilterPageState();
}

class _FilterPageState extends State<FilterPage> {
  var selectedUserValue = {};

  get currentSliderValue => currentSliderValue;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Row(
              children: [
                const Text(
                  'Filter',
                  style: TextStyle(fontSize: 28),
                ),
                const SizedBox(
                  width: 190,
                ),
                TextButton(
                  onPressed: () {
                    selectedUserValue.clear();
                    currentSliderValue == 0;
                    setState(() {});
                  },
                  child: const Text(
                    'Reset',
                    style: TextStyle(fontSize: 18),
                  ),
                )
              ],
            ),
          ),
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  'type',
                  style: TextStyle(fontSize: 25),
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 5),
            child: Wrap(
                // space between chips
                spacing: 10,
                // list of chips
                children: [
                  InkWell(
                    onTap: () {
                      selectedUserValue['type'] = "breakfast";
                      setState(() {});
                    },
                    child: Chip(
                      label: Text('Breakfast'),
                      backgroundColor: selectedUserValue['type'] == "breakfast"
                          ? Colors.orange
                          : Colors.grey,
                      padding:
                          EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      selectedUserValue['type'] = "launch";
                      setState(() {});
                    },
                    child: Chip(
                      label: Text('Launch'),
                      backgroundColor: selectedUserValue['type'] == "launch"
                          ? Colors.orange
                          : Colors.grey,
                      padding:
                          EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      selectedUserValue['type'] = "dinner";
                      setState(() {});
                    },
                    child: Chip(
                      label: Text('Dinner'),
                      backgroundColor: selectedUserValue['type'] == "dinner"
                          ? Colors.orange
                          : Colors.grey,
                      padding:
                          EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                    ),
                  ),
                ]),
          ),
          const Divider(
            color: Color(0xFF6C8090),
            thickness: 1,
            indent: 60,
            endIndent: 60,
            height: 10,
          ),
          const SizedBox(
            height: 20,
          ),
          const Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Text(
                  'Servings',
                  style: TextStyle(fontSize: 20),
                )
              ],
            ),
          ),
          Container(height: 60, child: SliderExample()),
          const Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Text(
                  'Total time',
                  style: TextStyle(fontSize: 20),
                )
              ],
            ),
          ),
          Container(height: 60, child: SliderExample()),
          const Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Text(
                  'Calories',
                  style: TextStyle(fontSize: 20),
                )
              ],
            ),
          ),
          Container(height: 60, child: SliderExample()),
          const SizedBox(
            height: 20,
          ),
          ElevatedButton(
            onPressed: () {
              Provider.of<RecipesProvider>(listen: false, context)
                  .getFilteredResult();
              // Navigator.push(context,
              //     MaterialPageRoute(builder: (_) => SelectedRecipesPage()));
            },
            child: Text(
              'Apply',
              style: TextStyle(fontSize: 28, color: Colors.white),
            ),
            style: ElevatedButton.styleFrom(
                fixedSize: Size(300, 60),
                backgroundColor: ColoresConst.mainColor),
          ),
        ],
      ),
    );
  }
}
