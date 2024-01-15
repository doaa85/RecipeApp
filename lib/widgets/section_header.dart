import 'package:flutter/material.dart';
import 'package:recipe_app/utilities/colores.dart';
import 'package:recipe_app/utilities/numbers.dart';

class SectionHeader extends StatelessWidget {
  final String sectionName;
  const SectionHeader({required this.sectionName, super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
          const EdgeInsets.symmetric(horizontal: Numbers.appHorizontalPadding),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            sectionName,
            style: const TextStyle(
                fontSize: 15,
                fontFamily: 'Hellix_Bold ',
                fontWeight: FontWeight.w900),
          ),
          GestureDetector(
            onTap: () {
              print('See All');
            },
            child: const Text(
              'See All',
              style: TextStyle(fontSize: 12, color: (ColoresConst.mainColor)),
            ),
          )
        ],
      ),
    );
  }
}
