import 'package:hive/hive.dart';

part 'cart_item_model.g.dart';

@HiveType(typeId: 0)
class CartItemModel {
  @HiveField(0)
  final String id;
  @HiveField(1)
  final int qty;
  CartItemModel({required this.id, required this.qty});
}
