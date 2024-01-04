class Ad {
  String? title;
  String? image;
  Ad();
  Ad.fromjson(Map<String, dynamic> data) {
    title = data["title"];
    image = data['image'];
  }
  Map<String, dynamic> toJson() {
    return {'title': title, 'image': image};
  }

  static fromJson(Map<String, dynamic> e) {}
}
