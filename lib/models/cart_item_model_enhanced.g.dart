// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cart_item_model_enhanced.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class CartItemModelEnhancedAdapter extends TypeAdapter<CartItemModelEnhanced> {
  @override
  final int typeId = 4;

  @override
  CartItemModelEnhanced read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return CartItemModelEnhanced(
      product: fields[0] as ProductModel,
      qty: fields[1] as int,
    );
  }

  @override
  void write(BinaryWriter writer, CartItemModelEnhanced obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.product)
      ..writeByte(1)
      ..write(obj.qty);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CartItemModelEnhancedAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
