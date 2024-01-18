import 'package:carousel_slider/carousel_slider.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:recipe_app/provider/recipe_provider.dart';
import 'package:recipe_app/utilities/colores.dart';
import 'package:recipe_app/utilities/numbers.dart';
import 'package:recipe_app/widgets/section_header.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List freshList = [
    {
      'image': 'assets/images/recipe1_small.png',
      'name': 'French Toast with Berries'
    },
    {
      'image': 'assets/images/salmon_small.png',
      'name': 'Glazed Salmon',
    },
  ];
  List recommendedList = [
    {'image': 'assets/images/muffins_small.png', 'name': 'Blueberry Muffins'},
    {'image': 'assets/images/salmon_small.png', 'name': 'Glazed Salmon'},
    // {
    //   'image': 'assets/images/460x533_ChickenThighs_2 copy.png',
    //   'name': 'Asian Glazed Chicken Things'
    // }
  ];
  var sliderIndex = 0;
  var carouselControllerEx;
  CarouselController buttonCarouselController = CarouselController();

  var adsList;
  @override
  void initState() {
    RecipeProvider().getAds();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<RecipeProvider>(builder: (context, RecipeProvider, child) {
      return Scaffold(
          appBar: AppBar(
            leading: Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: Numbers.appHorizontalPadding),
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
                      'Bonjour Emma',
                      style: TextStyle(fontSize: 10, color: Colors.grey),
                    ),
                  ],
                ),
                SizedBox(
                  height: 8,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const Text(
                      'What Would you Like to coock today?',
                      style: TextStyle(
                          fontSize: 18,
                          color: Colors.grey,
                          fontFamily: 'Hellix-Bold'),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 8,
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
                              hintStyle:
                                  TextStyle(color: Colors.grey, fontSize: 10)),
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
                            size: 25,
                          ),
                        ),
                      ),
                    )
                  ],
                ),
                SizedBox(
                  height: 9,
                ),
                RecipeProvider.adsList.isEmpty
                    ? const CircularProgressIndicator()
                    : Flexible(
                        child: SizedBox(
                            height: 80,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                CarouselSlider(
                                  carouselController: carouselControllerEx,
                                  options: CarouselOptions(
                                      autoPlay: true,
                                      height: 150,
                                      viewportFraction: .75,
                                      enlargeStrategy:
                                          CenterPageEnlargeStrategy.height,
                                      enlargeCenterPage: true,
                                      onPageChanged: (index, _) {
                                        sliderIndex = index;
                                        setState(() {});
                                      },
                                      enlargeFactor: .3),
                                  items: RecipeProvider.adsList.map((ad) {
                                    return Stack(
                                      children: [
                                        Container(
                                          width:
                                              MediaQuery.of(context).size.width,
                                          margin: const EdgeInsets.symmetric(
                                              horizontal: 5.0),
                                          decoration: BoxDecoration(
                                              image: DecorationImage(
                                                  fit: BoxFit.fitWidth,
                                                  image:
                                                      NetworkImage(ad.image!))),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Container(
                                            decoration: BoxDecoration(
                                                color: Colors.black38,
                                                borderRadius:
                                                    BorderRadius.circular(25)),
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.all(4.0),
                                              child: Text(
                                                ad.title.toString(),
                                                style: const TextStyle(
                                                    fontSize: 16.0,
                                                    color: Colors.white),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    );
                                  }).toList(),
                                ),
                                DotsIndicator(
                                  dotsCount: RecipeProvider.adsList.length,
                                  position: sliderIndex,
                                  onTap: (position) async {
                                    await carouselControllerEx
                                        .animateToPage(position);
                                    sliderIndex = position;
                                    setState(() {});
                                  },
                                  decorator: DotsDecorator(
                                    size: const Size.square(9.0),
                                    activeSize: const Size(18.0, 9.0),
                                    activeShape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(5.0)),
                                  ),
                                ),
                                const SizedBox(
                                  height: 8,
                                ),
                                const SectionHeader(
                                    sectionName: "Today's Fresh Recipes"),
                                Container(
                                  height: 160,
                                  child: ListView.builder(
                                      shrinkWrap: true,
                                      scrollDirection: Axis.horizontal,
                                      itemCount: freshList.length,
                                      itemBuilder: (context, index) {
                                        return Container(
                                          margin:
                                              const EdgeInsets.only(right: 30),
                                          width: 200,
                                          height: 120,
                                          decoration: BoxDecoration(
                                            color: ColoresConst.kprimaryColor,
                                            borderRadius:
                                                BorderRadius.circular(20),
                                          ),
                                          child: Stack(
                                            clipBehavior: Clip.none,
                                            children: [
                                              const Positioned(
                                                top: 5,
                                                left: 160,
                                                child: Icon(
                                                  Icons.favorite_border,
                                                  color: Colors.grey,
                                                  size: 15,
                                                ),
                                              ),
                                              Positioned(
                                                top: 25,
                                                right: -10,
                                                child: Image.asset(
                                                  freshList[index]['image'],
                                                  height: 30,
                                                  width: 50,
                                                  fit: BoxFit.contain,
                                                ),
                                              ),
                                              Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Padding(
                                                    padding: const EdgeInsets
                                                        .fromLTRB(5, 5, 0, 0),
                                                    child: const Text(
                                                      'Breakfast',
                                                      style: TextStyle(
                                                          color: ColoresConst
                                                              .kBlueColor,
                                                          fontSize: 12,
                                                          fontWeight:
                                                              FontWeight.bold),
                                                    ),
                                                  ),
                                                  const SizedBox(
                                                    height: 7,
                                                  ),
                                                  Container(
                                                    width: 160,
                                                    child: Text(
                                                      freshList[index]['name'],
                                                      overflow:
                                                          TextOverflow.ellipsis,
                                                      style: TextStyle(
                                                          fontSize: 12,
                                                          fontFamily:
                                                              'Hellix_Bold'),
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
                                                        color: ColoresConst
                                                            .mainColor,
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
                                                        fontSize: 12,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        color: ColoresConst
                                                            .mainColor),
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
                                                            fontSize: 10,
                                                            fontWeight:
                                                                FontWeight.bold,
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
                                                      const Text(
                                                        '1 Serving',
                                                        style: TextStyle(
                                                            fontSize: 10,
                                                            color: Colors.grey),
                                                      ),
                                                    ],
                                                  ),
                                                ],
                                              )
                                            ],
                                          ),
                                        );
                                      }),
                                ),
                                const SectionHeader(
                                  sectionName: 'Recommended',
                                ),
                                const SizedBox(
                                  height: 8,
                                ),
                                Container(
                                  height: 150,
                                  child: ListView.builder(
                                      // physics: NeverScrollableScrollPhysics(),
                                      shrinkWrap: true,
                                      itemCount: recommendedList.length,
                                      padding: EdgeInsets.zero,
                                      itemBuilder: (context, index) {
                                        return Container(
                                          height: 140,
                                          width:
                                              MediaQuery.of(context).size.width,
                                          padding: EdgeInsets.symmetric(
                                              horizontal: 7, vertical: 7),
                                          margin: EdgeInsets.only(bottom: 8),
                                          decoration: BoxDecoration(
                                              color: ColoresConst.kprimaryColor,
                                              borderRadius:
                                                  BorderRadius.circular(18)),
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
                                                  padding: const EdgeInsets
                                                      .symmetric(
                                                      horizontal: 12),
                                                  child: Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      const Text(
                                                        'Breakfast',
                                                        style: TextStyle(
                                                            color: ColoresConst
                                                                .kBlueColor,
                                                            fontSize: 10,
                                                            fontWeight:
                                                                FontWeight
                                                                    .bold),
                                                      ),
                                                      const SizedBox(
                                                        height: 7,
                                                      ),
                                                      Container(
                                                        width: 130,
                                                        child: Text(
                                                          recommendedList[index]
                                                              ['name'],
                                                          overflow: TextOverflow
                                                              .ellipsis,
                                                          style: TextStyle(
                                                              fontSize: 12,
                                                              fontFamily:
                                                                  'Hellix_Bold'),
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
                                                            color: ColoresConst
                                                                .mainColor,
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
                                                            fontWeight:
                                                                FontWeight.bold,
                                                            color: ColoresConst
                                                                .mainColor),
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
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold,
                                                                color: Colors
                                                                    .grey),
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
                                                                color: Colors
                                                                    .grey),
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
                                                    onPressed: () {},
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
                            )),
                      ),
              ])));
    });
  }
}
