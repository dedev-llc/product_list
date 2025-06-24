

import 'package:product_list/data/data_source/remote_data_source/api_service.dart';
import 'package:product_list/domain/entities/product_entity.dart';
import 'package:product_list/domain/repositories/product_repository.dart';

class ProductRepositoryImpl implements ProductRepository {
  final ApiService apiService;

  ProductRepositoryImpl({required this.apiService});

  @override
  Future<List<ProductEntity>> getProducts() async {
    final productModels = await apiService.fetchProducts();
    return productModels;
  }
}