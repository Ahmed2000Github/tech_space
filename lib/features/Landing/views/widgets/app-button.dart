import 'package:flutter/material.dart';
import 'package:tech_space/configurations/app-colors.dart';
import 'package:tech_space/configurations/app-container-radius.dart';
import 'package:tech_space/configurations/app-text-styles.dart';

class AppButton extends StatelessWidget {
  final void Function() onPressed;
  final String text;
  final Color color;
  final Color? textColor;
  final EdgeInsetsGeometry? padding;

  const AppButton({
    required this.onPressed,
    required this.text,
    required this.color,
     this.textColor,
     this.padding,
    super.key,
  });

  factory AppButton.primary(
      {required void Function() onPressed, required String text, required EdgeInsetsGeometry? padding,
      Color? textColor  = Colors.white}) {
    return AppButton(
      onPressed: onPressed,
      text: text,
      color: AppColors.primary,
      textColor: textColor,
      padding: padding,
    );
  }
  factory AppButton.secondary(
      {required void Function() onPressed, required String text, required EdgeInsetsGeometry? padding,
      Color? textColor  = Colors.white}) {
    return AppButton(
      onPressed: onPressed,
      text: text,
      color: AppColors.secondary,
      textColor: textColor,
      padding: padding,
    );
  }

  @override
  Widget build(BuildContext context) {
    return TextButton(
        onPressed: onPressed,
        style: TextButton.styleFrom(
          backgroundColor: color,
          foregroundColor: textColor,
          padding: padding,
          textStyle: AppTextStyles.buttonLG.copyWith(color: Colors.white),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(AppContainerRadius.radius8),
          ),
        ),
        child: Text(text));
  }
}
