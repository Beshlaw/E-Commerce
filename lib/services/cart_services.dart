import 'package:e_commerce_app/models/cart_item_model.dart';
import 'package:hive/hive.dart';

class CartServices {
  static Box<CartItemModel> get box => Hive.box<CartItemModel>('cartBox');
  static List<CartItemModel> getCart() {
    return box.values.toList();
  }

  static Future<void> addItem(String id) async {
    final index = getCart().indexWhere((item) => item.id == id);

    if (index != -1) {
      final current = box.getAt(index)!;
      final updated = CartItemModel(id: current.id, qty: current.qty + 1);
      await box.putAt(index, updated);
    } else {
      await box.add(CartItemModel(id: id, qty: 1));
    }
  }

  static Future<void> decreaseItem(String id) async {
    final index = box.values.toList().indexWhere((item) => item.id == id);
    if (index != -1) {
      final current = box.getAt(index)!;
      if (current.qty > 1) {
        final updated = CartItemModel(id: current.id, qty: current.qty - 1);
        await box.putAt(index, updated);
      } else {
        await box.deleteAt(index);
      }
    }
  }

  static Future<void> removeItem(String id) async {
    final index = box.values.toList().indexWhere((item) => item.id == id);
    if (index != -1) {
      await box.deleteAt(index);
    }
  }
}
