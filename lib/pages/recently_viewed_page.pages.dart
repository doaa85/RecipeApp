import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flexible_grid_view/flexible_grid_view.dart';
import 'package:flutter/material.dart';
import 'package:recipe_app/models/recipes.model.dart';
import 'package:recipe_app/widgets/custom_search_widget.widgets.dart';
import 'package:recipe_app/widgets/recipe_recently_widget.widgets.dart';

// ignore: must_be_immutable
class RecentlyViewedPage extends StatefulWidget {
  const RecentlyViewedPage({super.key});

  @override
  State<RecentlyViewedPage> createState() => _RecentlyViewedPageState();
}

class _RecentlyViewedPageState extends State<RecentlyViewedPage> {
  @override
  @override
  Widget build(BuildContext context) {
    return Scaffold(
    
      appBar: const PreferredSize(
          preferredSize: Size.square(60.0), child: CustomSearchWidget()),

      body: Column(
        children: [
          const Text(
            'Recently Viewed',
            style: TextStyle(fontSize: 24),
          ),
          SizedBox(
            height: 30,
          ),
          StreamBuilder(
              stream: FirebaseFirestore.instance
                  .collection('recipes')
                  .where("recently_viewd_users_ids",
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
                        height: 250,
                        child: Flexible(
                          child: FlexibleGridView(
                            shrinkWrap: true,
                            children: recipesList
                                .map((e) => RecipeWidgetRecently(recipe: e))
                                .toList(),
                            axisCount: GridLayoutEnum.twoElementsInRow,
                            crossAxisSpacing: 8,
                            mainAxisSpacing: 8,
                          ),
                        ),
                      );
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
