import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:recipe_app/provider/favourite.provider.dart';
import 'package:recipe_app/utilities/numbers.dart';

import '../utilities/colores.dart';

class FavouritePage extends StatefulWidget {
  const FavouritePage({super.key});

  @override
  State<FavouritePage> createState() => _FavouritePageState();
}

class _FavouritePageState extends State<FavouritePage> {
  List recommendedList = [
    {'image': 'assets/images/muffins_small.png', 'name': 'Blueberry Muffins'},
    {'image': 'assets/images/salmon_small.png', 'name': 'Glazed Salmon'},
    // {
    //   'image': 'assets/images/460x533_ChickenThighs_2 copy.png',
    //   'name': 'Asian Glazed Chicken Things'
    // }
  ];
  @override
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
              child: Icon(Icons.notifications),
            )
          ],
        ),
        backgroundColor: ColoresConst.kLightColor,
        body: Container(
            margin: const EdgeInsets.only(top: 5, left: 20, right: 20),
            child: Column(children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    'Favourits',
                    style: TextStyle(fontSize: 15, color: Colors.grey),
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: Container(
                          height: 30,
                          padding: const EdgeInsets.symmetric(
                              vertical: 5, horizontal: 6),
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
                                hintStyle: TextStyle(
                                    color: Colors.black, fontSize: 13)),
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 30,
                      ),
                      Expanded(
                        child: GestureDetector(
                          onTap: () {},
                          child: Container(
                            height: 30,
                            padding: const EdgeInsets.all(5),
                            decoration: BoxDecoration(
                                color: ColoresConst.kprimaryColor,
                                borderRadius: BorderRadius.circular(12)),
                            child: Icon(
                              Icons.tune,
                              size: 20,
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                  Flexible(
                    child: ListView.builder(
                        // physics: NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: recommendedList.length,
                        padding: EdgeInsets.zero,
                        itemBuilder: (context, index) {
                          return Container(
                            height: 140,
                            width: MediaQuery.of(context).size.width,
                            padding: const EdgeInsets.symmetric(
                                horizontal: 7, vertical: 7),
                            margin: EdgeInsets.only(bottom: 8),
                            decoration: BoxDecoration(
                                color: ColoresConst.kprimaryColor,
                                borderRadius: BorderRadius.circular(18)),
                            child: Row(
                              children: [
                                Image.asset(
                                  recommendedList[index]['image'],
                                  height: 30,
                                  width: 50,
                                  fit: BoxFit.contain,
                                ),
                                Expanded(
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 12),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        const Text(
                                          'Breakfast',
                                          style: TextStyle(
                                              color: ColoresConst.kBlueColor,
                                              fontSize: 10,
                                              fontWeight: FontWeight.bold),
                                        ),
                                        const SizedBox(
                                          height: 7,
                                        ),
                                        Container(
                                          width: 130,
                                          child: Text(
                                            recommendedList[index]['name'],
                                            overflow: TextOverflow.ellipsis,
                                            style: TextStyle(
                                                fontSize: 12,
                                                fontFamily: 'Hellix_Bold'),
                                          ),
                                        ),
                                        const SizedBox(
                                          height: 8,
                                        ),
                                        Row(
                                          children: List.generate(
                                            5,
                                            (index) => const Icon(
                                              Icons.star,
                                              color: ColoresConst.mainColor,
                                              size: 15,
                                            ),
                                          ),
                                        ),
                                        const SizedBox(
                                          height: 8,
                                        ),
                                        const Text(
                                          '120 Calories',
                                          style: TextStyle(
                                              fontSize: 8,
                                              fontWeight: FontWeight.bold,
                                              color: ColoresConst.mainColor),
                                        ),
                                        const SizedBox(
                                          height: 8,
                                        ),
                                        const Row(
                                          children: [
                                            Icon(
                                              Icons.access_time,
                                              color: Colors.grey,
                                              size: 10,
                                            ),
                                            SizedBox(
                                              width: 7,
                                            ),
                                            Text(
                                              '10 mins',
                                              style: TextStyle(
                                                  fontSize: 8,
                                                  fontWeight: FontWeight.bold,
                                                  color: Colors.grey),
                                            ),
                                          ],
                                        ),
                                        Row(
                                          children: [
                                            Icon(
                                              Icons.room_service,
                                              size: 15,
                                            ),
                                            const SizedBox(
                                              width: 7,
                                            ),
                                            const Text(
                                              '1 Serving',
                                              style: TextStyle(
                                                  fontSize: 8,
                                                  color: Colors.grey),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                Align(
                                  alignment: Alignment.topRight,
                                  child: Container(
                                    height: 20,
                                    width: 30,
                                    child: IconButton(
                                      onPressed: () {
                                        Provider.of<FavouriteProvider>(context,
                                                listen: false)
                                            .addRecipeToUser;
                                      },
                                      icon: Icon(
                                        Icons.favorite_border,
                                        color: Colors.grey,
                                        size: 14,
                                      ),
                                    ),
                                  ),
                                )
                              ],
                            ),
                          );
                        }),
                  )
                ],
              ),
            ])));
  }
}
