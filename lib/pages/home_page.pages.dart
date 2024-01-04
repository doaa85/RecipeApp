import 'dart:convert';

import 'package:carousel_slider/carousel_controller.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:recipe_app/models/ad.model.dart';
import 'package:recipe_app/utilities/colores.dart';
import 'package:recipe_app/utilities/numbers.dart';
import 'package:recipe_app/widgets/section_header.dart';

// class HomePage extends StatefulWidget {
//   const HomePage({super.key});

//   @override
//   State<HomePage> createState() => _HomePageState();
// }

// class _HomePageState extends State<HomePage> {
//   List freshList = [
//     {'image': 'assets/images/recipe1.png', 'name': 'French Toast with Berries'},
//     {
//       'image': 'assets/images/Cinnamon Toaast copy.png',
//       'name': 'Brown Sugar Cinnamon Toast'
//     },
//   ];
//   List recommendedList = [
//     {'image': 'assets/images/Muffins copy.png', 'name': 'Blueberry Muffins'},
//     {
//       'image': 'assets/images/detail_GlazedSalmon_2 copy.png',
//       'name': 'Glazed Salmon'
//     },
//     {
//       'image': 'assets/images/460x533_ChickenThighs_2 copy.png',
//       'name': 'Asian Glazed Chicken Things'
//     }
//   ];

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: ColoresConst.kLightColor,
//       body: Container(
//         margin: const EdgeInsets.only(top: 63, left: 20, right: 20),
//         child: Column(
//           children: [
//             Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: [
//                 GestureDetector(
//                   onTap: () {
//                     print('Menu');
//                   },
//                   child: Transform.translate(
//                     offset: Offset(20, 0),
//                     child: SvgPicture.asset(
//                       'assets/icon/Icons/menu.png',
//                       height: 30,
//                     ),
//                   ),
//                 ),
//                 GestureDetector(
//                   onTap: () {
//                     print('notification');
//                   },
//                   child: Transform.translate(
//                     offset: Offset(15, 0),
//                     child: SvgPicture.asset(
//                       'assets/icon/Icons/notifications.png',
//                       height: 30,
//                     ),
//                   ),
//                 ),
//                 const SizedBox(
//                   height: 12,
//                 ),
//                 const Text(
//                   'Bonjour Emma',
//                   style: TextStyle(fontSize: 10, color: Colors.grey),
//                 ),
//                 SizedBox(
//                   height: 15,
//                 ),
//                 const Text(
//                   'What Would you Like to coock today?',
//                   style: TextStyle(
//                       fontSize: 22,
//                       color: Colors.grey,
//                       fontFamily: 'Hellix-Bold'),
//                 ),
//                 const SizedBox(
//                   height: 10,
//                 ),
//                 Expanded(
//                   child: Container(
//                     padding:
//                         const EdgeInsets.symmetric(vertical: 5, horizontal: 7),
//                     decoration: BoxDecoration(
//                         color: ColoresConst.kprimaryColor,
//                         borderRadius: BorderRadius.circular(15)),
//                     child: const TextField(
//                       cursorColor: ColoresConst.kDarkColor,
//                       decoration: InputDecoration(
//                           border: InputBorder.none,
//                           prefixIcon: Icon(
//                             Icons.search,
//                             color: Colors.grey,
//                             size: 24,
//                           ),
//                           hintText: "Search for recipes",
//                           hintStyle:
//                               TextStyle(color: Colors.grey, fontSize: 12)),
//                     ),
//                   ),
//                 ),
//                 const SizedBox(
//                   width: 15,
//                 ),
//                 GestureDetector(
//                   onTap: () {},
//                   child: Container(
//                     padding: const EdgeInsets.all(8),
//                     decoration: BoxDecoration(
//                         color: ColoresConst.kprimaryColor,
//                         borderRadius: BorderRadius.circular(14)),
//                     child: Transform.translate(
//                       offset: Offset(8, 8),
//                       child: SvgPicture.asset(
//                         'assets/icon/Icons/filter.png',
//                         height: 10,
//                       ),
//                     ),
//                   ),
//                 )
//               ],
//             ),
//             const SectionHeader(sectionName: "Today's Fresh Recipes"),
//             const SizedBox(
//               height: 10,
//             ),
//             Container(
//               height: 180,
//               child: ListView.builder(
//                   shrinkWrap: true,
//                   scrollDirection: Axis.horizontal,
//                   itemCount: freshList.length,
//                   itemBuilder: (context, index) {
//                     return Container(
//                       margin: const EdgeInsets.only(right: 30),
//                       width: 200,
//                       height: 150,
//                       decoration: BoxDecoration(
//                         color: ColoresConst.kprimaryColor,
//                         borderRadius: BorderRadius.circular(20),
//                       ),
//                       child: Stack(
//                         clipBehavior: Clip.none,
//                         children: [
//                           const Positioned(
//                             top: 15,
//                             left: 15,
//                             child: Icon(
//                               Icons.favorite_border,
//                               color: Colors.grey,
//                             ),
//                           ),
//                           Positioned(
//                             top: 15,
//                             right: -32,
//                             child: Image.asset(freshList[index]['image']),
//                             height: 10,
//                             width: 10,
//                           ),
//                           Column(
//                             crossAxisAlignment: CrossAxisAlignment.start,
//                             children: [
//                               const Text(
//                                 'Breakfast',
//                                 style: TextStyle(
//                                     color: ColoresConst.kBlueColor,
//                                     fontSize: 12,
//                                     fontWeight: FontWeight.bold),
//                               ),
//                               const SizedBox(
//                                 height: 7,
//                               ),
//                               Container(
//                                 width: 160,
//                                 child: Text(
//                                   freshList[index]['name'],
//                                   overflow: TextOverflow.ellipsis,
//                                   style: TextStyle(
//                                       fontSize: 12, fontFamily: 'Hellix_Bold'),
//                                 ),
//                               ),
//                               const SizedBox(
//                                 height: 8,
//                               ),
//                               Row(
//                                 children: List.generate(
//                                   5,
//                                   (index) => const Icon(
//                                     Icons.star,
//                                     color: ColoresConst.mainColor,
//                                     size: 11,
//                                   ),
//                                 ),
//                               ),
//                               const SizedBox(
//                                 height: 8,
//                               ),
//                               const Text(
//                                 '120 Calories',
//                                 style: TextStyle(
//                                     fontSize: 10,
//                                     fontWeight: FontWeight.bold,
//                                     color: ColoresConst.mainColor),
//                               ),
//                               const SizedBox(
//                                 height: 8,
//                               ),
//                               const Row(
//                                 children: [
//                                   Icon(
//                                     Icons.access_time,
//                                     color: Colors.grey,
//                                     size: 10,
//                                   ),
//                                   SizedBox(
//                                     width: 7,
//                                   ),
//                                   Text(
//                                     '10 mins',
//                                     style: TextStyle(
//                                         fontSize: 10,
//                                         fontWeight: FontWeight.bold,
//                                         color: Colors.grey),
//                                   ),
//                                 ],
//                               ),
//                               Row(
//                                 children: [
//                                   Transform.translate(
//                                     offset: Offset(5, 3),
//                                     child: SvgPicture.asset(
//                                       'assets/icon/Icons/serving.png',
//                                       height: 8,
//                                       width: 8,
//                                     ),
//                                   ),
//                                   const SizedBox(
//                                     width: 7,
//                                   ),
//                                   const Text(
//                                     '1 Serving',
//                                     style: TextStyle(
//                                         fontSize: 10, color: Colors.grey),
//                                   ),
//                                 ],
//                               ),
//                             ],
//                           )
//                         ],
//                       ),
//                     );
//                   }),
//             ),
//             const SectionHeader(
//               sectionName: 'Recommended',
//             ),
//             const SizedBox(
//               height: 10,
//             ),
//             ListView.builder(
//                 physics: NeverScrollableScrollPhysics(),
//                 shrinkWrap: true,
//                 itemCount: recommendedList.length,
//                 padding: EdgeInsets.zero,
//                 itemBuilder: (context, index) {
//                   return Container(
//                     height: 80,
//                     width: MediaQuery.of(context).size.width,
//                     padding: EdgeInsets.symmetric(horizontal: 7, vertical: 7),
//                     margin: EdgeInsets.only(bottom: 8),
//                     decoration: BoxDecoration(
//                         color: ColoresConst.kprimaryColor,
//                         borderRadius: BorderRadius.circular(18)),
//                     child: Row(
//                       children: [
//                         Transform.translate(
//                           offset: Offset(5, 4),
//                           child: Image.asset(
//                             recommendedList[index]['image'],
//                             height: 60,
//                             width: 70,
//                             fit: BoxFit.contain,
//                           ),
//                         ),
//                         Expanded(
//                           child: Padding(
//                             padding: const EdgeInsets.symmetric(horizontal: 12),
//                             child: Column(
//                               crossAxisAlignment: CrossAxisAlignment.start,
//                               children: [
//                                 const Text(
//                                   'Breakfast',
//                                   style: TextStyle(
//                                       color: ColoresConst.kBlueColor,
//                                       fontSize: 12,
//                                       fontWeight: FontWeight.bold),
//                                 ),
//                                 const SizedBox(
//                                   height: 7,
//                                 ),
//                                 Container(
//                                   width: 160,
//                                   child: Text(
//                                     recommendedList[index]['name'],
//                                     overflow: TextOverflow.ellipsis,
//                                     style: TextStyle(
//                                         fontSize: 16,
//                                         fontFamily: 'Hellix_Bold'),
//                                   ),
//                                 ),
//                                 const SizedBox(
//                                   height: 8,
//                                 ),
//                                 Row(
//                                   children: List.generate(
//                                     5,
//                                     (index) => const Icon(
//                                       Icons.star,
//                                       color: ColoresConst.mainColor,
//                                       size: 10,
//                                     ),
//                                   ),
//                                 ),
//                                 const SizedBox(
//                                   height: 8,
//                                 ),
//                                 const Text(
//                                   '120 Calories',
//                                   style: TextStyle(
//                                       fontSize: 14,
//                                       fontWeight: FontWeight.bold,
//                                       color: ColoresConst.mainColor),
//                                 ),
//                                 const SizedBox(
//                                   height: 8,
//                                 ),
//                                 const Row(
//                                   children: [
//                                     Icon(
//                                       Icons.access_time,
//                                       color: Colors.grey,
//                                       size: 10,
//                                     ),
//                                     SizedBox(
//                                       width: 7,
//                                     ),
//                                     Text(
//                                       '10 mins',
//                                       style: TextStyle(
//                                           fontSize: 10,
//                                           fontWeight: FontWeight.bold,
//                                           color: Colors.grey),
//                                     ),
//                                   ],
//                                 ),
//                                 Row(
//                                   children: [
//                                     Transform.translate(
//                                       offset: Offset(5, 0),
//                                       child: SvgPicture.asset(
//                                           'assets/icon/Icons/serving.png'),
//                                     ),
//                                     const SizedBox(
//                                       width: 7,
//                                     ),
//                                     const Text(
//                                       '1 Serving',
//                                       style: TextStyle(
//                                           fontSize: 10, color: Colors.grey),
//                                     ),
//                                   ],
//                                 ),
//                               ],
//                             ),
//                           ),
//                         ),
//                         Align(
//                           alignment: Alignment.topRight,
//                           child: Container(
//                             height: 25,
//                             width: 32,
//                             child: IconButton(
//                               onPressed: () {},
//                               icon: Icon(
//                                 Icons.favorite_border,
//                                 color: Colors.grey,
//                               ),
//                             ),
//                           ),
//                         )
//                       ],
//                     ),
//                   );
//                 })
//           ],
//         ),
//       ),
//     );
//   }
// }

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var sliderIndex = 0;
  CarouselController carouselControllerEx = CarouselController();

  List<Ad> adsList = [];

  void getAds() async {
    var adsData = await rootBundle.loadString('assets/data/sample.json');
    var dataDecoded =
        List<Map<String, dynamic>>.from(jsonDecode(adsData)['ads']);

    adsList = dataDecoded.map((e) => Ad.fromJson(e)).toList();
    setState(() {});
  }

  @override
  void initState() {
    getAds();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Padding(
          padding:
              EdgeInsets.symmetric(horizontal: Numbers.appHorizontalPadding),
          child: Icon(Icons.menu),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(
                horizontal: Numbers.appHorizontalPadding),
            child: Icon(Icons.notifications),
          )
        ],
      ),
      body: SafeArea(
        child: adsList.isEmpty
            ? const CircularProgressIndicator()
            : Column(
                children: [
                  CarouselSlider(
                    carouselController: carouselControllerEx,
                    options: CarouselOptions(
                        autoPlay: true,
                        height: 200,
                        viewportFraction: .75,
                        enlargeStrategy: CenterPageEnlargeStrategy.height,
                        enlargeCenterPage: true,
                        onPageChanged: (index, _) {
                          sliderIndex = index;
                          setState(() {});
                        },
                        enlargeFactor: .3),
                    items: adsList.map((ad) {
                      return Stack(
                        children: [
                          Container(
                            width: MediaQuery.of(context).size.width,
                            margin: const EdgeInsets.symmetric(horizontal: 5.0),
                            decoration: BoxDecoration(
                                image: DecorationImage(
                                    fit: BoxFit.fitWidth,
                                    image: NetworkImage(ad.image!))),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              decoration: BoxDecoration(
                                  color: Colors.black38,
                                  borderRadius: BorderRadius.circular(25)),
                              child: Padding(
                                padding: const EdgeInsets.all(4.0),
                                child: Text(
                                  ad.title.toString(),
                                  style: const TextStyle(
                                      fontSize: 16.0, color: Colors.white),
                                ),
                              ),
                            ),
                          ),
                        ],
                      );
                    }).toList(),
                  ),
                  DotsIndicator(
                    dotsCount: adsList.length,
                    position: sliderIndex,
                    onTap: (position) async {
                      await carouselControllerEx.animateToPage(position);
                      sliderIndex = position;
                      setState(() {});
                    },
                    decorator: DotsDecorator(
                      size: const Size.square(9.0),
                      activeSize: const Size(18.0, 9.0),
                      activeShape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5.0)),
                    ),
                  ),
                  SectionHeader(sectionName: 'Today\'s Fresh Recipes'),
                  Card(
                    elevation: 2,
                    child: Container(
                        width: 240,
                        decoration: BoxDecoration(
                            color: 
                              ColoresConst.kprimaryColor,
                            
                            borderRadius: BorderRadius.circular(20)),
                        child: Padding(
                          padding: const EdgeInsets.only(
                              top: 15, bottom: 15, left: 15),
                          child: Column(
                            children: [
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Icon(
                                    Icons.favorite_outline,
                                    color: Colors.grey,
                                  ),
                                  Transform.translate(
                                    offset: Offset(20, 0),
                                    child: Image.asset(
                                      'assets/images/frensh_toast.png',
                                      height: 140,
                                      width: 200,
                                      fit: BoxFit.fitHeight,
                                    ),
                                  )
                                ],
                              ),
                              Column(
                                children: [
                                  Row(
                                    children: [
                                      Text(
                                        'Breakfast',
                                        style: TextStyle(
                                            color: Color(0xff1F95B3),
                                            fontSize: 13),
                                      ),
                                    ],
                                  ),
                                  Padding(
                                    padding:
                                        const EdgeInsets.symmetric(vertical: 4),
                                    child: Row(
                                      children: [
                                        Text(
                                          'Fresh Toast With Barries',
                                          maxLines: 1,
                                          overflow: TextOverflow.ellipsis,
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 16,
                                              fontWeight: FontWeight.w400),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Row(
                                    children: [
                                      Icon(
                                        Icons.star,
                                        color: ColoresConst.mainColor,
                                      ),
                                      Icon(
                                        Icons.star,
                                        color: ColoresConst.mainColor,
                                      ),
                                      Icon(
                                        Icons.star,
                                        color: ColoresConst.mainColor,
                                      ),
                                      Icon(
                                        Icons.star,
                                        color: ColoresConst.mainColor,
                                      )
                                    ],
                                  ),
                                  Padding(
                                    padding:
                                        const EdgeInsets.symmetric(vertical: 8),
                                    child: Row(
                                      children: [
                                        Text(
                                          '120 Calories',
                                          maxLines: 1,
                                          overflow: TextOverflow.ellipsis,
                                          style: TextStyle(
                                              color:
                                                  Color(ColoresConst.mainColor),
                                              fontSize: 14,
                                              fontWeight: FontWeight.w400),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    children: [
                                      Icon(
                                        Icons.access_time,
                                        size: 18,
                                        color: Colors.grey,
                                      ),
                                      const SizedBox(
                                        width: 4,
                                      ),
                                      Text(
                                        '10 mins',
                                        style: TextStyle(color: Colors.grey),
                                      )
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      Icon(
                                        Icons.access_time,
                                        size: 18,
                                        color: Colors.grey,
                                      ),
                                      const SizedBox(
                                        width: 4,
                                      ),
                                      Text(
                                        '1 serving',
                                        style: TextStyle(color: Colors.grey),
                                      )
                                    ],
                                  ),
                                ],
                              )
                            ],
                          ),
                        )),
                  ),
                  SectionHeader(sectionName: 'New Ingredients'),
                ],
              ),
      ),
    );
  }
}