import 'package:flutter/material.dart';
import 'package:myshop/providers/product_provider.dart';
import 'package:provider/provider.dart';

class ProductDetailScreen extends StatelessWidget {
  static const routname = 'product-detail-screen';

  @override
  Widget build(BuildContext context) {
    final productId = ModalRoute.of(context)?.settings.arguments as String;
    final loadedProduct =
        Provider.of<ProductProvider>(context, listen: false).findById(productId);
    return Scaffold(
      appBar: AppBar(
        title: Text(loadedProduct.title),
      ),
      body: Column(
        children: [
          Stack(
            children: [
              Card(
                shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.only(topLeft: Radius.circular(15), topRight: Radius.circular(15))),
                margin: const EdgeInsets.symmetric(horizontal: 10),
                elevation: 5,
                child: ClipRRect(
                  borderRadius: const BorderRadius.only(topLeft: Radius.circular(15), topRight: Radius.circular(15)),
                  child: Image.network(loadedProduct.imageUrl),
                ),
              ),
              Positioned(
                top: 30,
                right: 0,
                child: Padding(
                  padding: const EdgeInsets.all(15),
                  child: Container(
                    height: 40,
                    width: 70,
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                        borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(7),
                            bottomLeft: Radius.circular(7)),
                        color: Colors.black.withOpacity(0.4)),
                    child: Text(
                      '\$${loadedProduct.price}',
                      style: const TextStyle(fontWeight: FontWeight.w900),
                    ),
                  ),
                ),
              )
            ],
          ),
          Card(
            elevation: 5,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 104, vertical: 20),
                  child: Text(loadedProduct.description)))
        ],
      ),
    );
  }
}
