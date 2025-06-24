import 'package:flutter/material.dart';


/// Color class to manage all app colors
class AppColor {
  AppColor._();

  static const Color primaryToastBackground = Color(0xffC7FFD6);
  static const Color primaryToastText = Color(0xff000000);
  static const Color errorToastBackground = Color(0xffffb4b4);
  static const Color errorToastText = Color(0xff000000);

  /// Commonly used text and shadow colors
  static const Color textPrimary = Color(0xff000000);
  static const Color textSecondary = Color(0xDD000000); // Approx. black87
  static const Color shadowColor = Color(0x1F000000);   // Approx. black12

  /// New colors added
  static const Color cardBackground = Color(0xFFFFFFFF);
  static const Color cardTextTitle = Color(0xFF212121);
  static const Color cardTextSubtitle = Color(0xFF616161);
}