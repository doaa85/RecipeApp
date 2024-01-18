import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:recipe_app/models/ad.model.dart';

class RecipeProvider extends ChangeNotifier {
  var sliderIndex = 0;
  List<Ad> _adsList = [];
  Ad ad = Ad();

  late final String image;

  void getAds() async {
    var adsData = await rootBundle.loadString('assets/data/sample.json');
    var dataDecoded =
        List<Map<String, dynamic>>.from(jsonDecode(adsData)['ads']);

    _adsList = List<Ad>.from(dataDecoded.map((e) => Ad.fromjson(e)));
    notifyListeners();
  }

  List<Ad> get adsList => _adsList;
  set adsList(List<Ad> value) {
    _adsList = value;

    notifyListeners();
  }
}
