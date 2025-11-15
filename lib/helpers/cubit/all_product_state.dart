part of 'all_product_cubit.dart';

@immutable
sealed class AllProductState {}

final class AllProductInitial extends AllProductState {}

final class AllProductLoading extends AllProductState {}

final class AllProductLoaded extends AllProductState {
  final List<ProductModel> products;
  AllProductLoaded({required this.products});
}

final class AllProductError extends AllProductState {
  final String message;
  AllProductError({required this.message});
}
