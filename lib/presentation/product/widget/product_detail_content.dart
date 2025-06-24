import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


import '../../../core/app_color.dart';
import '../../../core/app_text_style.dart';
import '../../../domain/entities/product_entity.dart';


  class ProductDetailContent extends StatelessWidget {
    final ProductEntity product;

    const ProductDetailContent({super.key, required this.product});

    @override
    Widget build(BuildContext context) {
      return SingleChildScrollView(
        padding:  EdgeInsets.all(16.0.r),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16.r),
                boxShadow: [
                  BoxShadow(
                    color: AppColor.shadowColor,
                    blurRadius: 8.r,
                    offset: Offset(0, 4),
                  ),
                ],
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(16.r),
                child: Image.asset(
                  product.imageUrl,
                  height: 220.h,
                  fit: BoxFit.contain,
                ),
              ),
            ),
             SizedBox(height: 24.h),
            Text(
              product.title,
              style: AppTextStyle.detailTitle,
            ),
             SizedBox(height: 12.h),
            Text(
              product.description,
              style: AppTextStyle.detailDescription,
            ),
          ],
        ),
      );
    }
  }
