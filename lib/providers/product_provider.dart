import 'package:flutter/material.dart';

import '../data/data.dart';
import 'product.dart';

class Products with ChangeNotifier {
  List<Product> _items = data;
  var _showFavoriteOnly = false;

  List<Product> get showFavoriteOnly {
    return _items.where((prodItem) => prodItem.isFavorite).toList();
  }

  List<Product> get items {
    // if (_showFavoriteOnly) {
    //   return _items.where((prodItem) => prodItem.isFavorite).toList();
    // }
    return [..._items];
  }

  Product findById(String id) {
    return items.firstWhere((pro) => pro.id == id);
  }

  // void showFavoritesOnly() {
  //   _showFavoriteOnly = false;
  //   notifyListeners();
  // }
  //
  // void showAll() {
  //   _showFavoriteOnly = true;
  //   notifyListeners();
  // }

}