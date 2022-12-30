import 'package:flutter/material.dart';
import '../providers/product_provider.dart';
import 'package:provider/provider.dart';

import 'product_item.dart';

class ProductGrid extends StatelessWidget {
  final bool _showFavorite;
  const ProductGrid(this._showFavorite);

  @override
  Widget build(BuildContext context) {
    final productData = Provider.of<ProductProvider>(context);
    final loadedProducts = _showFavorite ? productData.showFavoriteOnly : productData.items;
    return GridView.builder(
      padding: const EdgeInsets.all(10),
      itemCount: loadedProducts.length,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 3 / 2,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10),
      itemBuilder: (ctx, index) => ChangeNotifierProvider.value(
        // create: (ctx) => loadedProducts[index],
        value: loadedProducts[index],
        child: ProductItem(
          // loadedProducts[index].id,
          // loadedProducts[index].title,
          // loadedProducts[index].imageUrl,
        ),
      ),
    );
  }
}
