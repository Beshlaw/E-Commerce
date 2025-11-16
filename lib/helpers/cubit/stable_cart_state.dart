part of 'stable_cart_cubit.dart';

@immutable
sealed class StableCartState {}

final class StableCartInitial extends StableCartState {}

final class StableCartLoading extends StableCartState {}

final class StableCartLoaded extends StableCartState {
  final List<CartItemModelEnhanced> cartItems;
  final double cartTotalPrice;
  StableCartLoaded(this.cartItems, this.cartTotalPrice);
}

final class StableCartError extends StableCartState {
  final String message;
  StableCartError(this.message);
}
