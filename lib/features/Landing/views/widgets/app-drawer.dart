import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:tech_space/configurations/app-colors.dart';
import 'package:tech_space/configurations/app-icons-size.dart';
import 'package:tech_space/configurations/app-paddings.dart';
import 'package:tech_space/configurations/app-spacing.dart';
import 'package:tech_space/configurations/app-text-styles-mobile.dart';
import 'package:tech_space/features/Landing/views/widgets/products-menu.dart';

class AppDrawer extends StatelessWidget {
   AppDrawer({Key? key}) : super(key: key);
  bool _isActive = false;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(AppPaddings.p24),
      child: Column(
        children: [
          Row(
            children: [
              Image.asset(
                'assets/images/logo/logo.png',
                width: 47,
                height: 47,
              ),
              const Spacer(),
              SizedBox(
                 width: AppIconsSize.s24,
                height: AppIconsSize.s24,
                child: IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  padding: EdgeInsets.zero,
                  icon: SvgPicture.asset(
                    "assets/images/icons/close-circle.svg",
                    width: AppIconsSize.s24,
                    height: AppIconsSize.s24,
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: AppSpacing.s20),
          Container(
            width: double.infinity,
            padding: EdgeInsets.only(left: AppPaddings.p8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ExpansionTile(
                  tilePadding: EdgeInsets.zero,
                  dense: true,
                   childrenPadding: EdgeInsets.only(bottom: AppPaddings.p16),
                    title: Text(
                  'Products',
                  style: AppTextStylesMobile.bodyLG,
                ),
                children:  ProductMenuCategory.samples.map((category) {
                    return Padding(
                      padding: const EdgeInsets.only(top: AppPaddings.p8),
                      child: StatefulBuilder(builder: (context, setInnerState) {
                        return MouseRegion(
                          cursor: SystemMouseCursors.click,
                          onEnter: (event) {
                            setInnerState(
                              () => _isActive = true,
                            );
                          },
                          onExit: (event) {
                            setInnerState(
                              () => _isActive = false,
                            );
                          },
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: AppPaddings.p12),
                            child: Row(
                              children: [
                                SvgPicture.asset(
                                  category.icon,
                                  width: AppIconsSize.small,
                                  height: AppIconsSize.small,
                                  color: !_isActive ? AppColors.gray50 : AppColors.primary,
                                ),
                                const SizedBox(width: 8),
                                Text(
                                  category.name,
                                  style: AppTextStylesMobile.bodyMD.copyWith(
                                    color: !_isActive ? null : AppColors.primary,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      }),
                    );
                  }).toList(),),
                Text(
                  'Blog',
                  style: AppTextStylesMobile.bodyLG,
                ),
                 SizedBox(height: AppSpacing.s16),
                Text(
                  'FAQ',
                  style: AppTextStylesMobile.bodyLG,
                ),
                 SizedBox(height: AppSpacing.s16),
                Text(
                  'Contact us',
                  style: AppTextStylesMobile.bodyLG,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
