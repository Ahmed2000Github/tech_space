import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:tech_space/configurations/app-colors.dart';
import 'package:tech_space/configurations/app-container-radius.dart';
import 'package:tech_space/configurations/app-icons-size.dart';
import 'package:tech_space/configurations/app-paddings.dart';
import 'package:tech_space/configurations/app-spacing.dart';

class SearchMenu extends StatelessWidget {
  const SearchMenu({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    final theme = Theme.of(context);
    return Container(
      width: width,
      height: height,
      alignment: Alignment.center,
      color: Colors.black,
      child: Container(
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
               SizedBox(height: AppSpacing.s40),
              Expanded(
                child: Row(
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
                                Text("MacBook Pro",
                                    style: theme.textTheme.bodyLarge),
                                SizedBox(height: AppPaddings.p32),
                                Text("AirPods Pro",
                                    style: theme.textTheme.bodyLarge),
                                SizedBox(height: AppPaddings.p32),
                                Text("Samsung S9",
                                    style: theme.textTheme.bodyLarge),
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
                                Text("JBL speaker",
                                    style: theme.textTheme.bodyLarge),
                                SizedBox(height: AppPaddings.p32),
                                Text("Canon", style: theme.textTheme.bodyLarge),
                                SizedBox(height: AppPaddings.p32),
                                Text("AirPods Max",
                                    style: theme.textTheme.bodyLarge),
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
                                Text("Headphones",
                                    style: theme.textTheme.bodyLarge),
                                SizedBox(height: AppPaddings.p32),
                                Text("Smartphones",
                                    style: theme.textTheme.bodyLarge),
                                SizedBox(height: AppPaddings.p32),
                                Text("Smartwatch",
                                    style: theme.textTheme.bodyLarge),
                              ],
                            ),
                           
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("Laptops", style: theme.textTheme.bodyLarge),
                                SizedBox(height: AppPaddings.p32),
                                Text("USB Drive",
                                    style: theme.textTheme.bodyLarge),
                                SizedBox(height: AppPaddings.p32),
                                Text("Phone Cases",
                                    style: theme.textTheme.bodyLarge),
                              ],
                            )
                          ],
                        )
                      ],
                    ),
                  ],
                ),
              )
            ],
          )),
    );
  }
}
