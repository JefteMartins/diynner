class InfoDataModel {
  int? id;
  String? name;
  String? image;
  String? recipe;

  InfoDataModel(
      {required this.id,
      required this.name,
      required this.image,
      required this.recipe});

  InfoDataModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    image = json['image'];
    recipe = json['recipe'];
  }
}
