import 'package:flutter/material.dart';
import 'package:recipe_app/pages/home_page.pages.dart';
import 'package:recipe_app/utilities/numbers.dart';

class CustomSearchWidget extends StatefulWidget {
  const CustomSearchWidget({super.key});

  @override
  State<CustomSearchWidget> createState() => _CustomSearchWidgetState();
}

class _CustomSearchWidgetState extends State<CustomSearchWidget> {
  var searchRecipesName;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          // title: const Text(' '),
          leading: Padding(
            padding: const EdgeInsets.symmetric(
                horizontal: Numbers.appHorizontalPadding),
            child: InkWell(
              child: const Icon(
                Icons.menu,
                size: 30,
              ),
              onTap: () {
                Navigator.push(
                    context, MaterialPageRoute(builder: (_) => HomePage()));
              },
            ),
          ),
          actions: [
            Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: Numbers.appHorizontalPadding),
                child: IconButton(
                  onPressed: () {
                    showSearch(context: context, delegate: CustomSearch());
                  },
                  icon: const Icon(
                    Icons.search,
                    size: 35,
                  ),
                ))
          ],
        ),
        body: const Column(
          children: [],
        ));
  }
}

class CustomSearch extends SearchDelegate {
  var filteredSearchList;

  var searchRecipesName = [
    ' Broccoli Chicken Casserole',
    'Chicken, Broccoli, and Cheddar Casserole',
    'Slow Cooker Cheesy Cauliflower Casserole',
    'Broccoli Cauliflower Casserole',
    "Grandma's Hash Brown Casserole"
  ];

  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
          onPressed: () {
            query == " ";
          },
          icon: const Icon(Icons.close))
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
        onPressed: () {
          close(context, null);
        },
        icon: const Icon(Icons.arrow_back));
  }

  @override
  Widget buildResults(BuildContext context) {
    return Text(
      "Result  $filteredSearchList",
      style: TextStyle(color: Colors.black, fontSize: 22),
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    if (query == " ") {
      return ListView.builder(
          itemCount: searchRecipesName.length,
          itemBuilder: (context, Index) {
            return InkWell(
              onTap: () {
                showResults(context);
              },
              child: Padding(
                padding: const EdgeInsets.all(4.0),
                child: Card(
                  child: Padding(
                    padding: EdgeInsets.all(16),
                    child: Text(
                      "${searchRecipesName[Index]}",
                      style: TextStyle(fontSize: 16),
                    ),
                  ),
                ),
              ),
            );
          });
    } else {
      filteredSearchList = searchRecipesName
          .where((element) => element.startsWith(query))
          .toList();
      return ListView.builder(
          itemCount: filteredSearchList.length,
          itemBuilder: (context, Index) {
            return InkWell(
              onTap: () {
                showResults(context);
              },
              child: Padding(
                padding: const EdgeInsets.all(4.0),
                child: Card(
                  child: Padding(
                    padding: EdgeInsets.all(16),
                    child: Text(
                      "${filteredSearchList[Index]}",
                      style: TextStyle(fontSize: 16),
                    ),
                  ),
                ),
              ),
            );
          });
    }
  }
}
