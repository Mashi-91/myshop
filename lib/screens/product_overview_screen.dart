import 'package:flutter/material.dart';
import '../data/data.dart';
import '../providers/cart.dart';
import '../screens/cart_screen.dart';
import '../widget/203%20badge.dart';
import 'package:provider/provider.dart';
import '../widget/Drawer.dart';
import '../widget/product_grid.dart';

import '../providers/product.dart';

enum FilterOption { Favorite, All }

bool _showFavoriteOnly = false;

class ProductOverviewScreen extends StatefulWidget {
  @override
  State<ProductOverviewScreen> createState() => _ProductOverviewScreenState();
}

class _ProductOverviewScreenState extends State<ProductOverviewScreen> {
  final List<Product> loadedProducts = data;

  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<Cart>(context);
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: const Text('MyShop'),
        actions: [
          PopupMenuButton(
              onSelected: (FilterOption selectedValue) {
                setState(() {
                  if (selectedValue == FilterOption.Favorite) {
                    _showFavoriteOnly = true;
                  } else {
                    _showFavoriteOnly = false;
                  }
                });
              },
              itemBuilder: (ctx) => [
                    const PopupMenuItem(
                      value: FilterOption.Favorite,
                      child: Text('Only Favorites'),
                    ),
                    const PopupMenuItem(
                      value: FilterOption.All,
                      child: Text('Show All'),
                    ),
                  ]),
          Consumer<Cart>(
            builder: (ctx, items, ch) {
              return Badge(
                value: items.itemCount.toString(),
                child: ch as Widget,
              );
            },
            child: IconButton(
                onPressed: () {
                  Navigator.of(context).pushNamed(CartScreen.routename);
                },
                icon: const Icon(Icons.shopping_cart_rounded)),
          )
        ],
      ),
      body: ProductGrid(_showFavoriteOnly),
      drawer: Drawers()
    );
  }
}
