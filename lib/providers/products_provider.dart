import 'package:flutter/material.dart';
import 'package:shop/data/dummy_data.dart';
import 'package:shop/models/product.dart';

class ProductsProvider with ChangeNotifier {
  List<Product> _items = DUMMY_PRODUCTS;

  List<Product> get getItems => [..._items];
  
  List<Product> get getFavoriteItems => _items.where((prod) => prod.isFavorite).toList();
  
  void addProduct(Product product) {
    _items.add(product);
    notifyListeners();
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