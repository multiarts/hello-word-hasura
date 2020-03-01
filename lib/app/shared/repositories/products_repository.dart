import 'package:dio/dio.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:hello_word/app/shared/models/categories_model.dart';
import 'package:hello_word/app/shared/models/products_model.dart';

class ProductsRepository extends Disposable {
  final Dio dio;

  ProductsRepository(this.dio);

  Future<List<ProductsModel>> getAllProducts() async {
    var response = await dio.get('product/read.php');
    List<ProductsModel> list = [];
    for (var json in (response.data['records'] as List)) {
      ProductsModel model = ProductsModel(id: json['id'], name: json['name'], price: json['price'], cover: json['cover'], categoryName: json['category_name'], description: json['description']);
      list.add(model);
    }

    return list;
  }

  Future<List<ProductsModel>> fetchPost() async {
    try {
      final response = await dio.get('product/read.php');
      var value = ProductsModel.fromJsonList(response.data['records']);
      return value;
    } catch (e) {
      return e;
    }
  }

  Future<List<CategoriesModel>> fetchCategories() async {
    try {
      final response = await dio.get('category/read.php');
      var value = CategoriesModel.fromJsonList(response.data['records']);
      return value;
    } catch (e) {
      return e;
    }
  }

  @override
  void dispose(){}
}