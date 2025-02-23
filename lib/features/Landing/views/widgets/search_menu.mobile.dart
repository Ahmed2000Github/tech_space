// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:tech_space/configurations/app-colors.dart';
import 'package:tech_space/configurations/app-container-radius.dart';
import 'package:tech_space/configurations/app-icons-size.dart';
import 'package:tech_space/configurations/app-paddings.dart';
import 'package:tech_space/configurations/app-spacing.dart';
import 'package:tech_space/configurations/app-text-styles.dart';
import 'package:tech_space/core/widgets/link.dart';
import 'package:tech_space/features/Landing/views/widgets/search_menu.dart';

class SearchMenuMobile extends StatelessWidget {
  const SearchMenuMobile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
        width: 800,
        height: 500,
        padding: EdgeInsets.symmetric(
            horizontal: AppPaddings.p48, vertical: AppPaddings.p32),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(AppContainerRadius.radius4),
        ),
        child: Column(
          children: [
            Row(
              children: [
                SizedBox(
                    width: 520,
                    child: TextFormField(
                      decoration: InputDecoration(
                        hintText: "What can we help you to find ?",
                        hintStyle: theme.textTheme.bodySmall!
                            .copyWith(color: AppColors.gray44),
                        enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: AppColors.black,
                            ),
                            borderRadius: const BorderRadius.all(
                                Radius.circular(AppContainerRadius.radius8))),
                        suffixIcon: IconButton(
                          onPressed: () {},
                          icon: SvgPicture.asset(
                            "assets/images/icons/search-normal.svg",
                            width: AppIconsSize.s24,
                            height: AppIconsSize.s24,
                          ),
                        ),
                      ),
                    )),
                Spacer(),
                IconButton(
                  onPressed: () {},
                  icon: SvgPicture.asset(
                    "assets/images/icons/close-circle.svg",
                    width: AppIconsSize.s24,
                    height: AppIconsSize.s24,
                  ),
                ),
              ],
            ),
            SizedBox(height: AppSpacing.s16),
            Expanded(
                child: Row(
              children: [
                Padding(
                  padding: EdgeInsets.only(bottom: AppPaddings.p20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "view 17 out of 30 results",
                        style: theme.textTheme.bodyMedium!
                            .copyWith(color: AppColors.gray50),
                      ),
                      SizedBox(height: AppSpacing.s48),
                      Expanded(
                        child: Row(
                          children: [
                            Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                buildResultItem(context, "X", "Case"),
                                buildResultItem(context, "11", "Case"),
                                buildResultItem(context, "11 Pro", "Case"),
                                buildResultItem(context, "11 Promax", "Case"),
                                buildResultItem(context, "12", "Case"),
                                buildResultItem(context, "12 mini", "Case"),
                                buildResultItem(context, "12 Pro", "Case"),
                                buildResultItem(context, "12 Promax", "Case"),
                                buildResultItem(context, "13 mini", "Case"),
                              ],
                            ),
                            SizedBox(width: 55),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                buildResultItem(context, "13", "Case"),
                                buildResultItem(context, "13 Pro", "Case"),
                                buildResultItem(context, "13 Promax", "Case"),
                                buildResultItem(context, "SE", "Case"),
                                buildResultItem(context, "14", "Case"),
                                buildResultItem(context, "14 Plus", "Case"),
                                buildResultItem(context, "14 Pro", "Case"),
                                buildResultItem(context, "14 Promax", "Case"),
                                Link(
                                  onPressed: () {},
                                  text: "Tap for more",
                                  style: AppTextStyles.buttonLG,
                                )
                              ],
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
                SizedBox(width: 27),
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.only(top: AppPaddings.p16),
                    child: GridView.count(
                      crossAxisCount: 3,
                      mainAxisSpacing: AppSpacing.s12,
                      crossAxisSpacing: AppSpacing.s12,
                      childAspectRatio: 11.5 / 16,
                      children: SearchShowItem.samples.map((item) {
                        return Card(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(
                                AppContainerRadius.radius4),
                          ),
                          child: Padding(
                            padding: EdgeInsets.all(AppPaddings.p8),
                            child: Column(
                              children: [
                                Image.asset(item.imageUrl),
                                Center(
                                    child: Text(
                                  item.title,
                                  style: AppTextStyles.captionMD
                                      .copyWith(fontWeight: FontWeight.normal),
                                )),
                              ],
                            ),
                          ),
                        );
                      }).toList(),
                    ),
                  ),
                )
              ],
            ))
          ],
        ));
  }

  buildResultItem(BuildContext context, String text1, String text2) {
    final theme = Theme.of(context);
    var isHover = false;
    return StatefulBuilder(builder: (context, setInnerState) {
      return MouseRegion(
        cursor: SystemMouseCursors.click,
        onEnter: (event) => setInnerState(
          () => isHover = true,
        ),
        onExit: (event) => setInnerState(
          () => isHover = false,
        ),
        child: RichText(
            text: TextSpan(
                text: text1,
                style: theme.textTheme.bodyLarge!.copyWith(
                    color: isHover ? theme.primaryColor : AppColors.black),
                children: [
              TextSpan(
                  text: text2,
                  style: theme.textTheme.bodyLarge!.copyWith(
                      color: isHover ? theme.primaryColor : AppColors.gray71))
            ])),
      );
    });
  }

  getRecent(BuildContext context) {
    final theme = Theme.of(context);
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "The Most Searched Items",
              style: theme.textTheme.titleMedium,
            ),
            SizedBox(height: AppSpacing.s40),
            Row(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("MacBook Pro", style: theme.textTheme.bodyLarge),
                    SizedBox(height: AppPaddings.p32),
                    Text("AirPods Pro", style: theme.textTheme.bodyLarge),
                    SizedBox(height: AppPaddings.p32),
                    Text("Samsung S9", style: theme.textTheme.bodyLarge),
                    SizedBox(height: AppPaddings.p32),
                    Text("Tablet", style: theme.textTheme.bodyLarge),
                    SizedBox(height: AppPaddings.p32),
                    Text("Xiaomi", style: theme.textTheme.bodyLarge),
                  ],
                ),
                SizedBox(width: AppSpacing.s32),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("JBL speaker", style: theme.textTheme.bodyLarge),
                    SizedBox(height: AppPaddings.p32),
                    Text("Canon", style: theme.textTheme.bodyLarge),
                    SizedBox(height: AppPaddings.p32),
                    Text("AirPods Max", style: theme.textTheme.bodyLarge),
                    SizedBox(height: AppPaddings.p32),
                    Text("Asus", style: theme.textTheme.bodyLarge),
                    SizedBox(height: AppPaddings.p32),
                    Text("MagSafe", style: theme.textTheme.bodyLarge),
                  ],
                )
              ],
            )
          ],
        ),
        SizedBox(width: AppSpacing.s40),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Most used keywords",
              style: theme.textTheme.titleMedium,
            ),
            SizedBox(height: AppSpacing.s40),
            Row(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Tablets", style: theme.textTheme.bodyLarge),
                    SizedBox(height: AppPaddings.p32),
                    Text("Headphones", style: theme.textTheme.bodyLarge),
                    SizedBox(height: AppPaddings.p32),
                    Text("Smartphones", style: theme.textTheme.bodyLarge),
                    SizedBox(height: AppPaddings.p32),
                    Text("Smartwatch", style: theme.textTheme.bodyLarge),
                  ],
                ),
                SizedBox(width: AppSpacing.s32),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Laptops", style: theme.textTheme.bodyLarge),
                    SizedBox(height: AppPaddings.p32),
                    Text("USB Drive", style: theme.textTheme.bodyLarge),
                    SizedBox(height: AppPaddings.p32),
                    Text("Phone Cases", style: theme.textTheme.bodyLarge),
                  ],
                )
              ],
            )
          ],
        ),
      ],
    );
  }
}
