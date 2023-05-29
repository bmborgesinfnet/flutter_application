import 'package:flutter_application_1/providers/products_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProductOverviewCard extends StatelessWidget {
  const ProductOverviewCard({super.key});

  @override
  Widget build(BuildContext context) {
    final products = Provider.of<ProductsProvider>(context);
    return Card(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Text(
            "Total",
            style: TextStyle(fontSize: 36.0),
          ),
          Column(
            children: [
              const Text("Quant"),
              Text(
                "${products.countItens()}",
                style: TextStyle(fontSize: 36.0),
              ),
            ],
          ),
          Column(
            children: [
              const Text("R\$"),
              Text(
                products.totalPrice(),
                style: TextStyle(fontSize: 36.0),
              ),
            ],
          )
        ],
      ),
    );
  }
}
