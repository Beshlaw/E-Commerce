import 'package:e_commerce_app/models/cart_item_model_enhanced.dart';
import 'package:e_commerce_app/models/product_model.dart';
import 'package:hive/hive.dart';

class StableCart {
  final _collection = Hive.box<CartItemModelEnhanced>('stableCartBox');
  List<CartItemModelEnhanced> get cartItems => _collection.values.toList();
  Future<void> addItem(ProductModel product) async {
    final index = cartItems.indexWhere((item) => item.product.id == product.id);
    if (index != -1) {
      final currentItem = cartItems[index];
      final updatedItem = CartItemModelEnhanced(
        product: currentItem.product,
        qty: currentItem.qty + 1,
      );
      await _collection.putAt(index, updatedItem);
    } else {
      await _collection.add(CartItemModelEnhanced(product: product, qty: 1));
    }
  }

  Future<void> decreaseItem(ProductModel product) async {
    final index = cartItems.indexWhere((item) => item.product.id == product.id);
    if (index != -1) {
      if (cartItems[index].qty > 1) {
        final currentItem = cartItems[index];
        final updatedItem = CartItemModelEnhanced(
          product: currentItem.product,
          qty: currentItem.qty - 1,
        );
        await _collection.putAt(index, updatedItem);
      } else {
        await _collection.deleteAt(index);
      }
    }
  }

  double get totalPrice {
    double totalPrice = 0.0;
    for (var item in cartItems) {
      totalPrice += item.product.price * item.qty;
    }
    return totalPrice;
  }

  int get totalItems {
    int totalItems = 0;
    for (var item in cartItems) {
      totalItems += item.qty;
    }
    return totalItems;
  }
}
