import 'package:flutter/material.dart';
import '../providers/order.dart';
import '../providers/cart.dart';
import 'package:provider/provider.dart';
import '../widget/cart_item.dart';

class CartScreen extends StatelessWidget {
  static const routename = 'cart-screen';

  @override
  Widget build(BuildContext context) {
    final order = Provider.of<Order>(context, listen: false);
    final cart = Provider.of<Cart>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Your Cart'),
      ),
      body: Column(
        children: [
          Card(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            elevation: 5,
            margin: const EdgeInsets.all(15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Padding(
                  padding: EdgeInsets.all(10.0),
                  child: Text('Total', style: TextStyle(fontSize: 20)),
                ),
                const Spacer(),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Chip(
                    label: Text(
                      '\$${cart.totalAmount.toStringAsFixed(2)}',
                      style: const TextStyle(color: Colors.white),
                    ),
                    backgroundColor: Theme.of(context).primaryColor,
                  ),
                ),
                Container(
                  height: 68,
                  width: 80,
                  decoration: BoxDecoration(
                    color: Theme.of(context).primaryColor,
                    borderRadius: const BorderRadius.only(
                      topRight: Radius.circular(5),
                      bottomRight: Radius.circular(5),
                    ),
                  ),
                  child: TextButton(
                    child: const Text(
                      'ORDER NOW',
                      style: TextStyle(
                          fontSize: 10,
                          color: Colors.white,
                          fontWeight: FontWeight.w900),
                    ),
                    onPressed: () {
                      order.addOrder(cart.items.values.toList(), cart.totalAmount);
                    cart.clear();
                      },
                  ),
                )
              ],
            ),
          ),
          Expanded(
              child: ListView.builder(
                  itemCount: cart.itemCount,
                  itemBuilder: (ctx, index) => CartItem(
                      quantity: cart.items.values.toList()[index].quantity,
                      price: cart.items.values.toList()[index].price,
                      productId: cart.items.keys.toList()[index],
                      id: cart.items.values.toList()[index].id,
                      title: cart.items.values.toList()[index].title)))
        ],
      ),
    );
  }
}
