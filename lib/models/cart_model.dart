import 'package:flutter/material.dart';

class CartItem {
  final String description;
  final String size;
  final double price;
  final int quantiy;

  CartItem({required this.description, required this.size, required this.price, required this.quantiy});
}

class CartModel with ChangeNotifier {
  final List<CartItem> _items = [
    // CartItem(description: 'test 1', size: 'size A', price: 5, quantiy: 2),
    // CartItem(description: 'test 2', size: 'size B', price: 5, quantiy: 2)
  ];

  List<CartItem> get items {
    return [..._items];
  }

  double get totalAmount {
    double total = 0;
    for (var i = 0; i < _items.length; i++) {
      total += _items[i].price * _items[i].quantiy;
    }
    return total;
  }

  void addCartItem(CartItem value) {
    _items.add(value);
    notifyListeners();
  }
}