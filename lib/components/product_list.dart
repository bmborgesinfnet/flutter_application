import 'package:flutter_application_1/components/product_list_item.dart';
import 'package:flutter_application_1/providers/products_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/product.dart';
import '../services/products_service.dart';

class ProductList extends StatelessWidget {
  const ProductList({super.key});

  @override
  Widget build(BuildContext context) {
    // final _products = Provider.of<ProductsProvider>(context);

    List<Widget> _generateListProducts(List<Product> products) {
      return products.map((product) => ProductListItem(product)).toList();
    }

    return FutureBuilder<List<Product>>(
      future: ProductsService().list(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else if (snapshot.hasError) {
          return Center(
            child: Text("Erro ao consultar dados: ${snapshot.error}"),
          );
        } else if (snapshot.hasData) {
          final list = snapshot.data;
          if (list != null && list.isNotEmpty) {
            return Expanded(
              child: ListView(
                children: _generateListProducts(list),
              ),
            );
          } else {
            return const Center(
              child: Text("Nenhum produto cadastrado."),
            );
          }
        } else {
          return const Center(
            child: Text("Nenhum produto cadastrado."),
          );
        }
      },
    );
  }
}
