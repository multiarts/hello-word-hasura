import 'dart:convert';

String poductsApiModel(ProductsModel data) => json.encode(data.toJson());

class ProductsModel {
  final int id;
  final String name;
  final double price;
  final String cover;
  final String categoryName;
  final String description;

  ProductsModel({this.id, this.name, this.price, this.cover, this.categoryName, this.description});

  factory ProductsModel.fromJson(Map<dynamic, dynamic> json) => ProductsModel(
    id: json['id'],
    name: json['name'],
    price: json['price'] + 0.0,
    cover: json['cover'],
    categoryName: json['category_name'],
    description: json['description'],
  );

  Map<dynamic, dynamic> toJson() => {
    'id': id,
    'name': name,
    'price': price,
    'cover': cover,
    'category_name': categoryName,
    'description': description,
  };

  factory ProductsModel.fromJsonString(String str) =>
      ProductsModel.fromJson(json.decode(str));

  String toJsonString() => json.encode(toJson());

  static List<ProductsModel> fromJsonList(List list) {
    if (list == null) return null;
    return list
        .map<ProductsModel>((item) => ProductsModel.fromJson(item))
        .toList();
  }
}