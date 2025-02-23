import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'package:tech_space/configurations/app-colors.dart';
import 'package:tech_space/configurations/app-container-radius.dart';
import 'package:tech_space/configurations/app-icons-size.dart';
import 'package:tech_space/configurations/app-paddings.dart';
import 'package:tech_space/configurations/app-spacing.dart';
import 'package:tech_space/configurations/app-text-styles.dart';
import 'package:tech_space/core/widgets/link.dart';

class AuthResult extends StatelessWidget {
  final String title;
  final String description;
  final String icon;
  final Color color;

  AuthResult(
      {Key? key,
      required this.title,
      required this.description,
      required this.icon,
      required this.color})
      : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Container(
        width: 400,
        height: 300,
        padding: const EdgeInsets.symmetric(
            horizontal: AppPaddings.p48, vertical: AppPaddings.p32),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(AppContainerRadius.radius4),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              width: 120,
              height: 120,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 2,
                    blurRadius: 10,
                    offset: Offset(0, 0), // changes position of shadow
                  ),
                ],
                color: Colors.white,
              ),
              child: Center(
                child: SvgPicture.asset(
                  'assets/images/icons/$icon.svg',
                  width: AppIconsSize.large,
                  height: AppIconsSize.large,
                ),
              ),
            ),
            const SizedBox(height: AppSpacing.s16),
            Padding(
              padding: EdgeInsets.only(bottom: AppPaddings.p16),
              child: Text(
                title,
                style: AppTextStyles.h4.copyWith(color: color),
              ),
            ),
            Text(
              description,
              maxLines: 2,
              style:
                  AppTextStyles.buttonLG.copyWith(color: AppColors.gray50),
              textAlign: TextAlign.center,
            ),
          ],
        ));
  }
}
