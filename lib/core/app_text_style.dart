import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'app_color.dart';

class AppTextStyle {
  AppTextStyle._();

  static TextStyle titleLarge(BuildContext context) => Theme.of(context).textTheme.titleMedium!.copyWith(
    fontWeight: FontWeight.bold,
    color: AppColor.cardTextTitle,
  );

  static TextStyle subtitleMedium(BuildContext context) => Theme.of(context).textTheme.bodyMedium!.copyWith(
    color: AppColor.cardTextSubtitle,
  );

  static TextStyle detailTitle = TextStyle(
    fontSize: 26.sp,
    fontWeight: FontWeight.bold,
    color: AppColor.textPrimary,
  );

  static TextStyle detailDescription = TextStyle(
    fontSize: 16.sp,
    color: AppColor.textSecondary,
  );
}
