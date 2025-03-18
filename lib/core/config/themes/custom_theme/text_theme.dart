
import 'package:flutter/material.dart' show BuildContext, FontWeight, TextOverflow, TextStyle, TextTheme;
import 'package:hive_project/core/config/themes/colors.dart';

class TextThemes {
  static TextTheme createTextTheme(BuildContext context) {
    return TextTheme(
      headlineSmall: TextStyle(
        fontSize: 24,
        color: AppColors.textColor,
        overflow: TextOverflow.ellipsis,
      ),

      bodyLarge: TextStyle(
        fontSize: 20,
        color: AppColors.textColor,
        overflow: TextOverflow.ellipsis,
      ),

      titleLarge: TextStyle(
        color: AppColors.textColor,
        fontSize: 18,
        fontWeight: FontWeight.w600,
        overflow: TextOverflow.ellipsis,
      ),

      titleMedium: TextStyle(
        fontSize: 16,
        color: AppColors.textColor,
        fontWeight: FontWeight.w400,
        overflow: TextOverflow.ellipsis,
      ),

      titleSmall: TextStyle(
        fontSize: 14,
        color: AppColors.textColor,
        overflow: TextOverflow.ellipsis,
      ),
      
      bodyMedium: TextStyle(
        fontSize: 12,
        color: AppColors.textColor,
        overflow: TextOverflow.ellipsis,
      ),
    );
  }
}