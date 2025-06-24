import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../core/utils.dart';
import '../../../domain/entities/product_entity.dart';
import '../../../domain/usecases/get_products_usecase.dart';
import 'product_event.dart';
import 'product_state.dart';

class ProductBloc extends Bloc<ProductEvent, ProductState> {
  final GetProductsUseCase getProductsUseCase;

  ProductBloc({required this.getProductsUseCase}) : super(ProductState.initial()) {
    on<LoadProductsEvent>(_onLoadProducts);
  }

  Future<void> _onLoadProducts(
      LoadProductsEvent event,
      Emitter<ProductState> emit,
      ) async {
    emit(state.copyWith(isLoading: true, errorMessage: null));
    try {
      final List<ProductEntity> products = await getProductsUseCase();
      emit(state.copyWith(isLoading: false, products: products));
    } catch (e) {
      emit(state.copyWith(isLoading: false,));
      /// Show an error toast
      showErrorToast(message: "Failed to load products");
    }
  }
}
