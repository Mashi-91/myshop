import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:myshop/screens/edit_screen.dart';
import '../providers/product_provider.dart';
import '../widget/user_product_items.dart';
import 'package:provider/provider.dart';

import '../widget/Drawer.dart';

class UserProductScreen extends StatelessWidget {
  static const routename = 'userproductscreen';

  @override
  Widget build(BuildContext context) {
    final productsData = Provider.of<ProductProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Your Products'),
        actions: [
          IconButton(
            icon: const Icon(EvaIcons.personAdd),
            onPressed: () {
              Navigator.of(context).pushNamed(EditProductScreen.routename);
            },
          )
        ],
      ),
      drawer: Drawers(),
      body: Padding(
        padding: EdgeInsets.all(8),
        child: ListView.builder(
            itemCount: productsData.items.length,
            itemBuilder: (_, i) => Column(
              children: [
                UserProductItems(
                    title: productsData.items[i].title,
                    imageUrl: productsData.items[i].imageUrl),
                Divider()
              ],
            )),
      ),
    );
  }
}
