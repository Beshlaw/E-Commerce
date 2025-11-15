import 'package:bloc/bloc.dart';
import 'package:e_commerce_app/models/product_model.dart';
import 'package:e_commerce_app/services/product_api.dart';
import 'package:meta/meta.dart';

part 'all_product_state.dart';

class AllProductCubit extends Cubit<AllProductState> {
  AllProductCubit() : super(AllProductInitial());
  fetchAllProducts() async {
    emit(AllProductLoading());
    try {
      List<ProductModel> products = await ProductApi().getAllProducts();
      emit(AllProductLoaded(products: products));
    } catch (e) {
      emit(AllProductError(message: e.toString()));
    }
  }
}
