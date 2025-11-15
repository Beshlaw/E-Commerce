import 'package:bloc/bloc.dart';
import 'package:e_commerce_app/models/product_model.dart';
import 'package:e_commerce_app/services/product_api.dart';
import 'package:meta/meta.dart';

part 'product_by_id_state.dart';

class ProductByIdCubit extends Cubit<ProductByIdState> {
  ProductByIdCubit() : super(ProductByIdInitial());
  fetchProductById(int id) async {
    emit(ProductByIdLoading());
    try {
      ProductModel productModel = await ProductApi().getProductById(id);
      emit(ProductByIdLoaded(product: productModel));
    } catch (e) {
      emit(ProductByIdError(message: e.toString()));
    }
  }
}
