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
import 'package:tech_space/core/widgets/link.dart';
import 'package:tech_space/features/Landing/providers/search_notifier.dart';
import 'package:tech_space/features/Landing/views/widgets/search_menu.dart';

class SearchMenuMobile extends ConsumerStatefulWidget {
  SearchMenuMobile({Key? key}) : super(key: key);

  @override
  ConsumerState<SearchMenuMobile> createState() => _SearchMenuMobileState();
}

class _SearchMenuMobileState extends ConsumerState<SearchMenuMobile>
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
                    padding: EdgeInsets.only(top: AppPaddings.p24),
                    color: Colors.white,
                    child: getSearchedItems(context)),
              );
            }),
      ],
    );
  }

  getRecent(BuildContext context) {
    final theme = Theme.of(context);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: AppPaddings.p24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "The Most Searched Items",
                style: AppTextStylesMobile.caption,
              ),
              SizedBox(height: AppSpacing.s16),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: AppPaddings.p12),
                child: Row(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("MacBook Pro", style: AppTextStylesMobile.bodySM),
                        SizedBox(height: AppPaddings.p12),
                        Text("AirPods Pro", style: AppTextStylesMobile.bodySM),
                        SizedBox(height: AppPaddings.p12),
                        Text("Samsung S9", style: AppTextStylesMobile.bodySM),
                        SizedBox(height: AppPaddings.p12),
                        Text("Tablet", style: AppTextStylesMobile.bodySM),
                        SizedBox(height: AppPaddings.p12),
                        Text("Xiaomi", style: AppTextStylesMobile.bodySM),
                      ],
                    ),
                    SizedBox(width: AppSpacing.s32),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("JBL speaker", style: AppTextStylesMobile.bodySM),
                        SizedBox(height: AppPaddings.p12),
                        Text("Canon", style: AppTextStylesMobile.bodySM),
                        SizedBox(height: AppPaddings.p12),
                        Text("AirPods Max", style: AppTextStylesMobile.bodySM),
                        SizedBox(height: AppPaddings.p12),
                        Text("Asus", style: AppTextStylesMobile.bodySM),
                        SizedBox(height: AppPaddings.p12),
                        Text("MagSafe", style: AppTextStylesMobile.bodySM),
                      ],
                    )
                  ],
                ),
              )
            ],
          ),
          SizedBox(height: AppSpacing.s24),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Most used keywords",
                style: AppTextStylesMobile.caption,
              ),
              SizedBox(height: AppSpacing.s16),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: AppPaddings.p12),
                child: Row(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Tablets", style: AppTextStylesMobile.bodySM),
                        SizedBox(height: AppPaddings.p12),
                        Text("Headphones", style: AppTextStylesMobile.bodySM),
                        SizedBox(height: AppPaddings.p12),
                        Text("Smartphones", style: AppTextStylesMobile.bodySM),
                        SizedBox(height: AppPaddings.p12),
                        Text("Smartwatch", style: AppTextStylesMobile.bodySM),
                      ],
                    ),
                    SizedBox(width: AppSpacing.s32),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Laptops", style: AppTextStylesMobile.bodySM),
                        SizedBox(height: AppPaddings.p12),
                        Text("USB Drive", style: AppTextStylesMobile.bodySM),
                        SizedBox(height: AppPaddings.p12),
                        Text("Phone Cases", style: AppTextStylesMobile.bodySM),
                      ],
                    )
                  ],
                ),
              )
            ],
          ),
        ],
      ),
    );
  }

  getSearchedItems(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: AppPaddings.p24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: AppSpacing.s32),
              Row(
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      buildResultItem(context, "X", "Case"),
                      SizedBox(height: AppSpacing.s20),
                      buildResultItem(context, "11", "Case"),
                      SizedBox(height: AppSpacing.s20),
                      buildResultItem(context, "11 Pro", "Case"),
                      SizedBox(height: AppSpacing.s20),
                      buildResultItem(context, "11 Promax", "Case"),
                      SizedBox(height: AppSpacing.s20),
                      buildResultItem(context, "12", "Case"),
                      SizedBox(height: AppSpacing.s20),
                      buildResultItem(context, "12 mini", "Case"),
                      SizedBox(height: AppSpacing.s20),
                      buildResultItem(context, "12 Pro", "Case"),
                      SizedBox(height: AppSpacing.s20),
                      buildResultItem(context, "12 Promax", "Case"),
                      SizedBox(height: AppSpacing.s20),
                      buildResultItem(context, "13 mini", "Case"),
                    ],
                  ),
                  SizedBox(width: 55),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      buildResultItem(context, "13", "Case"),
                      SizedBox(height: AppSpacing.s20),
                      buildResultItem(context, "13 Pro", "Case"),
                      SizedBox(height: AppSpacing.s20),
                      buildResultItem(context, "13 Promax", "Case"),
                      SizedBox(height: AppSpacing.s20),
                      buildResultItem(context, "SE", "Case"),
                      SizedBox(height: AppSpacing.s20),
                      buildResultItem(context, "14", "Case"),
                      SizedBox(height: AppSpacing.s20),
                      buildResultItem(context, "14 Plus", "Case"),
                      SizedBox(height: AppSpacing.s20),
                      buildResultItem(context, "14 Pro", "Case"),
                      SizedBox(height: AppSpacing.s20),
                      buildResultItem(context, "14 Promax", "Case"),
                      SizedBox(height: AppSpacing.s20),
                      Link(
                        onPressed: () {},
                        text: "Tap for more",
                        style: AppTextStylesMobile.buttonLG,
                      )
                    ],
                  )
                ],
              )
            ],
          ),
        ),
        SizedBox(width: 27),
        SizedBox(
          height: 150,
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: AppPaddings.p16, horizontal: AppPaddings.p24),
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: SearchShowItem.samples.map((item) {
                  return Card(
                    shape: RoundedRectangleBorder(
                      borderRadius:
                          BorderRadius.circular(AppContainerRadius.radius4),
                    ),
                    child: Padding(
                      padding: EdgeInsets.all(AppPaddings.p8),
                      child: Column(
                        children: [
                          Flexible(child: Image.asset(item.imageUrl)),
                          Center(
                              child: Text(
                            item.title,
                            style: AppTextStylesMobile.caption
                                .copyWith(fontWeight: FontWeight.normal),
                          )),
                        ],
                      ),
                    ),
                  );
                }).toList(),
            )
          ),
        )
      ],
    );
  }

  buildResultItem(BuildContext context, String text1, String text2) {
    final theme = Theme.of(context);
    var isHover = false;
    return StatefulBuilder(builder: (context, setInnerState) {
      return RichText(
          text: TextSpan(
              text: text1,
              style:
                  AppTextStylesMobile.buttonLG.copyWith(color: AppColors.black),
              children: [
            TextSpan(
                text: text2,
                style: AppTextStylesMobile.buttonLG
                    .copyWith(color: AppColors.gray71))
          ]));
    });
  }
}
