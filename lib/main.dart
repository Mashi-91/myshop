import 'package:flutter/material.dart';
import 'package:myshop/providers/order.dart';
import 'package:myshop/screens/cart_screen.dart';
import 'providers/cart.dart';
import '../screens/product_detail_screen.dart';
import '../screens/product_overview_screen.dart';
import 'package:provider/provider.dart';

import 'providers/product_provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
        create: (ctx) => Products()),
        ChangeNotifierProvider.value(value: Cart()),
        ChangeNotifierProvider.value(value: Order())
    ],
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'MyShop',
          theme: ThemeData(
            primarySwatch: Colors.purple,
            primaryColor: Colors.deepOrange,
            fontFamily: 'Lato'
          ),
          // home: ProductOverviewScreen(),
          routes: {
            '/': (ctx) => ProductOverviewScreen(),
            ProductDetailScreen.routname: (ctx) => ProductDetailScreen(),
            CartScreen.routename: (ctx) => CartScreen()
          },
        ),
      );
  }
}

