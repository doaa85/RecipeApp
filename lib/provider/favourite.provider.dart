import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:overlay_kit/overlay_kit.dart';
import 'package:recipe_app/models/recipes.model.dart';
import 'package:recipe_app/utilities/toast_messege_status.utils.dart';
import 'package:recipe_app/widgets/toast_messege_widget.widgets.dart';

class FavouriteProvider extends ChangeNotifier {
  List<Recipe>? _recipesList;

  List<Recipe>? get ingredientsList => _recipesList;

  Future<void> getRecips() async {
    try {
      var result = await FirebaseFirestore.instance.collection('Recipes').get();

      if (result.docs.isNotEmpty) {
        _recipesList = List<Recipe>.from(
            result.docs.map((doc) => Recipe.fromJson(doc.data(), doc.id)));
      } else {
        _recipesList = [];
      }
      notifyListeners();
    } catch (e) {
      _recipesList = [];
      notifyListeners();
    }
  }

  Future<void> addRecipeToUser(String RecipeId, bool isAdd) async {
    try {
      OverlayLoadingProgress.start();
      if (isAdd) {
        await FirebaseFirestore.instance
            .collection('Recipes')
            .doc(RecipeId)
            .update({
          "users_ids":
              FieldValue.arrayUnion([FirebaseAuth.instance.currentUser?.uid])
        });
      } else {
        await FirebaseFirestore.instance
            .collection('Recipes')
            .doc(RecipeId)
            .update({
          "users_ids":
              FieldValue.arrayRemove([FirebaseAuth.instance.currentUser?.uid])
        });
      }
      OverlayLoadingProgress.stop();
      getRecips();
    } catch (e) {
      OverlayLoadingProgress.stop();
      OverlayToastMessage.show(
        widget: ToastMessageWidget(
          message: 'Error : ${e.toString()}',
          toastMessageStatus: ToastMessageStatus.failed,
        ),
      );
    }
  }
}
