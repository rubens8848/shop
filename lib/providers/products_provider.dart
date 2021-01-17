import 'package:flutter/material.dart';
import 'package:shop/data/dummy_data.dart';
import 'package:shop/models/product.dart';

class ProductsProvider with ChangeNotifier {
  List<Product> _items = DUMMY_PRODUCTS;

  bool _showFavoriteOnly = false;

  List<Product> get getItems {
    if (_showFavoriteOnly) {
      return _items.where((product) => product.isFavorite).toList();
    }
    return [..._items];
  }

  void showFavoriteOnly(){
    _showFavoriteOnly = true;
    notifyListeners();
  }

  void showAll(){
    _showFavoriteOnly = false;
    notifyListeners();
  }

  void addProduct(Product product) {
    _items.add(product);
    notifyListeners();
  }
}
