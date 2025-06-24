

import 'package:product_list/core/constant.dart';
import 'package:product_list/data/models/product_model.dart';

class ApiService {
  Future<List<ProductModel>> fetchProducts() async {
    await Future.delayed(const Duration(seconds: 1));

    return dummyProductJsonList
        .map((json) => ProductModel.fromJson(json))
        .toList();
  }
}