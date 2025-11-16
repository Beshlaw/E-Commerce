import 'package:e_commerce_app/models/product_model.dart';
import 'package:hive/hive.dart';
part 'cart_item_model_enhanced.g.dart';

@HiveType(typeId: 4)
class CartItemModelEnhanced {
  @HiveField(0)
  final ProductModel product;
  @HiveField(1)
  final int qty;

  CartItemModelEnhanced({required this.product, required this.qty});
}
