import 'dart:core';

import 'package:flutter/material.dart';
import 'package:recipe_app/models/recipes.model.dart';

// ignore: must_be_immutable
class CustomCard extends StatelessWidget {
  CustomCard({
    required this.recipe,
    super.key,
  });

  Recipe recipe;

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        const Icon(
          Icons.favorite,
          color: Colors.red,
        ),
        Container(
          decoration: BoxDecoration(boxShadow: [
            BoxShadow(
                blurRadius: 40,
                color: Colors.grey.withOpacity(.2),
                spreadRadius: 0,
                offset: const Offset(10, 10))
          ]),
          child: Card(
            elevation: 10,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '${recipe.type}',
                    style: const TextStyle(color: Colors.grey, fontSize: 16),
                  ),
                  Text(
                    '${recipe.description}',
                    style: const TextStyle(fontSize: 16),
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                 const  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                       Icon(
                        Icons.star,
                        color: Colors.red,
                      ),
                       Icon(
                        Icons.star,
                        color: Colors.red,
                      ),
                       Icon(
                        Icons.star,
                        color: Colors.red,
                      ),
                       Icon(
                        Icons.star,
                        color: Colors.red,
                      ),
                       Icon(
                        Icons.star,
                        color: Colors.red,
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    '${recipe.calories} calories',
                    style: TextStyle(color: Colors.grey),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Icon(Icons.timelapse),
                      Text(
                        '${recipe.total_time} preptime',
                        style: TextStyle(color: Colors.grey),
                      ),
                      Icon(Icons.room_service_rounded),
                      Text(
                        '${recipe.servings} serving',
                        style: TextStyle(color: Colors.grey),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
        Positioned(
            right: 32,
            top: -35,
            child: Image.network(
              recipe.imageUrl!,
              height: 100,
              width: 100,
            ))
      ],
    );
  }
}
