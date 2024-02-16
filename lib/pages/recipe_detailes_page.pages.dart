import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:provider/provider.dart';
import 'package:recipe_app/models/ingredient.model.dart';
import 'package:recipe_app/models/recipes.model.dart';
import 'package:recipe_app/provider/recipes_provider.dart';
import 'package:recipe_app/utilities/colores.dart';

class RecipeDetailsPage extends StatefulWidget {
  final Recipe recipe;
  const RecipeDetailsPage({required this.recipe, super.key});

  @override
  State<RecipeDetailsPage> createState() => _RecipeDetailsPageState();
}

class _RecipeDetailsPageState extends State<RecipeDetailsPage> {
  @override
  void initState() {
    Provider.of<RecipesProvider>(context, listen: false)
        .addRecipeToUserRecentlyViewed(widget.recipe.docId!);

    super.initState();
  }

  bool isColored = false;

  bool get isInList => (widget.recipe.favourite_users_ids
          ?.contains(FirebaseAuth.instance.currentUser?.uid) ??
      false);
  @override
  Widget build(BuildContext context) {
    return Consumer<RecipesProvider>(
        builder: (context, recipesProvider, _) => Scaffold(
              appBar: AppBar(
                title: Text('Details page'),
              ),
              body: Padding(
                padding: const EdgeInsets.all(5),
                child: SingleChildScrollView(
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          widget.recipe?.type ?? 'No Type Found',
                          style: const TextStyle(
                            color: ColoresConst.titleColor,
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Row(
                          children: [
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
                              width: 5,
                            ),
                            InkWell(
                                onTap: () {
                                  //   Provider.of<RecipesProvider>(context, listen: false)
                                  //       .addRecipeToUserFavourite(
                                  //           widget.recipe.docId!, isInList);
                                  //   print(isInList);

                                  //   if (isInList) {
                                  //     widget.recipe.favourite_users_ids
                                  //         ?.remove(FirebaseAuth.instance.currentUser?.uid);
                                  //     setState(() {});
                                  //   } else {
                                  //     widget.recipe.favourite_users_ids
                                  //         ?.add(FirebaseAuth.instance.currentUser!.uid);
                                  //   }

                                  //   setState(() {});
                                  // },
                                  // child: widget.recipe.favourite_users_ids?.contains(
                                  //             FirebaseAuth.instance.currentUser?.uid) ??false

                                  //     ?Icon(
                                  //         Icons.favorite_border_rounded,
                                  //         size: 30,
                                  //         color: Colors.red,
                                  //       )
                                  //     : Icon(
                                  //         Icons.favorite_rounded,
                                  //         size: 30,
                                  //         color: Colors.grey,
                                  Provider.of<RecipesProvider>(context,
                                          listen: false)
                                      .addRecipeToUserFavourite(
                                          widget.recipe.docId!, !isInList);

                                  if (isInList) {
                                    widget.recipe.favourite_users_ids?.remove(
                                        FirebaseAuth.instance.currentUser?.uid);

                                    setState(() {});
                                  } else {
                                    widget.recipe.favourite_users_ids?.add(
                                        FirebaseAuth.instance.currentUser!.uid);
                                  }

                                  setState(() {});
                                },
                                child: isInList
                                    ? const Icon(
                                        Icons.favorite_border_rounded,
                                        size: 30,
                                        color: Colors.red,
                                      )
                                    : const Icon(
                                        Icons.favorite_rounded,
                                        size: 30,
                                        color: Colors.grey,
                                      )),
                          ],
                        ),
                        const SizedBox(
                          height: 6,
                        ),
                        Row(
                          children: [
                            Text(
                              widget.recipe?.calories.toString() ?? '',
                              style: const TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.normal,
                              ),
                            ),
                            const SizedBox(
                              width: 15,
                            ),
                            const Text(
                              'Calories',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.normal,
                              ),
                            ),
                          ],
                        ),
                        RatingBar.builder(
                          initialRating: 4,
                          minRating: 1,
                          direction: Axis.horizontal,
                          allowHalfRating: true,
                          updateOnDrag: false,
                          unratedColor: Colors.grey,
                          itemCount: 5,
                          itemSize: 20,
                          itemBuilder: (context, _) => const Icon(
                            Icons.star,
                            color: Colors.amber,
                          ),
                          onRatingUpdate: (rate) {
                            print(rate);
                          },
                        ),
                        const SizedBox(
                          height: 7,
                        ),
                        const SizedBox(
                          height: 7,
                        ),
                        Container(
                          height: 70,
                          child: Row(
                            children: [
                              Column(
                                children: [
                                  Row(
                                    children: [
                                      const Icon(
                                        Icons.access_time,
                                        size: 25,
                                        color: Colors.grey,
                                      ),
                                      const SizedBox(
                                        width: 5,
                                      ),
                                      Text(
                                        widget.recipe?.total_time.toString() ??
                                            "",
                                        style: const TextStyle(
                                          fontSize: 12,
                                          fontWeight: FontWeight.normal,
                                          color: Colors.grey,
                                        ),
                                      ),
                                    ],
                                  )
                                  // const Spacer(),
                                  ,
                                  const SizedBox(
                                    height: 8,
                                  ),
                                  Row(
                                    children: [
                                      const Icon(
                                        Icons.room_service_outlined,
                                        size: 20,
                                        color: Colors.grey,
                                      ),
                                      const SizedBox(
                                        width: 5,
                                      ),
                                      Text(
                                        "${widget.recipe?.servings ?? 0}",
                                        style: const TextStyle(
                                          fontSize: 12,
                                          fontWeight: FontWeight.normal,
                                          color: Colors.grey,
                                        ),
                                      ),
                                    ],
                                  )
                                ],
                              ),
                              const SizedBox(
                                width: 150,
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  Flexible(
                                    child: Container(
                                      height: 70,
                                      child: Transform.translate(
                                        offset: const Offset(45, 0),
                                        child: Image.network(
                                          widget.recipe?.imageUrl ?? "",
                                          fit: BoxFit.cover,
                                          width: 120,
                                          height: 65,
                                        ),
                                      ),
                                    ),
                                  )
                                ],
                              )
                            ],
                          ),
                        ),
                        ListTile(
                          minLeadingWidth: MediaQuery.of(context).size.width,
                          subtitle: FutureBuilder(
                              future: FirebaseFirestore.instance
                                  .collection('ingredients')
                                  .where('users_ids',
                                      arrayContains: FirebaseAuth
                                          .instance.currentUser!.uid)
                                  .get(),
                              builder: (context, snapShot) {
                                if (snapShot.connectionState ==
                                    ConnectionState.waiting) {
                                  return const CircularProgressIndicator();
                                } else {
                                  var userIngredients = List<Ingredient>.from(
                                      snapShot.data!.docs
                                          .map((e) => Ingredient.fromJson(
                                              e.data(), e.id))
                                          .toList());

                                  var userIngredientsTitles = userIngredients
                                      .map((e) => e.name)
                                      .toList();
                                  Widget checkIngredientWidget(
                                      String recipeIngredient) {
                                    bool isExsist = false;
                                    for (var userIngredientsTitle
                                        in userIngredientsTitles) {
                                      if (recipeIngredient
                                          .contains(userIngredientsTitle!)) {
                                        isExsist = true;
                                        break;
                                      } else {
                                        isExsist = false;
                                      }
                                    }

                                    if (isExsist) {
                                      return Icon(
                                        Icons.check,
                                        size: 20,
                                      );
                                    } else {
                                      return Icon(
                                        Icons.close,
                                        size: 20,
                                      );
                                    }
                                  }

                                  return Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: widget.recipe.ingredients
                                            ?.map((e) => Row(
                                                  children: [
                                                    Text(
                                                      e,
                                                      overflow:
                                                          TextOverflow.ellipsis,
                                                    ),
                                                    checkIngredientWidget(e)
                                                  ],
                                                ))
                                            .toList() ??
                                        [],
                                  );
                                }
                              }),
                          title: Text(widget.recipe.title ?? 'No Title'),
                        ),
                        const Text(
                          'directions',
                          style: TextStyle(fontSize: 25),
                        ),
                        SizedBox(
                            height: 250,
                            child: Text(widget.recipe.directions.toString())),
                      ]),
                ),
              ),
            ));
  }
}
  //   return Scaffold(
  //     appBar: AppBar(
  //       title: Text('Details page'),
  //     ),
  //     body: Padding(
  //       padding: const EdgeInsets.all(5),
  //       child: SingleChildScrollView(
  //         child:
  //             Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
  //           Text(
  //             widget.recipe?.type ?? 'No Type Found',
  //             style: const TextStyle(
  //               color: ColoresConst.titleColor,
  //               fontSize: 16,
  //               fontWeight: FontWeight.w500,
  //             ),
  //           ),
  //           const SizedBox(
  //             height: 5,
  //           ),
  //           Row(
  //             children: [
  //               Text(
  //                 widget.recipe?.title ?? "",
  //                 maxLines: 1,
  //                 overflow: TextOverflow.ellipsis,
  //                 style: const TextStyle(
  //                   fontSize: 12,
  //                   fontWeight: FontWeight.w500,
  //                 ),
  //               ),
  //               const SizedBox(
  //                 width: 5,
  //               ),
  //               InkWell(
  //                   onTap: () {
  //                     //   Provider.of<RecipesProvider>(context, listen: false)
  //                     //       .addRecipeToUserFavourite(
  //                     //           widget.recipe.docId!, isInList);
  //                     //   print(isInList);

  //                     //   if (isInList) {
  //                     //     widget.recipe.favourite_users_ids
  //                     //         ?.remove(FirebaseAuth.instance.currentUser?.uid);
  //                     //     setState(() {});
  //                     //   } else {
  //                     //     widget.recipe.favourite_users_ids
  //                     //         ?.add(FirebaseAuth.instance.currentUser!.uid);
  //                     //   }

  //                     //   setState(() {});
  //                     // },
  //                     // child: widget.recipe.favourite_users_ids?.contains(
  //                     //             FirebaseAuth.instance.currentUser?.uid) ??false

  //                     //     ?Icon(
  //                     //         Icons.favorite_border_rounded,
  //                     //         size: 30,
  //                     //         color: Colors.red,
  //                     //       )
  //                     //     : Icon(
  //                     //         Icons.favorite_rounded,
  //                     //         size: 30,
  //                     //         color: Colors.grey,
  //                     Provider.of<RecipesProvider>(context, listen: false)
  //                         .addRecipeToUserFavourite(
  //                             widget.recipe.docId!, !isInList);

  //                     if (isInList) {
  //                       widget.recipe.favourite_users_ids
  //                           ?.remove(FirebaseAuth.instance.currentUser?.uid);
  //                     } else {
  //                       widget.recipe.favourite_users_ids
  //                           ?.add(FirebaseAuth.instance.currentUser!.uid);
  //                     }

  //                     setState(() {});
  //                   },
  //                   child: isColored
  //                       ? const Icon(
  //                           Icons.favorite_border_rounded,
  //                           size: 30,
  //                           color: Colors.red,
  //                         )
  //                       : const Icon(
  //                           Icons.favorite_rounded,
  //                           size: 30,
  //                           color: Colors.grey,
  //                         )),
  //             ],
  //           ),
  //           const SizedBox(
  //             height: 6,
  //           ),
  //           Row(
  //             children: [
  //               Text(
  //                 widget.recipe?.calories.toString() ?? '',
  //                 style: const TextStyle(
  //                   fontSize: 15,
  //                   fontWeight: FontWeight.normal,
  //                 ),
  //               ),
  //               const SizedBox(
  //                 width: 15,
  //               ),
  //               const Text(
  //                 'Calories',
  //                 style: TextStyle(
  //                   fontSize: 16,
  //                   fontWeight: FontWeight.normal,
  //                 ),
  //               ),
  //             ],
  //           ),
  //           RatingBar.builder(
  //             initialRating: 4,
  //             minRating: 1,
  //             direction: Axis.horizontal,
  //             allowHalfRating: true,
  //             updateOnDrag: false,
  //             unratedColor: Colors.grey,
  //             itemCount: 5,
  //             itemSize: 20,
  //             itemBuilder: (context, _) => const Icon(
  //               Icons.star,
  //               color: Colors.amber,
  //             ),
  //             onRatingUpdate: (rate) {
  //               print(rate);
  //             },
  //           ),
  //           const SizedBox(
  //             height: 7,
  //           ),
  //           const SizedBox(
  //             height: 7,
  //           ),
  //           Container(
  //             height: 70,
  //             child: Row(
  //               children: [
  //                 Column(
  //                   children: [
  //                     Row(
  //                       children: [
  //                         const Icon(
  //                           Icons.access_time,
  //                           size: 25,
  //                           color: Colors.grey,
  //                         ),
  //                         const SizedBox(
  //                           width: 5,
  //                         ),
  //                         Text(
  //                           widget.recipe?.total_time.toString() ?? "",
  //                           style: const TextStyle(
  //                             fontSize: 12,
  //                             fontWeight: FontWeight.normal,
  //                             color: Colors.grey,
  //                           ),
  //                         ),
  //                       ],
  //                     )
  //                     // const Spacer(),
  //                     ,
  //                     const SizedBox(
  //                       height: 8,
  //                     ),
  //                     Row(
  //                       children: [
  //                         const Icon(
  //                           Icons.room_service_outlined,
  //                           size: 20,
  //                           color: Colors.grey,
  //                         ),
  //                         const SizedBox(
  //                           width: 5,
  //                         ),
  //                         Text(
  //                           "${widget.recipe?.servings ?? 0}",
  //                           style: const TextStyle(
  //                             fontSize: 12,
  //                             fontWeight: FontWeight.normal,
  //                             color: Colors.grey,
  //                           ),
  //                         ),
  //                       ],
  //                     )
  //                   ],
  //                 ),
  //                 const SizedBox(
  //                   width: 150,
  //                 ),
  //                 Column(
  //                   crossAxisAlignment: CrossAxisAlignment.center,
  //                   children: [
  //                     const SizedBox(
  //                       height: 10,
  //                     ),
  //                     Flexible(
  //                       child: Container(
  //                         height: 70,
  //                         child: Transform.translate(
  //                           offset: const Offset(45, 0),
  //                           child: Image.network(
  //                             widget.recipe?.imageUrl ?? "",
  //                             fit: BoxFit.cover,
  //                             width: 120,
  //                             height: 65,
  //                           ),
  //                         ),
  //                       ),
  //                     )
  //                   ],
  //                 )
  //               ],
  //             ),
  //           ),
  //           ListTile(
  //             minLeadingWidth: MediaQuery.of(context).size.width,
  //             subtitle: FutureBuilder(
  //                 future: FirebaseFirestore.instance
  //                     .collection('ingredients')
  //                     .where('users_ids',
  //                         arrayContains: FirebaseAuth.instance.currentUser!.uid)
  //                     .get(),
  //                 builder: (context, snapShot) {
  //                   if (snapShot.connectionState == ConnectionState.waiting) {
  //                     return const CircularProgressIndicator();
  //                   } else {
  //                     var userIngredients = List<Ingredient>.from(snapShot
  //                         .data!.docs
  //                         .map((e) => Ingredient.fromJson(e.data(), e.id))
  //                         .toList());

  //                     var userIngredientsTitles =
  //                         userIngredients.map((e) => e.name).toList();
  //                     Widget checkIngredientWidget(String recipeIngredient) {
  //                       bool isExsist = false;
  //                       for (var userIngredientsTitle
  //                           in userIngredientsTitles) {
  //                         if (recipeIngredient
  //                             .contains(userIngredientsTitle!)) {
  //                           isExsist = true;
  //                           break;
  //                         } else {
  //                           isExsist = false;
  //                         }
  //                       }

  //                       if (isExsist) {
  //                         return Icon(
  //                           Icons.check,
  //                           size: 20,
  //                         );
  //                       } else {
  //                         return Icon(
  //                           Icons.close,
  //                           size: 20,
  //                         );
  //                       }
  //                     }

  //                     return Column(
  //                       crossAxisAlignment: CrossAxisAlignment.start,
  //                       children: widget.recipe.ingredients
  //                               ?.map((e) => Row(
  //                                     children: [
  //                                       Text(
  //                                         e,
  //                                         overflow: TextOverflow.ellipsis,
  //                                       ),
  //                                       checkIngredientWidget(e)
  //                                     ],
  //                                   ))
  //                               .toList() ??
  //                           [],
  //                     );
  //                   }
  //                 }),
  //             title: Text(widget.recipe.title ?? 'No Title'),
  //           ),
  //           const Text(
  //             'directions',
  //             style: TextStyle(fontSize: 25),
  //           ),
  //           SizedBox(
  //               height: 250, child: Text(widget.recipe.directions.toString())),
  //         ]),
  //       ),
  //     ),
  //   );
  // }

