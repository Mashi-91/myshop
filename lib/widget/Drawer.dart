import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import '../screens/user_product_screen.dart';
import '../screens/order_screen.dart';

class Drawers extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Drawer(
        child: Column(
          children: [
            AppBar(
              title: const Text('Hello Friends!'),
              automaticallyImplyLeading: false,
            ),
            ListTile(
              leading: const Icon(Icons.shop_rounded, color: Colors.black,),
              title: const Text('Shop', style: TextStyle(fontWeight: FontWeight.w900),),
              onTap: () {
                Navigator.of(context).pushReplacementNamed('/');
              },
            ),
            const Divider(),
            ListTile(
              leading: const Icon(Icons.payment, color: Colors.black,),
              title: const Text('Orders', style: TextStyle(fontWeight: FontWeight.w900),),
              onTap: () {
                Navigator.of(context).pushReplacementNamed(OrderScreen.routename);
              },
            ),
            const Divider(),
            ListTile(
              leading: const Icon(EvaIcons.peopleOutline, color: Colors.black,),
              title: const Text('Manage Product', style: TextStyle(fontWeight: FontWeight.w900),),
              onTap: () {
                Navigator.of(context).pushReplacementNamed(UserProductScreen.routename);
              },
            ),
          ],
        ),
      ),
    );
  }
}
