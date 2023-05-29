import 'dart:convert';

import 'package:flutter_application_1/models/product.dart';
import 'package:flutter_application_1/repositories/products_repository.dart';
import 'package:http/http.dart';

class ProductsService {
  final ProductsRepository _productsRepository = ProductsRepository();

  Future<List<Product>> list() async {
    try {
      Response response = await _productsRepository.list();
      Map<String, dynamic> json = jsonDecode(response.body);
      return Product.listFromJson(json);
    } catch (err) {
      throw Exception("Problemas ao consultar lista.");
    }
  }

  Future<String> insert(Product product) async {
    try {
      String json = jsonEncode(product.toJson());
      Response response = await _productsRepository.insert(json);
      return jsonDecode(response.body) as String;
    } catch (err) {
      throw Exception("Problemas ao inserir produto.");
    }
  }

  Future<bool> delete(String id) async {
    try {
      Response response = await _productsRepository.delete(id);
      return response.statusCode == 200;
    } catch (err) {
      throw Exception("Problemas ao excluir produto.");
    }
  }
}