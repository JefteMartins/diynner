import 'dart:convert';

class InfoDataModel {
  int? id;
  String? name;
  String? image;
  Recipe? recipe;

  InfoDataModel(
      {required this.id,
      required this.name,
      required this.image,
      required this.recipe});

  InfoDataModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    image = json['image'];
    recipe = Recipe.fromJson(json['recipe']);
  }
}

class Recipe {
  String? item;

  Recipe({required this.item});

  Recipe.fromJson(Map<String, dynamic> json) {
    item = json['item'];
  }
}
