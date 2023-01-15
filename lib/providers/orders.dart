import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

import 'cart.dart';

class OrderItem {
  final String id;
  final double amount;
  final List<CartItem> products;
  final DateTime dateTime;

  OrderItem({
    @required this.id,
    @required this.amount,
    @required this.products,
    @required this.dateTime,
  });
}

class Orders with ChangeNotifier {
  List<OrderItem> _orders = [];

  List<OrderItem> get orders {
    return [..._orders];
  }

  Future<void> fetchAndSetOrders() async {
    final url = Uri.parse(
        'https://myshop-3abf1-default-rtdb.firebaseio.com/orders.json');
    final response = await http.get(url);
    final List<OrderItem> loadedOrder = [];
    final extractedData = jsonDecode(response.body) as Map<String, dynamic>;
    if (extractedData == null) {
      return;
    }
    extractedData.forEach((OrderID, OrderData) {
      loadedOrder.add(
        OrderItem(
          id: OrderID,
          amount: OrderData['amount'],
          products: (OrderData['products'] as List<dynamic>)
              .map((items) => CartItem(
                  id: items['id'],
                  title: items['title'],
                  quantity: items['quantity'],
                  price: items['price']))
              .toList(),
          dateTime: DateTime.parse(OrderData['dateTime']),
        ),
      );
    });
    _orders = loadedOrder.reversed.toList();
    notifyListeners();
  }

  Future<void> addOrder(List<CartItem> cartProducts, double total) async {
    final url = Uri.parse(
        'https://myshop-3abf1-default-rtdb.firebaseio.com/orders.json');
    final timeStamp = DateTime.now();
    final resp = await http.post(url,
        body: jsonEncode({
          'amount': total,
          'dateTime': timeStamp.toIso8601String(),
          'products': cartProducts
              .map((cp) => {
                    'id': cp.id,
                    'title': cp.title,
                    'quantity': cp.quantity,
                    'price': cp.price
                  })
              .toList()
        }));
    _orders.insert(
      0,
      OrderItem(
        id: jsonDecode(resp.body)['name'],
        amount: total,
        dateTime: timeStamp,
        products: cartProducts,
      ),
    );
    notifyListeners();
  }
}
