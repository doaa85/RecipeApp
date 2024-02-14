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

  get selectedUserValue => selectedUserValue;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:const Text('Selected Recipes'),
      ),
      body: Flexible(
        child: Consumer<RecipesProvider>(
            builder: (ctx, recipesProvider, _) => recipesProvider
                        .filteredRecipesList ==
                    null
                ? const CircularProgressIndicator()
                : (recipesProvider.filteredRecipesList?.isEmpty ?? false)
                    ? const Text('No Data Found')
                    : ListView.builder(
                        shrinkWrap: true,
                        physics: AlwaysScrollableScrollPhysics(),
                        scrollDirection: Axis.horizontal,
                        itemCount: recipesProvider.filteredRecipesList!.length,
                        itemBuilder: (ctx, index) => RecipeWidget(
                              recipe:
                                  recipesProvider.filteredRecipesList![index],
                            ))),
      ),
    );
  }
}
