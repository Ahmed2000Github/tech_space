import 'package:flutter/material.dart';
import 'package:tech_space/configurations/app-colors.dart';
import 'package:tech_space/configurations/app-paddings.dart';

class CustomIconButton extends StatelessWidget {
  final Widget icon;
  final void Function() onPress;

  const CustomIconButton(
      {super.key, required this.icon, required this.onPress});

  @override 
  Widget build(BuildContext context) {
    return SizedBox(
      height: 40,
      width: 40,
      child: FloatingActionButton(
        onPressed: onPress,
        elevation: 1,
        backgroundColor: AppColors.primary50,
        shape: CircleBorder(),
        child: icon,
      ),
    );
  }
}
