import 'package:flutter/foundation.dart';

class CartProvider extends ChangeNotifier {
  int _cartCount = 0;

  int get cartCount => _cartCount;

  // Experiment 5: Update global cart state
  void addToCart() {
    _cartCount++;

    // Experiment 5: Notify widgets about the state change
    notifyListeners();
  }
}