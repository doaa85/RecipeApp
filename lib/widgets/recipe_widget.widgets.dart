import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:provider/provider.dart';
import 'package:recipe_app/models/recipes.model.dart';
import 'package:recipe_app/pages/recipe_detailes_page.pages.dart';
import 'package:recipe_app/provider/recipes_provider.dart';
import 'package:recipe_app/utilities/colores.dart';
import 'package:recipe_app/utilities/numbers.dart';

// class RecipeWidget extends StatefulWidget {
//   final Recipe? recipe;

//   const RecipeWidget({required this.recipe, super.key});

//   @override
//   State<RecipeWidget> createState() => _RecipeWidgetState();
// }

// class _RecipeWidgetState extends State<RecipeWidget> {
//   @override
//   void initState() {
//     Provider.of<RecipesProvider>(context, listen: false)
//         .addRecipeToUserFavourite;
//     super.initState();
//   }

//   bool get isInList => (widget.recipe?.favourite_users_ids
//           ?.contains(FirebaseAuth.instance.currentUser?.uid) ??
//       false);

//   Widget build(BuildContext context) {
//     return Padding(
//       padding:
//           const EdgeInsets.symmetric(horizontal: Numbers.appHorizontalPadding),
//       child: Stack(
//         children: [
//           InkWell(
//             onTap: () {
//               Navigator.push(
//                   context,
//                   MaterialPageRoute(
//                       builder: (_) => RecipeDetailsPage(
//                             recipe: widget.recipe!,
//                           )));
//             },
//             child: Container(
//               width: 160,
//               height: 200,
//               decoration: BoxDecoration(
//                 borderRadius: BorderRadius.circular(20),
//                 color: ColoresConst.kprimaryColor,
//               ),
//               child: Padding(
//                 padding: const EdgeInsets.all(15.0),
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.stretch,
//                   children: [
//                     Transform.translate(
//                       offset: const Offset(45, 0),
//                       child: Image.network(
//                         widget.recipe?.imageUrl ?? "",
//                         fit: BoxFit.cover,
//                         width: 110,
//                         height: 50,
//                       ),
//                     ),
//                     Text(
//                       widget.recipe?.type ?? 'No Type Found',
//                       style: const TextStyle(
//                         color: ColoresConst.titleColor,
//                         fontSize: 8,
//                         fontWeight: FontWeight.w500,
//                       ),
//                     ),
//                     const SizedBox(
//                       height: 3,
//                     ),
//                     Text(
//                       widget.recipe?.title ?? "",
//                       maxLines: 1,
//                       overflow: TextOverflow.ellipsis,
//                       style: const TextStyle(
//                         fontSize: 12,
//                         fontWeight: FontWeight.w500,
//                       ),
//                     ),
//                     const SizedBox(
//                       height: 4,
//                     ),
//                     RatingBar.builder(
//                       initialRating: 4,
//                       minRating: 1,
//                       direction: Axis.horizontal,
//                       allowHalfRating: true,
//                       updateOnDrag: false,
//                       unratedColor: Colors.grey,
//                       itemCount: 5,
//                       itemSize: 15,
//                       itemBuilder: (context, _) => const Icon(
//                         Icons.star,
//                         color: Colors.amber,
//                       ),
//                       onRatingUpdate: (rate) {
//                         print(rate);
//                       },
//                     ),
//                     const SizedBox(
//                       height: 4,
//                     ),
//                     Text(
//                       widget.recipe?.calories.toString() ?? '',
//                       style: const TextStyle(
//                         fontSize: 8,
//                         fontWeight: FontWeight.normal,
//                       ),
//                     ),
//                     const SizedBox(
//                       height: 4,
//                     ),
//                     Row(
//                       children: [
//                         const Icon(
//                           Icons.access_time,
//                           size: 16,
//                           color: Colors.grey,
//                         ),
//                         const SizedBox(
//                           width: 5,
//                         ),
//                         Text(
//                           widget.recipe?.total_time.toString() ?? "",
//                           style: const TextStyle(
//                             fontSize: 8,
//                             fontWeight: FontWeight.normal,
//                             color: Colors.grey,
//                           ),
//                         ),
//                         const Spacer(),
//                         const Icon(
//                           Icons.room_service_outlined,
//                           size: 16,
//                           color: Colors.grey,
//                         ),
//                         const SizedBox(
//                           width: 5,
//                         ),
//                         Text(
//                           "${widget.recipe?.servings ?? 0}",
//                           style: const TextStyle(
//                             fontSize: 8,
//                             fontWeight: FontWeight.normal,
//                             color: Colors.grey,
//                           ),
//                         ),
//                       ],
//                     )
//                   ],
//                 ),
//               ),
//             ),
//           ),
//           Padding(
//               padding: const EdgeInsets.all(16.0),
//               child: InkWell(
//                   onTap: () {
//                     Provider.of<RecipesProvider>(context, listen: false)
//                         .addRecipeToUserFavourite(
//                             widget.recipe!.docId!,
//                             !(widget.recipe?.favourite_users_ids?.contains(
//                                     FirebaseAuth.instance.currentUser?.uid) ??
//                                 false));
//                     // Navigator.push(context,
//                     //     MaterialPageRoute(builder: (_) => FavouritesPage()));
//                   },
//                   // child: (widget.recipe?.favourite_users_ids?.contains(
//                   //             FirebaseAuth.instance.currentUser?.uid) ??
//                   //         false
//                   child: isInList
//                       ? Icon(
//                           Icons.favorite_border_rounded,
//                           size: 25,
//                           color: Colors.red,
//                         )
//                       : Icon(
//                           Icons.favorite_rounded,
//                           size: 25,
//                           color: Colors.grey,
//                         ))),
//         ],
//       ),
//     );
//   }
// }

class RecipeWidget extends StatefulWidget {
  final Recipe? recipe;

  const RecipeWidget({required this.recipe, super.key});

  @override
  State<RecipeWidget> createState() => _RecipeWidgetState();
}

class _RecipeWidgetState extends State<RecipeWidget> {
  @override
  Widget build(BuildContext context) {
    bool isFavourite = true;
    return Padding(
      padding:
          const EdgeInsets.symmetric(horizontal: Numbers.appHorizontalPadding),
      child: Stack(
        children: [
          InkWell(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (_) => RecipeDetailsPage(
                            recipe: widget.recipe!,
                          )));
            },
            child: Container(
              width: 160,
              height: 230,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: ColoresConst.kprimaryColor),
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Transform.translate(
                      offset: const Offset(40, 0),
                      child: Image.network(
                        widget.recipe?.imageUrl ?? "",
                        fit: BoxFit.cover,
                        width: 60,
                        height: 40,
                      ),
                    ),
                    Text(
                      widget.recipe?.type ?? 'No Type Found',
                      style: TextStyle(
                        color: ColoresConst.titleColor,
                        fontSize: 7,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    const SizedBox(
                      height: 3,
                    ),
                    Text(
                      widget.recipe?.title ?? "",
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    const SizedBox(
                      height: 3,
                    ),
                    RatingBar.builder(
                      initialRating: 4,
                      minRating: 1,
                      direction: Axis.horizontal,
                      allowHalfRating: true,
                      updateOnDrag: false,
                      unratedColor: Colors.grey,
                      itemCount: 5,
                      itemSize: 13,
                      itemBuilder: (context, _) => const Icon(
                        Icons.star,
                        color: Colors.amber,
                      ),
                      onRatingUpdate: (rating) {
                        print(rating);
                      },
                    ),
                    const SizedBox(
                      height: 7,
                    ),
                    Text(
                      widget.recipe?.calories.toString() ?? '',
                      style: const TextStyle(
                        fontSize: 7,
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Row(
                      children: [
                        const Icon(
                          Icons.access_time,
                          size: 18,
                          color: Colors.grey,
                        ),
                        const SizedBox(
                          width: 5,
                        ),
                        Text(
                          widget.recipe?.total_time.toString() ?? "",
                          style: const TextStyle(
                            fontSize: 7,
                            fontWeight: FontWeight.normal,
                            color: Colors.grey,
                          ),
                        ),
                        const Spacer(),
                        const Icon(
                          Icons.room_service_outlined,
                          size: 18,
                          color: Colors.grey,
                        ),
                        const SizedBox(
                          width: 5,
                        ),
                        Text(
                          "${widget.recipe?.servings ?? 0}",
                          style: const TextStyle(
                            fontSize: 7,
                            fontWeight: FontWeight.normal,
                            color: Colors.grey,
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: InkWell(
                onTap: () {
                  Provider.of<RecipesProvider>(context, listen: false)
                      .addRecipeToUserFavourite(
                          widget.recipe!.docId!,
                          !(widget.recipe?.favourite_users_ids?.contains(
                                  FirebaseAuth.instance.currentUser?.uid) ??
                              false));
                  setState(() {});
                },
                child: (widget.recipe?.favourite_users_ids?.contains(
                            FirebaseAuth.instance.currentUser?.uid) ??
                        true
                    ? const Icon(Icons.favorite_border_rounded,
                        size: 30, color: Colors.red)
                    : const Icon(
                        Icons.favorite_rounded,
                        size: 30,
                        color: Colors.grey,
                      ))),
          ),
        ],
      ),
    );
  }
}
