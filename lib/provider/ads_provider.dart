// import 'dart:convert';

// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:recipe_app/models/ad.model.dart';

// class RecipeProvider extends ChangeNotifier {
//   var sliderIndex = 0;
//   List<Ad> _adsList = [];
//   Ad ad = Ad();

//   late final String image;

//   void getAds() async {
//     var adsData = await rootBundle.loadString('assets/data/sample.json');
//     var dataDecoded =
//         List<Map<String, dynamic>>.from(jsonDecode(adsData)['ads']);

//     _adsList = List<Ad>.from(dataDecoded.map((e) => Ad.fromjson(e)));
//     notifyListeners();
//   }

//   List<Ad> get adsList => _adsList;
//   set adsList(List<Ad> value) {
//     _adsList = value;

//     notifyListeners();
//   }
// }

import 'package:carousel_slider/carousel_controller.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:recipe_app/models/ad.model.dart';

class AdsProvider extends ChangeNotifier {
  List<Ad>? _adsList;

  List<Ad>? get adsList => _adsList;

  Ad? _ad;

  Ad? get ad => _ad;

  int sliderIndex = 0;
  CarouselController? carouselController;

  void onPageChanged(int index) {
    sliderIndex = index;
    notifyListeners();
  }

  void disposeCarousel() {
    carouselController = null;
  }

  void onDotTapped(int position) async {
    await carouselController?.animateToPage(position);
    sliderIndex = position;
    notifyListeners();
  }

  void initCarousel() {
    carouselController = CarouselController();
  }

  Future<void> getAds() async {
    try {
      var result = await FirebaseFirestore.instance
          .collection('ads')
          // .where('isActive', isEqualTo: true)
          .get();

      if (result.docs.isNotEmpty) {
        _adsList = List<Ad>.from(
            result.docs.map((doc) => Ad.fromjson(doc.data(), doc.id)));
      } else {
        _adsList = [];
      }
      notifyListeners();
    } catch (e) {
      _adsList = [];
      notifyListeners();
    }
  }

  Future<void> getCertinAd(String id) async {
    try {
      var result =
          await FirebaseFirestore.instance.collection('ads').doc(id).get();
      if (result.exists) {
        _ad = Ad.fromjson(result.data() ?? {}, result.id);
      } else {
        _ad = null;
      }
      notifyListeners();
    } catch (e) {
      _ad = null;
      notifyListeners();
    }
  }
}
