

class Recipes {
  String? mealType;
  String? title;
  String? description;
  double? rating;
  double? calories;
  double? prepTime;
  int? serving;
  String image;
  Recipes(
      {required this.image,
      this.title,
      this.calories,
      this.description,
      this.mealType,
      this.prepTime,
      this.rating,
      this.serving});

  factory Recipes.fromjson(jsonData) {
    return Recipes(
        mealType: jsonData['mealType'],
        title: jsonData['title'],
        serving: jsonData['serving'],
        description: jsonData['description'],
        image: jsonData['image'],
        prepTime: jsonData['prep time'],
        calories: jsonData['calories'],
        rating: jsonData['rating']);
  }
}
