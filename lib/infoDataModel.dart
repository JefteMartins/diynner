class InfoDataModel {
  int? id;
  String? name;
  String? image;

  InfoDataModel({required this.id, required this.name, required this.image});

  InfoDataModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    image = json['image'];
  }
}
