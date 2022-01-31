class InfoDataModel {
  int? id;
  String? name;

  InfoDataModel({required this.id, required this.name});

  InfoDataModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
  }
}
