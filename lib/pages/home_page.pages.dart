import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:recipe_app/utilities/colores.dart';
import 'package:recipe_app/widgets/section_header.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List freshList = [
    {'image': 'assets/images/recipe1.png', 'name': 'French Toast with Berries'},
    {
      'image': 'assets/images/Cinnamon Toaast copy.png',
      'name': 'Brown Sugar Cinnamon Toast'
    },
  ];
  List recommendedList = [
    {'image': 'assets/images/Muffins copy.png', 'name': 'Blueberry Muffins'},
    {
      'image': 'assets/images/detail_GlazedSalmon_2 copy.png',
      'name': 'Glazed Salmon'
    },
    {
      'image': 'assets/images/460x533_ChickenThighs_2 copy.png',
      'name': 'Asian Glazed Chicken Things'
    }
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColoresConst.kLightColor,
      body: Container(
        margin: const EdgeInsets.only(top: 63, left: 20, right: 20),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  onTap: () {
                    print('Menu');
                  },
                  child: SvgPicture.asset(
                    'assets/icon/Icons/menu.png',
                    height: 30,
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    print('notification');
                  },
                  child: SvgPicture.asset(
                    'assets/icon/Icons/notifications.png',
                    height: 30,
                  ),
                ),
                const SizedBox(
                  height: 12,
                ),
                const Text(
                  'Bonjour Emma',
                  style: TextStyle(fontSize: 16, color: Colors.grey),
                ),
                const Text(
                  'What Would you Like to coock today?',
                  style: TextStyle(
                      fontSize: 28,
                      color: Colors.grey,
                      fontFamily: 'Hellix-Bold'),
                ),
                const SizedBox(
                  height: 12,
                ),
                Expanded(
                  child: Container(
                    padding:
                        const EdgeInsets.symmetric(vertical: 5, horizontal: 7),
                    decoration: BoxDecoration(
                        color: ColoresConst.kprimaryColor,
                        borderRadius: BorderRadius.circular(15)),
                    child: const TextField(
                      cursorColor: ColoresConst.kDarkColor,
                      decoration: InputDecoration(
                          border: InputBorder.none,
                          prefixIcon: Icon(
                            Icons.search,
                            color: Colors.grey,
                            size: 32,
                          ),
                          hintText: "Search for recipes",
                          hintStyle:
                              TextStyle(color: Colors.grey, fontSize: 18)),
                    ),
                  ),
                ),
                const SizedBox(
                  width: 15,
                ),
                GestureDetector(
                  onTap: () {},
                  child: Container(
                    padding: const EdgeInsets.all(18),
                    decoration: BoxDecoration(
                        color: ColoresConst.kprimaryColor,
                        borderRadius: BorderRadius.circular(14)),
                    child: SvgPicture.asset(
                      'assets/icon/Icons/filter.png',
                      height: 20,
                    ),
                  ),
                )
              ],
            ),
            const SectionHeader(sectionName: "Today's Fresh Recipes"),
            const SizedBox(
              height: 15,
            ),
            Container(
              height: 220,
              child: ListView.builder(
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemCount: freshList.length,
                  itemBuilder: (context, index) {
                    return Container(
                      margin: const EdgeInsets.only(right: 30),
                      width: 200,
                      height: 230,
                      decoration: BoxDecoration(
                        color: ColoresConst.kprimaryColor,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Stack(
                        clipBehavior: Clip.none,
                        children: [
                          const Positioned(
                            top: 15,
                            left: 15,
                            child: Icon(
                              Icons.favorite_border,
                              color: Colors.grey,
                            ),
                          ),
                          Positioned(
                            top: 15,
                            right: -32,
                            child: Image.asset(freshList[index]['image']),
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                'Breakfast',
                                style: TextStyle(
                                    color: ColoresConst.kBlueColor,
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold),
                              ),
                              const SizedBox(
                                height: 7,
                              ),
                              Container(
                                width: 160,
                                child: Text(
                                  freshList[index]['name'],
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(
                                      fontSize: 16, fontFamily: 'Hellix_Bold'),
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
                                    fontSize: 14,
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
                                    size: 14,
                                  ),
                                  SizedBox(
                                    width: 7,
                                  ),
                                  Text(
                                    '10 mins',
                                    style: TextStyle(
                                        fontSize: 12,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.grey),
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  SvgPicture.asset(
                                      'assets/icon/Icons/serving.png'),
                                  const SizedBox(
                                    width: 7,
                                  ),
                                  const Text(
                                    '1 Serving',
                                    style: TextStyle(
                                        fontSize: 12, color: Colors.grey),
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
              height: 15,
            ),
            ListView.builder(
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: recommendedList.length,
                padding: EdgeInsets.zero,
                itemBuilder: (context, index) {
                  return Container(
                    height: 100,
                    width: MediaQuery.of(context).size.width,
                    padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                    margin: EdgeInsets.only(bottom: 12),
                    decoration: BoxDecoration(
                        color: ColoresConst.kprimaryColor,
                        borderRadius: BorderRadius.circular(18)),
                    child: Row(
                      children: [
                        Image.asset(
                          recommendedList[index]['image'],
                          height: 160,
                          width: 120,
                          fit: BoxFit.contain,
                        ),
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 15),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text(
                                  'Breakfast',
                                  style: TextStyle(
                                      color: ColoresConst.kBlueColor,
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold),
                                ),
                                const SizedBox(
                                  height: 7,
                                ),
                                Container(
                                  width: 160,
                                  child: Text(
                                    recommendedList[index]['name'],
                                    overflow: TextOverflow.ellipsis,
                                    style: TextStyle(
                                        fontSize: 16,
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
                                      fontSize: 14,
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
                                      size: 14,
                                    ),
                                    SizedBox(
                                      width: 7,
                                    ),
                                    Text(
                                      '10 mins',
                                      style: TextStyle(
                                          fontSize: 12,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.grey),
                                    ),
                                  ],
                                ),
                                Row(
                                  children: [
                                    SvgPicture.asset(
                                        'assets/icon/Icons/serving.png'),
                                    const SizedBox(
                                      width: 7,
                                    ),
                                    const Text(
                                      '1 Serving',
                                      style: TextStyle(
                                          fontSize: 12, color: Colors.grey),
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
                            height: 25,
                            width: 32,
                            child: IconButton(
                              onPressed: () {},
                              icon: Icon(
                                Icons.favorite_border,
                                color: Colors.grey,
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  );
                })
          ],
        ),
      ),
    );
  }
}
