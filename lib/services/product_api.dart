import 'package:dio/dio.dart';
import 'package:e_commerce_app/models/product_model.dart';

class ProductApi {
  final Dio _dio = Dio(BaseOptions(baseUrl: 'https://fakestoreapi.com'));
  Future<List<ProductModel>> getAllProducts() async {
    try {
      final response = await _dio.get('/products');
      List data = response.data;
      return data.map((e) => ProductModel.fromJson(e)).toList();
    } catch (e) {
      throw Exception(e);
    }
  }

  Future<ProductModel> getProductById(int id) async {
    try {
      final response = await _dio.get('/products/$id');
      return ProductModel.fromJson(response.data);
    } catch (e) {
      throw Exception(e);
    }
  }
}
