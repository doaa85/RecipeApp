class Ad {
  String? title;
  String? image;

  String? docId;
  Ad();
  Ad.fromjson(Map<String, dynamic> data, String id) {
    title = data["title"];
    image = data['image'];
  }
  Map<String, dynamic> toJson() {
    return {'title': title, 'image': image};
  }
}
