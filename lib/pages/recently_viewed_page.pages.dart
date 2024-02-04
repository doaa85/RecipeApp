import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:recipe_app/models/recipes.model.dart';
import 'package:recipe_app/pages/filter_page.pages.dart';
import 'package:recipe_app/pages/home_page.pages.dart';
import 'package:recipe_app/utilities/colores.dart';
import 'package:recipe_app/utilities/numbers.dart';
import 'package:recipe_app/widgets/recipe_recently_widget.widgets.dart';

class RecentlyViewedPage extends StatefulWidget {
  const RecentlyViewedPage({super.key});

  @override
  State<RecentlyViewedPage> createState() => _RecentlyViewedPageState();
}

class _RecentlyViewedPageState extends State<RecentlyViewedPage> {
  Recipe recipe = Recipe();
  @override
  // void initState() {
  //   Provider.of<RecipesProvider>(context, listen: false)
  //       .addRecipeToUserRecentlyViewed(widget.recipe.docId!);
  //   super.initState();
  // }

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
              child: IconButton(
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
                  'Recently Viewed',
                  style: TextStyle(fontSize: 20),
                ),
              ],
            ),
          ),
          Row(
            children: [
              Container(
                height: 40,
                width: 180,
                padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 8),
                decoration: BoxDecoration(
                    color: ColoresConst.kprimaryColor,
                    borderRadius: BorderRadius.circular(12)),
                child: const TextField(
                  cursorColor: ColoresConst.kDarkColor,
                  decoration: InputDecoration(
                      border: InputBorder.none,
                      prefixIcon: Icon(
                        Icons.search,
                        color: Colors.grey,
                        size: 20,
                      ),
                      hintText: "Search for recipes",
                      hintStyle: TextStyle(color: Colors.black, fontSize: 13)),
                ),
              ),
              const SizedBox(
                width: 30,
              ),
              SizedBox(
                width: 40,
                child: GestureDetector(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (_) => FilterPage()));
                  },
                  child: Container(
                    height: 30,
                    padding: const EdgeInsets.all(5),
                    decoration: BoxDecoration(
                        color: ColoresConst.kprimaryColor,
                        borderRadius: BorderRadius.circular(12)),
                    child: const Icon(
                      Icons.tune,
                      size: 20,
                    ),
                  ),
                ),
              )
            ],
          ),
          StreamBuilder(
              stream: FirebaseFirestore.instance
                  .collection('recipes')
                  .where("recently_viewed_users_ids",
                      arrayContains: FirebaseAuth.instance.currentUser!.uid)
                  .snapshots(),
              builder: (context, snapshots) {
                if (snapshots.connectionState == ConnectionState.waiting) {
                  return const CircularProgressIndicator();
                } else {
                  if (snapshots.hasError) {
                    return const Text('ERROR WHEN GET DATA');
                  } else {
                    if (snapshots.hasData) {
                      List<Recipe> recipesList = snapshots.data?.docs
                              .map((e) => Recipe.fromJson(e.data(), e.id))
                              .toList() ??
                          [];
                      return SizedBox(
                          height: 350,
                          // child: FlexibleGridView(
                          //   children: recipesList
                          //       .map((e) => RecipeWidgetRecently(recipe: e))
                          //       .toList(),
                          //   axisCount: GridLayoutEnum.twoElementsInRow,
                          //   crossAxisSpacing: 8,
                          //   mainAxisSpacing: 8,
                          // ),
                          child: ListView.builder(
                              shrinkWrap: true,
                              itemBuilder: (context, Index) {
                                recipesList
                                    .map((e) => RecipeWidgetRecently(recipe: e))
                                    .toList();
                              },
                              itemCount: recipesList.length));
                    } else {
                      return const Text('No Data Found');
                    }
                  }
                }
              }),
        ],
      ),
    );
  }
}
