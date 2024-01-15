import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:recipe_app/utilities/colores.dart';

class CustomCard extends StatefulWidget {
  const CustomCard({super.key});

  @override
  State<CustomCard> createState() => _CustomCardState();
}

class _CustomCardState extends State<CustomCard> {
  List freshList = [
    {'image': 'assets/images/recipe1.png', 'name': 'French Toast with Berries'},
    {
      'image': 'assets/images/Cinnamon Toaast copy.png',
      'name': 'Brown Sugar Cinnamon Toast'
    },
  ];
  @override
  Widget build(BuildContext context) {
    var index = 0;
    return Card(
      elevation: 2,
      child: Container(
          width: 240,
          decoration: BoxDecoration(
              color: ColoresConst.kprimaryColor,
              borderRadius: BorderRadius.circular(20)),
          child: Padding(
            padding: const EdgeInsets.only(top: 15, bottom: 15, left: 15),
            child: Expanded(
              child: Column(
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Icon(
                        Icons.favorite_outline,
                        color: Colors.grey,
                      ),
                      Transform.translate(
                        offset: Offset(20, 0),
                        child: Image.asset(
                          freshList[index]['image'],
                          height: 120,
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
                                color: Color(0xff1F95B3), fontSize: 13),
                          ),
                        ],
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(vertical: 4),
                        child: Row(
                          children: [
                            Text(
                              freshList[index]['name'],
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
                        padding: EdgeInsets.symmetric(vertical: 8),
                        child: Row(
                          children: [
                            Text(
                              '120 Calories',
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                  color: ColoresConst.mainColor,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Icon(
                            Icons.access_time,
                            size: 18,
                            color: Colors.grey,
                          ),
                          SizedBox(
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
                          SvgPicture.asset('assets/icon/Icons/serving.png'),
                          const SizedBox(
                            width: 4,
                          ),
                          const Text(
                            '1 serving',
                            style: TextStyle(color: Colors.grey),
                          )
                        ],
                      ),
                    ],
                  )
                ],
              ),
            ),
          )),
    );
  }
}
