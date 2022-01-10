import 'package:flutter/material.dart';

class CartItem {
  final String description;
  final String size;
  final double price;
  final int quantiy;

  CartItem({required this.description, required this.size, required this.price, required this.quantiy});
}

class CartModel with ChangeNotifier {
  final List<CartItem> _items = [];

  List<CartItem> get items {
    return [..._items];
  }

  void addCartItem(CartItem value) {
    _items.add(value);
    notifyListeners();
  }
}