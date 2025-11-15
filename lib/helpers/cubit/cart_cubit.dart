import 'package:bloc/bloc.dart';
import 'package:e_commerce_app/models/cart_item_model.dart';
import 'package:e_commerce_app/services/cart_services.dart';
import 'package:meta/meta.dart';

part 'cart_state.dart';

class CartCubit extends Cubit<CartState> {
  CartCubit() : super(CartInitial()) {
    loadCart();
  }

  void loadCart() {
    emit(CartLoading());

    try {
      final items = CartServices.getCart();
      emit(CartLoaded(items));
    } catch (e) {
      emit(CartError(e.toString()));
    }
  }

  Future<void> addItem(String id) async {
    await CartServices.addItem(id);
    loadCart();
  }

  Future<void> decreaseItem(String id) async {
    await CartServices.decreaseItem(id);
    loadCart();
  }

  Future<void> removeItem(String id) async {
    await CartServices.removeItem(id);
    loadCart();
  }
}
