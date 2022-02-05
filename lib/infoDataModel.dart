class InfoDataModel {
  int? id;
  String? name;
  String? image;
  Recipe? recipe;

  InfoDataModel({this.id, this.name, this.image, this.recipe});

  InfoDataModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    image = json['image'];
    recipe =
        json['recipe'] != null ? new Recipe.fromJson(json['recipe']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['image'] = this.image;
    if (this.recipe != null) {
      data['recipe'] = this.recipe!.toJson();
    }
    return data;
  }
}

class Recipe {
  Item? item;
  Item? item2;

  Recipe({this.item, this.item2});

  Recipe.fromJson(Map<String, dynamic> json) {
    item = json['item'] != null ? new Item.fromJson(json['item']) : null;
    item2 = json['item2'] != null ? new Item.fromJson(json['item2']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.item != null) {
      data['item'] = this.item!.toJson();
    }
    if (this.item2 != null) {
      data['item2'] = this.item2!.toJson();
    }
    return data;
  }
}

class Item {
  String? name;
  int? value;

  Item({this.name, this.value});

  Item.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    value = json['value'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['value'] = this.value;
    return data;
  }
}
