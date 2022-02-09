class InfoDataModel {
  int? id;
  String? name;
  String? image;
  List<Preparation>? preparation;
  List<Recipe>? recipe;

  InfoDataModel(
      {this.id, this.name, this.image, this.preparation, this.recipe});

  InfoDataModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    image = json['image'];
    if (json['preparation'] != null) {
      preparation = <Preparation>[];
      json['preparation'].forEach((v) {
        preparation!.add(new Preparation.fromJson(v));
      });
    }
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
    if (this.preparation != null) {
      data['preparation'] = this.preparation!.map((v) => v.toJson()).toList();
    }
    if (this.recipe != null) {
      data['recipe'] = this.recipe!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Preparation {
  int? step;
  String? description;

  Preparation({this.step, this.description});

  Preparation.fromJson(Map<String, dynamic> json) {
    step = json['step'];
    description = json['description'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['step'] = this.step;
    data['description'] = this.description;
    return data;
  }
}

class Recipe {
  String? item;
  int? value;
  int? quantity;
  String? measure;
  String? tipo;

  Recipe({this.item, this.value, this.quantity, this.measure, this.tipo});

  Recipe.fromJson(Map<String, dynamic> json) {
    item = json['item'];
    value = json['value'];
    quantity = json['quantity'];
    measure = json['measure'];
    tipo = json['tipo'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['item'] = this.item;
    data['value'] = this.value;
    data['quantity'] = this.quantity;
    data['measure'] = this.measure;
    data['tipo'] = this.tipo;
    return data;
  }
}
