class Recipe {
  String? docId;
  num? calories;
  String? description;
  Map<String, String>? directions;
  String? imageUrl;
  List<String>? ingredients;
  num? rate;
  num? servings;
  String? title;
  num? total_time;
  String? type;
  List<String>? favourite_users_ids;

  Recipe();

  Recipe.fromJson(Map<String, dynamic> data, [String? id]) {
    docId = id;
    calories = data['calories'];
    description = data['describtion'];
    directions = data['directions'] != null
        ? Map<String, String>.from(data['directions'])
        : null;
    imageUrl = data['imageUrl'];
    ingredients = data['ingredients'] != null
        ? List<String>.from(data['ingredients'].map((e) => e.toString()))
        : null;
    rate = data['rate'];
    servings = data['servings'];
    title = data['title'];
    total_time = data['total_time'];
    type = data['type'];
    favourite_users_ids = data['users_ids'] != null
        ? List<String>.from(data['users_ids'].map((e) => e.toString()))
        : null;
  }

  Map<String, dynamic> toJson() {
    return {
      "calories": calories,
      "describtion": description,
      "directions": directions,
      "imageUrl": imageUrl,
      "ingredients": ingredients,
      "rate": rate,
      "servings": servings,
      "title": title,
      "total_time": total_time,
      "type": type,
      "favourite_user_ids": favourite_users_ids,
    };
  }
}
