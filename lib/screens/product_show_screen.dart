import 'package:flutter_application_1/models/product.dart';
import 'package:flutter/material.dart';

class ProductShowScreen extends StatelessWidget {
  const ProductShowScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // var arg =
    Product product = ModalRoute.of(context)?.settings.arguments as Product;

    return Scaffold(
      appBar: AppBar(
        title: Text(product.name),
      ),
      body: Column(
        children: [
          Image.network(product.imageUrl),
          Text(product.name, 
            style: TextStyle(
              fontSize: 30.0
            ),
          ),
          Text(product.price.toStringAsFixed(2), 
            style: TextStyle(
              fontSize: 30.0
            ),),
          Text(product.location, 
            style: TextStyle(
              fontSize: 30.0
            ),)
        ],
      ),
    );
  }
}
