// ignore_for_file: public_member_api_docs, sort_constructors_first
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
   TextStyle? textStyle;

  AppButton({
    Key? key,
    required this.onPressed,
    required this.text,
    required this.color,
    this.textColor,
    this.padding,
    this.textStyle,
  }) : super(key: key);

   AppButton.primary({
    required void Function() onPressed,
    required String text,
    required EdgeInsetsGeometry? padding,
    Color? textColor = Colors.white,
    TextStyle? textStyle,
  }):this(
      onPressed: onPressed,
      text: text,
      color: AppColors.primary,
      textColor: textColor,
      padding: padding,
      textStyle: textStyle,
    );
  

   AppButton.secondary({
    required void Function() onPressed,
    required String text,
    required EdgeInsetsGeometry? padding,
    Color? textColor = Colors.white,
    TextStyle? textStyle,
  }) :this(
      onPressed: onPressed,
      text: text,
      color: AppColors.secondary,
      textColor: textColor,
      padding: padding,
      textStyle: textStyle,
    );
  

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
        child: Text(text,
        style: textStyle,
        ));
  }
}
