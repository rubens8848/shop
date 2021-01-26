import 'dart:math';

import 'package:flutter/material.dart';
import 'package:shop/data/dummy_data.dart';
import 'package:shop/models/product.dart';

class ProductsProvider with ChangeNotifier {
  List<Product> _items = DUMMY_PRODUCTS;

  List<Product> get getItems => [..._items];

  List<Product> get getFavoriteItems =>
      _items.where((prod) => prod.isFavorite).toList();

  int get getItemsCount {
    return _items.length;
  }

  void addProduct(Product newProduct) {
    _items.add(Product(
      id: Random().nextDouble().toString(),
      title: newProduct.title,
      description: newProduct.description,
      price: newProduct.price,
      imageUrl: newProduct.imageUrl,
    ));
    notifyListeners();
  }

  void updateProduct(Product product) {
    if (product == null || product.id == null) {
      return;
    }

    final index = _items.indexWhere((prod) => prod.id == product.id);

    if (index >= 0) {
      _items[index] = product;
      notifyListeners();
    }
  }

  void deleteProduct(String id) {
    final index = _items.indexWhere((prod) => prod.id == id);
    if (index >= 0) {
      _items.removeWhere((prod) => prod.id == id);
      notifyListeners();
    }
  }
}

// bool _showFavoriteOnly = false;

// void showFavoriteOnly(){
//   _showFavoriteOnly = true;
//   notifyListeners();
// }

// void showAll(){
//   _showFavoriteOnly = false;
//   notifyListeners();
// }
