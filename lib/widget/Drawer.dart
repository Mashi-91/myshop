import 'package:flutter/material.dart';
import '../screens/order_screen.dart';

class Drawers extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Drawer(
        child: Column(
          children: [
            AppBar(
              title: Text('Hello Friends!'),
              automaticallyImplyLeading: false,
            ),
            ListTile(
              leading: Icon(Icons.shop_rounded, color: Colors.black,),
              title: Text('Shop', style: TextStyle(fontWeight: FontWeight.w900),),
              onTap: () {
                Navigator.of(context).pushReplacementNamed('/');
              },
            ),
            Divider(),
            ListTile(
              leading: Icon(Icons.payment, color: Colors.black,),
              title: Text('Orders', style: TextStyle(fontWeight: FontWeight.w900),),
              onTap: () {
                Navigator.of(context).pushReplacementNamed(OrderScreen.routename);
              },
            ),
          ],
        ),
      ),
    );
  }
}
