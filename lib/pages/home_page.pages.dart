import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class HomePage extends StatefulWidget {
  HomePage({super.key});

  var listValues = [1, 2, 3, 4, 5];
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  CarouselController buttonCarouselController = CarouselController();
  var listValues = [1, 2, 3, 4, 5];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text(
            'my home page',
          ),
          backgroundColor: Colors.deepPurple,
        ),
        body: Stack(children: [
          Column(
            children: [
              CarouselSlider(
                options: CarouselOptions(
                    height: 250,
                    autoPlay: true,
                    autoPlayInterval: const Duration(seconds: 3),
                    autoPlayAnimationDuration:
                        const Duration(milliseconds: 800)),
                carouselController: buttonCarouselController,
                items: listValues.map((i) {
                  return Container(
                      width: MediaQuery.of(context).size.width,
                      margin: const EdgeInsets.symmetric(horizontal: 5.0),
                      decoration: const BoxDecoration(color: Colors.amber),
                      child: Text(
                        'text $i',
                        style: const TextStyle(fontSize: 16.0),
                      ));
                }).toList(),
              ),
              // DotsIndicator(
              //   dotsCount: listValues.length,
              //   position: sliderIndex,
              //   onTap: (position) async {
              //     await buttonCarouselController.animateToPage(position);
              //     sliderIndex = position;
              //     setState(() {});
              //   },
              // )
            ],
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(300, 75, 0, 0),
            child: FloatingActionButton(
              onPressed: () => buttonCarouselController.nextPage(
                  duration: const Duration(milliseconds: 300),
                  curve: Curves.linear),
              child: const Text('>'),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(10, 75, 0, 0),
            child: FloatingActionButton(
              onPressed: () => buttonCarouselController.previousPage(
                  duration: const Duration(milliseconds: 300),
                  curve: Curves.linear),
              child: const Text('<'),
            ),
          )
        ]));
  }
}
