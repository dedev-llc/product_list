
import 'package:equatable/equatable.dart';
import '../../../domain/entities/product_entity.dart';

class ProductState extends Equatable {
  final bool isLoading;
  final List<ProductEntity> products;
  final String? errorMessage;

  const ProductState({
    this.isLoading = false,
    this.products = const [],
    this.errorMessage,
  });

  ProductState copyWith({
    bool? isLoading,
    List<ProductEntity>? products,
    String? errorMessage,
  }) {
    return ProductState(
      isLoading: isLoading ?? this.isLoading,
      products: products ?? this.products,
      errorMessage: errorMessage,
    );
  }

  factory ProductState.initial() => const ProductState();

  @override
  List<Object?> get props => [isLoading, products, errorMessage];
}
