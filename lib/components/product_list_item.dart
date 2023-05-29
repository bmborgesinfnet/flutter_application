import 'package:flutter_application_1/models/product.dart';
import 'package:flutter_application_1/providers/products_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../routes/route_paths.dart';

class ProductListItem extends StatelessWidget {
  const ProductListItem(
    this.product, {
    super.key,
  });

  final Product product;

  String _formatSubtitle() {
    String price = product.price.toStringAsFixed(2);
    return "R\$ $price (${product.quant})";
  }

  @override
  Widget build(BuildContext context) {
    final _products = Provider.of<ProductsProvider>(context);
    return ListTile(
      leading: IconButton(
        icon: const Icon(Icons.delete),
        onPressed: () => _products.removeItem(product),
      ),
      title: Text(product.name),
      subtitle: Text(_formatSubtitle()),
      trailing: IconButton(
        icon: const Icon(Icons.add),
        onPressed: () => _products.addItem(product),
      ),
      onTap: () {
        Navigator.of(context)
            .pushNamed(RoutePaths.PRODUCTSHOWSCREEN, arguments: product);
        // Navigator.of(context)
        // .p
      },
    );
  }
}
