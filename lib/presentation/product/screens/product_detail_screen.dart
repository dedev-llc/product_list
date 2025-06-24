import 'package:flutter/material.dart';

import '../../../domain/entities/product_entity.dart';
import '../widget/product_detail_content.dart';





class ProductDetailScreen extends StatelessWidget {
  final ProductEntity product;

  const ProductDetailScreen({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(product.title),
        centerTitle: true,
        elevation: 2,
      ),
      body: ProductDetailContent(product: product),
    );
  }
}
