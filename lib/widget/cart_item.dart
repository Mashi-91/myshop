import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/cart.dart';

class CartItem extends StatelessWidget {
  final String id;
  final double price;
  final String? productId;
  final int quantity;
  final String title;

  const CartItem(
      {required this.quantity,
      required this.price,
      required this.id,
      required this.title,
      this.productId});

  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<Cart>(context, listen: false);
    return Dismissible(
      confirmDismiss: (direction) {
        return showDialog(context: context, builder: (_) => AlertDialog(
          title: const Text('Are you sure?'),
          content: const Text('Do you want to remove the item from the cart?'),
          actions: [
            ElevatedButton(onPressed: (){
              Navigator.of(context).pop();
            }, child: const Text('No')),
            ElevatedButton(onPressed: (){
              Navigator.of(context).pop(true);
            }, child: const Text('Yes')),
          ],
        ));
      },
      key: ValueKey(id),
      onDismissed: (direction) {
        cart.removeItem(productId!);
      },
      direction: DismissDirection.endToStart,
      background: Container(
        color: Theme.of(context).errorColor,
        alignment: Alignment.centerRight,
        padding: const EdgeInsets.only(right: 20),
        margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 7),
        child: const Icon(
          Icons.delete,
          size: 40,
          color: Colors.white,
        ),
      ),
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        elevation: 5,
        margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 7),
        child: Padding(
          padding: const EdgeInsets.all(8),
          child: ListTile(
            leading: Container(
              height: 80,
              width: 40,
              color: Colors.red,
              child: FittedBox(
                  fit: BoxFit.cover,
                  child: Text(
                    '\$$price',
                    style: const TextStyle(color: Colors.white),
                  )),
            ),
            title: Text(title),
            subtitle: Text('Total: \$${(price * quantity)}'),
            trailing: Text('$quantity x'),
          ),
        ),
      ),
    );
  }
}
