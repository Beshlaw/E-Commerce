import 'package:bloc/bloc.dart';
import 'package:e_commerce_app/models/cart_item_model_enhanced.dart';
import 'package:e_commerce_app/models/product_model.dart';
import 'package:e_commerce_app/services/stable_cart.dart';
import 'package:meta/meta.dart';

part 'stable_cart_state.dart';

class StableCartCubit extends Cubit<StableCartState> {
  StableCartCubit() : super(StableCartInitial()) {
    loadCartitems();
  }
  loadCartitems() {
    try {
      final items = StableCart().cartItems;
      final cartTotalPrice = StableCart().totalPrice;
      emit(StableCartLoaded(items, cartTotalPrice));
    } catch (e) {
      emit(StableCartError(e.toString()));
    }
  }

  addItem(ProductModel product) async {
    emit(StableCartLoading());
    await StableCart().addItem(product);
    loadCartitems();
  }

  decreaseItem(ProductModel product) async {
    emit(StableCartLoading());
    await StableCart().decreaseItem(product);
    loadCartitems();
  }
}
