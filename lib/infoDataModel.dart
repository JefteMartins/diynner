class InfoDataModel {
  int? id;
  String? name;
  String? image;
  List<Recipe>? recipe;

  InfoDataModel({this.id, this.name, this.image, this.recipe});

  InfoDataModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    image = json['image'];
    if (json['recipe'] != null) {
      recipe = <Recipe>[];
      json['recipe'].forEach((v) {
        recipe!.add(new Recipe.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['image'] = this.image;
    if (this.recipe != null) {
      data['recipe'] = this.recipe!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Recipe {
  String? item;
  int? value;
  int? quantity;
  String? measure;

  Recipe({this.item, this.value, this.quantity, this.measure});

  Recipe.fromJson(Map<String, dynamic> json) {
    item = json['item'];
    value = json['value'];
    quantity = json['quantity'];
    measure = json['measure'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['item'] = this.item;
    data['value'] = this.value;
    data['quantity'] = this.quantity;
    data['measure'] = this.measure;
    return data;
  }
}
