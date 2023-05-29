import 'package:flutter/material.dart';
import 'package:flutter_application_1/services/products_service.dart';

import '../models/product.dart';

class ProductsProvider with ChangeNotifier {
  List<Product> itens = [];

  Future<List<Product>> list() async {
    if (itens.isEmpty) {
      itens = await ProductsService().list();
    }
    return itens;
  }

  void addItem(Product product) {
      product.quant++;
      notifyListeners();
  }

  void removeItem(Product product) {
    if (product.quant > 0) {
        product.quant--;
        notifyListeners();
    }
  }

  int countItens() => itens.fold(0, (acc, p) => acc + p.quant);
  String totalPrice() => itens.fold(0.0, (acc, p) => acc + p.price * p.quant).toStringAsFixed(2);

  void deleteItem(Product product) async {
    // bool isDeleted = await ProductsService.delete(product.id);
    // if (isDeleted) {
      // itens.remove(product);
      // notifyListeners();
    // }
  }
}