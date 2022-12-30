import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:myshop/providers/cart.dart';
import 'package:myshop/providers/product_provider.dart';
import 'package:provider/provider.dart';

class UserProductItems extends StatelessWidget {
  final String title;
  final String imageUrl;

  const UserProductItems(
      {super.key, required this.title, required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(title),
      leading: CircleAvatar(
        radius: 30,
        backgroundImage: NetworkImage(imageUrl),
      ),
      trailing: Container(
        width: 100,
        child: Row(
          children: [
            IconButton(
                onPressed: () {},
                icon: Icon(
                  EvaIcons.edit2Outline,
                  color: Theme.of(context).primaryColor,
                )),
            IconButton(
                onPressed: () {
                },
                icon: Icon(
                  EvaIcons.trash2Outline,
                  color: Theme.of(context).errorColor,
                )),
          ],
        ),
      ),
    );
  }
}
