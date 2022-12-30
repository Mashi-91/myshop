import 'dart:math';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../providers/order.dart' as ord;

class OrdersItems extends StatefulWidget {
  final ord.OrderItem order;

  const OrdersItems(this.order);

  @override
  State<OrdersItems> createState() => _OrdersItemsState();
}

class _OrdersItemsState extends State<OrdersItems> {
  var _expanded = false;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(10),
      child: Column(
        children: [
          ListTile(
            title: Text('\$${widget.order.amount.toStringAsFixed(2)}'),
            subtitle: Text(
                DateFormat('dd/MM/yyyy-hh:mm').format(widget.order.dateTime)),
            trailing: IconButton(
              icon: _expanded
                  ? const Icon(Icons.expand_less_rounded)
                  : const Icon(Icons.expand_more_rounded),
              onPressed: () {
                setState(() {
                  _expanded = !_expanded;
                });
              },
            ),
          ),
          if (_expanded)
            Container(
              height: min(widget.order.products.length * 20 + 10, 100),
              padding: const EdgeInsets.all(10),
              child: ListView(
                children: widget.order.products
                    .map((prod) => Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              prod.title,
                              style: const TextStyle(fontSize: 18),
                            ),
                            Text('${prod.quantity} x \$${prod.price}',
                            style: const TextStyle(fontSize: 18, color: Colors.grey),
                            )
                          ],
                        ))
                    .toList(),
              ),
            )
        ],
      ),
    );
  }
}
