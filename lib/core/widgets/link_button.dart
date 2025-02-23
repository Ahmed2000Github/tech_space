import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:tech_space/configurations/app-colors.dart';
import 'package:tech_space/configurations/app-icons-size.dart';
import 'package:tech_space/configurations/app-text-styles-mobile.dart';
import 'package:tech_space/configurations/app-text-styles.dart';
import 'package:tech_space/core/helpers/responsive-helper.dart';

class LinkButton extends StatefulWidget {
  final void Function() onPressed;
  final String text;
  Color? textColor;

  LinkButton(
      {required this.onPressed, required this.text, this.textColor, super.key});

  @override
  State<LinkButton> createState() => _LinkButtonState();
}

class _LinkButtonState extends State<LinkButton> {
  bool isHovered = false;
  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => isHovered = true),
      onExit: (_) => setState(() => isHovered = false),
      child: TextButton(
        onPressed: widget.onPressed,
        style: TextButton.styleFrom(
          overlayColor: Colors.transparent,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              widget.text,
              style: (ResponsiveHelper.isMobile(context)
                      ? AppTextStylesMobile.h4
                      : AppTextStyles.buttonLG)
                  .copyWith(
                fontWeight: FontWeight.normal,
                color: isHovered
                    ? AppColors.secondary
                    : widget.textColor ??
                        AppColors.black, // Change color on hover
              ),
            ),
            SvgPicture.asset(
              'assets/images/icons/arrow-circle-right.svg',
              width: AppIconsSize.s24,
              height: AppIconsSize.s24,
              colorFilter: ColorFilter.mode(
                isHovered
                    ? AppColors.secondary
                    : widget.textColor ??
                        AppColors.black, // Change color on hover
                BlendMode.srcIn,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
