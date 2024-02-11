import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:recipe_app/models/recipes.model.dart';
import 'package:recipe_app/provider/recipes_provider.dart';
import 'package:recipe_app/widgets/recipe_widget.widgets.dart';

class SelectedRecipesPage extends StatefulWidget {
  const SelectedRecipesPage({super.key});

  @override
  State<SelectedRecipesPage> createState() => _SelectedRecipesPageState();
}

class _SelectedRecipesPageState extends State<SelectedRecipesPage> {
  List<Recipe> get recipesList => recipesList;

  @override
  void initState() {
    Provider.of<RecipesProvider>(listen: false, context).getFilteredResult();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: ListView.builder(
        itemCount: recipesList.length,
        itemBuilder: (context, index) {
          return Column(
            children: recipesList.map((e) => RecipeWidget(recipe: e)).toList(),
          );
        },
      ),
    );
  }
}
