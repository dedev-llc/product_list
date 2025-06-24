// di/injection.dart
import 'package:get_it/get_it.dart';
import 'package:product_list/domain/repositories/product_repository.dart';



import '../../data/repositories/product_repository_impl.dart';
import '../../domain/usecases/get_products_usecase.dart';
import '../../presentation/product/bloc/product_bloc.dart';
import 'api_service.dart';


final di = GetIt.instance;

Future<void> init() async {
  // Services
  di.registerLazySingleton<ApiService>(() => ApiService());

  // Repository
  di.registerLazySingleton<ProductRepository>(() => ProductRepositoryImpl(apiService: di()));

  // UseCases
  di.registerLazySingleton(() => GetProductsUseCase(di()));

  // BLoC
  di.registerFactory(() => ProductBloc(getProductsUseCase: di()));
}
