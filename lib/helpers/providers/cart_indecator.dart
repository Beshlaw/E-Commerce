import 'package:e_commerce_app/services/stable_cart.dart';
import 'package:flutter/material.dart';

class CartIndecator with ChangeNotifier {
  int _cartIndecator = StableCart().totalItems;
  int get cartIndecator => _cartIndecator;

  cartIncrement() {
    _cartIndecator++;
    notifyListeners();
  }

  cartDecrement() {
    if (cartIndecator != 0) {
      _cartIndecator--;
    }
    notifyListeners();
  }
}
