import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:shop/models/cart.dart';

class Order {
  final String id;
  final double total;
  final List<CartItem> products;
  final DateTime date;

  Order({
    this.id,
    this.total,
    this.products,
    this.date,
  });
}

class Orders with ChangeNotifier {
  List<Order> _items = [];

  List<Order> get getItems {
    return [..._items];
  }

  int get getItemsCount{
    return _items.length;
  }

  void addOrder(Cart cart) {
    _items.insert(
      0,
      Order(
        id: Random().nextDouble().toString(),
        total: cart.getTotalAmout,
        date: DateTime.now(),
        products: cart.getItems.values.toList(),
      ),
    );

    notifyListeners();
  }
}
