import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:product_list/core/app_color.dart';
import 'package:product_list/core/app_text_style.dart';
import 'package:product_list/core/strings.dart';

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

      bottomNavigationBar: Padding(
        padding:  EdgeInsets.all(16.0.r),
        child: SizedBox(
          width: double.infinity,
          height: 56.h,
          child: ElevatedButton(
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text('${product.title} ${Strings.addedToCart}')),
              );
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColor.textPrimary,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12.r),
              ),
            ),
            child: Text(
              Strings.addToCart,
              style: AppTextStyle.detailTitle.copyWith(color: Colors.white),
            ),
          ),
        ),
      ),
    );
  }
}

