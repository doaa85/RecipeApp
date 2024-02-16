import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flexible_grid_view/flexible_grid_view.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:recipe_app/models/recipes.model.dart';
import 'package:recipe_app/provider/recipes_provider.dart';
import 'package:recipe_app/widgets/recipe_widget.widgets.dart';

class FavouritesPage extends StatefulWidget {
  const FavouritesPage({super.key});

  @override
  State<FavouritesPage> createState() => _FavouritesPageState();
}

class _FavouritesPageState extends State<FavouritesPage> {
  @override
  void initState() {
    Provider.of<RecipesProvider>(context, listen: false).updateRecipe;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    String query = '';
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Text('Favourits', style: TextStyle(fontSize: 24)),
            const SizedBox(
              height: 20,
            ),
            Container(
              height: 35,
              child: TextFormField(
                  style: const TextStyle(color: Colors.blue),
                  decoration: const InputDecoration(
                      focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.black)),
                      enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.black)),
                      border: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.blue)),
                      fillColor: Colors.transparent,
                      filled: true,
                      hintStyle: TextStyle(color: Colors.blue),
                      hintText: 'Search for favourits',
                      prefixIcon: Icon(
                        Icons.search,
                        color: Colors.grey,
                      )),
                  onChanged: (value) => setState(() {
                        query == value;
                      })),
            ),
            SizedBox(
              height: 10,
            ),
            SizedBox(
              height: 200,
              child: StreamBuilder(
                  stream: FirebaseFirestore.instance
                      .collection('recipes')
                      .where("favourite_users_ids",
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
                                  .where((recipe) => recipe.title!
                                      .toUpperCase()
                                      .contains(query.toUpperCase()))
                                  .toList() ??
                              [];
                              

                          return FlexibleGridView(
                            children: recipesList
                                .map((e) => RecipeWidget(recipe: e))
                                .toList(),
                            axisCount: GridLayoutEnum.twoElementsInRow,
                            crossAxisSpacing: 8,
                            mainAxisSpacing: 8,
                          );
                        } else {
                          return const Text('No Data Found');
                        }
                      }
                    }
                  }),
            ),
          ],
        ),
      ),
    );
  }
}
