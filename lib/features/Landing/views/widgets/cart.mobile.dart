// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:tech_space/configurations/app-colors.dart';
import 'package:tech_space/configurations/app-container-radius.dart';
import 'package:tech_space/configurations/app-icons-size.dart';

import 'package:tech_space/configurations/app-paddings.dart';
import 'package:tech_space/configurations/app-spacing.dart';
import 'package:tech_space/configurations/app-text-styles-mobile.dart';
import 'package:tech_space/configurations/app-text-styles.dart';
import 'package:tech_space/features/Landing/models/cart_item_model.dart';
import 'package:tech_space/features/Landing/providers/account_menu_notifier.dart';
import 'package:tech_space/features/Landing/providers/cart_notifier.dart';

class CartMobile extends ConsumerStatefulWidget {
  CartMobile({Key? key}) : super(key: key);

  @override
  ConsumerState<CartMobile> createState() => _CartMobileState();
}

class _CartMobileState extends ConsumerState<CartMobile>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _topPositionAnimation;
  bool _isActive = false;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1000),
    );
    _topPositionAnimation = Tween<double>(begin: -50, end: 0).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeInOut),
    );
    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    final theme = Theme.of(context);
    return Stack(
      children: [
        AnimatedBuilder(
            animation: _controller,
            builder: (context, child) {
              return Positioned(
                top: _topPositionAnimation.value,
                child: Container(
                  height: height - 100,
                  width: width,
                  padding: EdgeInsets.only(top: AppPaddings.p16),
                  color: Colors.white,
                  child: Column(
                    children: [
                      Container(
                        padding:
                            EdgeInsets.symmetric(horizontal: AppPaddings.p24),
                        alignment: Alignment.centerLeft,
                        child: Row(
                          children: [
                            Text(
                              "${CartItemModel.sampleItems.length} items",
                              style: AppTextStylesMobile.h3,
                            ),
                            Spacer(),
                            IconButton(
                              onPressed: () {
                                ref
                                    .read(cartNotifierProvider.notifier)
                                    .toggle();
                              },
                              padding: EdgeInsets.zero,
                              icon: SvgPicture.asset(
                                "assets/images/icons/close-circle.svg",
                                width: AppIconsSize.s24,
                                height: AppIconsSize.s24,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Expanded(
                          child: ListView(
                        padding: EdgeInsets.only(top: AppPaddings.p4),
                        children: CartItemModel.sampleItems.map((item) {
                          return Card(
                            elevation: 1,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(
                                  AppContainerRadius.radius4),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(AppPaddings.p12),
                              child: Row(
                                children: [
                                  Flexible(child: Image.asset(item.imageUrl)),
                                  Flexible(
                                    flex: 2,
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          item.name,
                                          maxLines: 3,
                                          style: AppTextStylesMobile.h4,
                                        ),
                                        SizedBox(height: AppSpacing.s4),
                                        Text(
                                          item.color,
                                          style: AppTextStylesMobile.bodySM
                                              .copyWith(
                                                  color: AppColors.gray71),
                                        ),
                                        SizedBox(height: AppSpacing.s4),
                                        Text(
                                          "x${item.samples}",
                                          style: AppTextStylesMobile.bodySM
                                              .copyWith(
                                                  color: AppColors.gray71),
                                        ),
                                        SizedBox(height: AppPaddings.p8),
                                        Row(
                                          children: [
                                            SvgPicture.asset(
                                              "assets/images/icons/truck.svg",
                                              width: AppIconsSize.small,
                                              height: AppIconsSize.small,
                                            ),
                                            SizedBox(width: AppPaddings.p4),
                                            Text(
                                              "Free Delivery",
                                              style: AppTextStylesMobile
                                                  .buttonSM
                                                  .copyWith(
                                                      color: AppColors.gray71),
                                            ),
                                          ],
                                        ),
                                        SizedBox(height: AppPaddings.p4),
                                        Row(
                                          children: [
                                            SvgPicture.asset(
                                              "assets/images/icons/verify.svg",
                                              width: AppIconsSize.small,
                                              height: AppIconsSize.small,
                                            ),
                                            SizedBox(width: AppPaddings.p4),
                                            Text(
                                              "Guaranteed",
                                              style: AppTextStylesMobile
                                                  .buttonSM
                                                  .copyWith(
                                                      color: AppColors.gray71),
                                            ),
                                          ],
                                        ),
                                        SizedBox(height: AppPaddings.p4),
                                        Row(
                                          children: [
                                            Text(
                                              item.price,
                                              style: AppTextStylesMobile.bodySM
                                                  .copyWith(
                                                      color: AppColors.gray2D),
                                            ),
                                            Spacer(),
                                            SizedBox(
                                              width: AppIconsSize.s24,
                                              height: AppIconsSize.s24,
                                              child: IconButton(
                                                onPressed: () {},
                                                padding: EdgeInsets.all(
                                                    AppPaddings.p4),
                                                icon: SvgPicture.asset(
                                                  "assets/images/icons/trash.svg",
                                                  width: AppIconsSize.small,
                                                  height: AppIconsSize.small,
                                                ),
                                              ),
                                            ),
                                            SizedBox(width: AppPaddings.p4),
                                            Container(
                                              decoration: BoxDecoration(
                                                  border: Border(
                                                      bottom: BorderSide(
                                                          color: AppColors
                                                              .gray71))),
                                              child: Row(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.center,
                                                children: [
                                                  SizedBox(
                                                    width: AppIconsSize.small,
                                                    height: AppIconsSize.small,
                                                    child: IconButton(
                                                      onPressed: () {},
                                                      padding:
                                                          EdgeInsets.all(0),
                                                      icon: Text(
                                                        "-",
                                                        style: theme.textTheme
                                                            .bodyMedium!
                                                            .copyWith(
                                                                color: AppColors
                                                                    .gray71),
                                                      ),
                                                    ),
                                                  ),
                                                  SizedBox(
                                                      width: AppPaddings.p4),
                                                  Text(
                                                    "${item.samples}",
                                                    style: theme
                                                        .textTheme.labelMedium!
                                                        .copyWith(
                                                            color: AppColors
                                                                .gray71),
                                                  ),
                                                  SizedBox(
                                                      width: AppPaddings.p4),
                                                  SizedBox(
                                                    width: AppIconsSize.small,
                                                    height: AppIconsSize.small,
                                                    child: IconButton(
                                                      onPressed: () {},
                                                      padding:
                                                          EdgeInsets.all(0),
                                                      icon: Text(
                                                        "+",
                                                        style: theme.textTheme
                                                            .bodyMedium!
                                                            .copyWith(
                                                                color: AppColors
                                                                    .gray71),
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            ),
                          );
                        }).toList(),
                      )),
                      Container(
                        color: AppColors.grayF6,
                        padding: EdgeInsets.symmetric(
                            vertical: AppPaddings.p8,
                            horizontal: AppPaddings.p24),
                        child: Row(
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Grand total",
                                  style: AppTextStylesMobile.bodySM
                                      .copyWith(color: AppColors.gray2D),
                                ),
                                SizedBox(height: 3),
                                Text(
                                  "\$543.02",
                                  style: AppTextStylesMobile.h4
                                      .copyWith(color: AppColors.gray2D),
                                ),
                              ],
                            ),
                            SizedBox(width: AppPaddings.p32),
                            Expanded(
                              child: MouseRegion(
                                cursor: SystemMouseCursors.click,
                                child: Container(
                                  height: 44,
                                  alignment: Alignment.center,
                                  decoration: BoxDecoration(
                                    color: AppColors.primary,
                                    borderRadius: BorderRadius.circular(
                                        AppContainerRadius.radius4),
                                  ),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        "Proceed to Cart",
                                        style: AppTextStylesMobile.buttonLG
                                            .copyWith(color: AppColors.white),
                                      ),
                                      SvgPicture.asset(
                                        "assets/images/icons/shopping-cart.svg",
                                        width: AppIconsSize.s24,
                                        height: AppIconsSize.s24,
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              );
            }),
      ],
    );
  }
}
