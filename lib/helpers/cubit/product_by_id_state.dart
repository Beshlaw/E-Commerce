part of 'product_by_id_cubit.dart';

@immutable
sealed class ProductByIdState {}

final class ProductByIdInitial extends ProductByIdState {}

final class ProductByIdLoading extends ProductByIdState {}

final class ProductByIdLoaded extends ProductByIdState {
  final ProductModel product;
  ProductByIdLoaded({required this.product});
}

final class ProductByIdError extends ProductByIdState {
  final String message;
  ProductByIdError({required this.message});
}
