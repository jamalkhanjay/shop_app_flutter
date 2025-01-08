import 'package:flutter/material.dart';

class CartProvider extends ChangeNotifier {
  List<Map<String, dynamic>> cart = [];

  // Here in this case we want to add and removed items to the cart

  void addToCart(Map<String, dynamic> product) {
    cart.add(product);
    notifyListeners();
  }

  // Implemented with array function just to check it works propely the
  // Remove method
  void removeFromCart(Map<String, dynamic> product) {
    cart.remove(product);
    notifyListeners();
  }
}
