import 'package:flutter/material.dart';
import 'app-colors.dart';
import 'app-text-styles.dart';
import 'app-spacing.dart';
import 'app-icons-size.dart';

class AppThemes {
  static final ThemeData light = ThemeData(
    primaryColor: AppColors.primary,
    colorScheme:
        ColorScheme.fromSwatch().copyWith(secondary: AppColors.secondary),
    canvasColor: AppColors.white,
    scaffoldBackgroundColor: AppColors.white,
    textTheme: TextTheme(
      headlineLarge: AppTextStyles.h1,
      headlineMedium: AppTextStyles.h2,
      headlineSmall: AppTextStyles.h3,
      titleLarge: AppTextStyles.h4,
      titleMedium: AppTextStyles.h5,
      titleSmall: AppTextStyles.h6,
      bodyLarge: AppTextStyles.bodyLG,
      bodyMedium: AppTextStyles.bodyMD,
      bodySmall: AppTextStyles.bodySM,
      labelLarge: AppTextStyles.captionLG,
      labelMedium: AppTextStyles.captionMD,
      labelSmall: AppTextStyles.captionSM,
      displayLarge: AppTextStyles.display1,
      displayMedium: AppTextStyles.display2,
    ),
    iconTheme: IconThemeData(
      size: AppIconsSize.small,
      color: AppColors.primary,
    ),
    buttonTheme: ButtonThemeData(
      buttonColor: AppColors.primary,
      textTheme: ButtonTextTheme.primary,
    ),
  inputDecorationTheme: InputDecorationTheme(
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(AppSpacing.s8),
        borderSide: BorderSide(color: AppColors.grayCB),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(AppSpacing.s8),
        borderSide: BorderSide(color: AppColors.primary),
      ),
    ),
  );
}
