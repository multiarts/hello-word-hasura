import 'dart:convert';

String categoriesApiModel(CategoriesModel data) => json.encode(data.toJson());

class CategoriesModel {
  final int id;
  final String name;
  final String description;

  CategoriesModel({this.id, this.name, this.description});

  factory CategoriesModel.fromJson(Map<dynamic, dynamic> json) {
    return CategoriesModel(
      id: json['id'],
      name: json['categoryName'],
      description: json['description'],
    );
  }

  Map<String, dynamic> toJson() => {
    'id': id,
    'categoryName': name,
    'description': description,
  };

  factory CategoriesModel.fromJsonString(String str) =>
      CategoriesModel.fromJson(json.decode(str));

  String toJsonString() => json.encode(toJson());

  static List<CategoriesModel> fromJsonList(List list) {
    if (list == null) return null;
    return list
        .map<CategoriesModel>((item) => CategoriesModel.fromJson(item))
        .toList();
  }
}
