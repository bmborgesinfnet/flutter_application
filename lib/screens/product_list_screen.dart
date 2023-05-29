import 'package:flutter_application_1/providers/products_provider.dart';
import 'package:flutter_application_1/routes/route_paths.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../components/product_list.dart';
import '../components/product_overview_card.dart';

class ProductListScreen extends StatefulWidget {
  ProductListScreen({super.key});

  @override
  State<ProductListScreen> createState() => _ProductListScreenState();
}

class _ProductListScreenState extends State<ProductListScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Consultor de Preços"),
      ),
      body: ChangeNotifierProvider(
        create: (context) => ProductsProvider(),
        child: Column(
          children: const [
            ProductOverviewCard(),
            ProductList(),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () {
          Navigator.of(context).pushNamed(
            RoutePaths.PRODUCTINSERTSCREEN
          );
        },
      ),
    );
  }
}
