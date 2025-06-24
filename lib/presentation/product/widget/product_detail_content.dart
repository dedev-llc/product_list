import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:product_list/core/strings.dart';
import '../../../core/app_color.dart';
import '../../../core/app_text_style.dart';
import '../../../domain/entities/product_entity.dart';

class ProductDetailContent extends StatefulWidget {
  final ProductEntity product;

  const ProductDetailContent({super.key, required this.product});

  @override
  State<ProductDetailContent> createState() => _ProductDetailContentState();
}

class _ProductDetailContentState extends State<ProductDetailContent> {
  bool showFullDescription = false;

  @override
  Widget build(BuildContext context) {
    final description = widget.product.description;
    final isLong = description.length > 100;

    return SingleChildScrollView(
      padding: EdgeInsets.all(16.0.r),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          /// Product Image
          AnimatedContainer(
            duration: const Duration(milliseconds: 300),
            curve: Curves.easeInOut,
            height: showFullDescription ? 160.h : 220.h,
            width: double.infinity,
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
                widget.product.imageUrl,
                fit: BoxFit.cover,
              ),
            ),
          ),

          SizedBox(height: 24.h),

          // Product Title
          Text(
            widget.product.title,
            style: AppTextStyle.detailTitle,
            textAlign: TextAlign.center,
          ),

          SizedBox(height: 12.h),

          /// Product Description with View More toggle
          Text(
            isLong && !showFullDescription
                ? '${description.substring(0, 100)}...'
                : description,
            style: AppTextStyle.detailDescription,
            textAlign: TextAlign.center,
          ),

          if (isLong)
            TextButton(
              onPressed: () {
                setState(() {
                  showFullDescription = !showFullDescription;
                });
              },
              child: Text(showFullDescription ? Strings.viewLess: Strings.viewMore),
            ),

          SizedBox(height: 24.h),
        ],
      ),
    );
  }
}



