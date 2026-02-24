import 'package:flutter/material.dart';
import 'package:shopping_cart/features/cart/domain/item.dart';

class CartProvider extends ChangeNotifier {
  final List<Item> _items = [];
  List<Item> get items => _items;

  double get totalprice => _items.fold(0, (sum, item) => sum + item.price);

  void addItem(Item item) {
    _items.add(item);
    notifyListeners();
  }

  void removeItem(Item item) {
    _items.remove(item);
    notifyListeners();
  }
}