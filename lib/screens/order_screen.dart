import 'package:flutter/material.dart';
import '../providers/order.dart' show Order;
import '../widget/Drawer.dart';
import '../widget/order_items.dart';
import 'package:provider/provider.dart';

class OrderScreen extends StatelessWidget {
  static const routename = '/orderscreen';

  @override
  Widget build(BuildContext context) {
    final orderData = Provider.of<Order>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Your Orders!'),
      ),
      drawer: Drawers(),
      body: ListView.builder(
        itemCount: orderData.orders.length,
          itemBuilder: (ctx, index) => OrdersItems(orderData.orders[index])),
    );
  }
}
