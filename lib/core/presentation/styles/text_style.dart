import 'package:cleanar_base_app/core/presentation/styles/app_colors.dart';
import 'package:flutter/material.dart';

///Class to handle kind of text style
class AppTextStyle {
  /// text style for carousel messages
  static const TextStyle title = TextStyle(
    fontSize: 24,
    fontWeight: FontWeight.w600,
    color: AppColors.primaryColor,
  );

  static const TextStyle subtitle = TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.w600,
    color: AppColors.backgroundColor,
  );

  static const TextStyle textButton = TextStyle(
    fontWeight: FontWeight.w600,
    color: AppColors.secondaryColor,
  );

  static const TextStyle eButton = TextStyle(
    fontWeight: FontWeight.w600,
    color: Colors.white,
  );
}
