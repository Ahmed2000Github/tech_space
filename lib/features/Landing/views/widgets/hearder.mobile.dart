import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:tech_space/configurations/app-colors.dart';
import 'package:tech_space/configurations/app-container-radius.dart';
import 'package:tech_space/configurations/app-icons-size.dart';
import 'package:tech_space/configurations/app-paddings.dart';
import 'package:tech_space/configurations/app-spacing.dart';
import 'package:tech_space/configurations/app-text-styles-mobile.dart';
import 'package:tech_space/features/Landing/providers/account_menu_notifier.dart';
import 'package:tech_space/features/Landing/providers/cart_notifier.dart';
import 'package:tech_space/features/Landing/providers/search_notifier.dart';
import 'package:tech_space/features/Landing/views/widgets/authentication.dart';
import 'package:tech_space/routes/app_routes.dart';

class HearderMobile extends ConsumerStatefulWidget
    implements PreferredSizeWidget {
  GlobalKey<ScaffoldState> scaffoldKey;
  HearderMobile({super.key, required this.scaffoldKey});

  @override
  ConsumerState<HearderMobile> createState() => _HearderState();

  @override
  Size get preferredSize => const Size.fromHeight(100.0);
}

class _HearderState extends ConsumerState<HearderMobile> {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      height: 100,
      decoration: BoxDecoration(
        color: AppColors.white,
        // border:
        //     Border(bottom: BorderSide(color: theme.primaryColor, width: 1))
      ),
      padding: const EdgeInsets.symmetric(
          horizontal: AppPaddings.p24, vertical: AppPaddings.p8),
      child: Column(
        children: [
          Row(
            children: [
              SizedBox(
                width: 32,
                height: 32,
                child: IconButton(
                  padding: EdgeInsets.all(0),
                  onPressed: () {
                    widget.scaffoldKey.currentState?.openDrawer();
                  },
                  icon: SvgPicture.asset(
                    'assets/images/icons/menu.svg',
                    width: AppIconsSize.s24,
                    height: AppIconsSize.s24,
                  ),
                ),
              ),
              const Spacer(),
              Text(
                'Tech Heim',
                style: AppTextStylesMobile.h3.copyWith(
                  color: AppColors.primary400,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const Spacer(),
              TextButton(
                onPressed: () => Get.toNamed(AppRoutes.AuthMobile),
                child: Row(
                  children: [
                    SvgPicture.asset(
                      'assets/images/icons/login.svg',
                      width: AppIconsSize.s24,
                      height: AppIconsSize.s24,
                    ),
                    SizedBox(width: AppSpacing.s8),
                    Text(
                      'login',
                      style: AppTextStylesMobile.buttonLG.copyWith(
                        color: AppColors.primary,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
              if (false)
                SizedBox(
                  width: 32,
                  height: 32,
                  child: IconButton(
                      onPressed: () {
                        ref.read(cartNotifierProvider.notifier).toggle();
                        ref.read(accountMenuNotifierProvider.notifier).close();
                      },
                      padding: EdgeInsets.all(0),
                      icon: Stack(
                        children: [
                          SvgPicture.asset(
                            'assets/images/icons/basket.svg',
                            width: AppIconsSize.large,
                            height: AppIconsSize.large,
                          ),
                          Positioned(
                              bottom: 0,
                              right: 0,
                              child: Container(
                                height: AppIconsSize.small,
                                width: AppIconsSize.small,
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                    color: AppColors.primary,
                                    borderRadius: BorderRadius.circular(
                                      AppIconsSize.s20,
                                    )),
                                child: Text("3",
                                    style: AppTextStylesMobile.bodyMD.copyWith(
                                      color: Colors.white,
                                    )),
                              ))
                        ],
                      )),
                ),
              if (false)
                SizedBox(
                  width: 32,
                  height: 32,
                  child: IconButton(
                      padding: EdgeInsets.all(0),
                      onPressed: () {
                        ref.read(accountMenuNotifierProvider.notifier).toggle();
                        ref.read(cartNotifierProvider.notifier).close();
                      },
                      icon: SvgPicture.asset(
                        'assets/images/icons/profile.svg',
                        width: AppIconsSize.large,
                        height: AppIconsSize.large,
                      )),
                ),
            ],
          ),
          SizedBox(height: AppSpacing.s12),
          SizedBox(
              // width: 520,
              height: AppSpacing.s40,
              child: Row(
                children: [
                  SizedBox(
                    width: 32,
                    height: 32,
                    child: IconButton(
                        onPressed: () {
                          ref.read(cartNotifierProvider.notifier).toggle();
                          ref
                              .read(accountMenuNotifierProvider.notifier)
                              .close();
                        },
                        padding: EdgeInsets.all(0),
                        icon: Stack(
                          children: [
                            SvgPicture.asset(
                              'assets/images/icons/basket.svg',
                              width: AppIconsSize.large,
                              height: AppIconsSize.large,
                            ),
                            if (false)
                              Positioned(
                                  bottom: 0,
                                  right: 0,
                                  child: Container(
                                    height: AppIconsSize.small,
                                    width: AppIconsSize.small,
                                    alignment: Alignment.center,
                                    decoration: BoxDecoration(
                                        color: AppColors.primary,
                                        borderRadius: BorderRadius.circular(
                                          AppIconsSize.s20,
                                        )),
                                    child: Text("3",
                                        style:
                                            AppTextStylesMobile.bodyMD.copyWith(
                                          color: Colors.white,
                                        )),
                                  ))
                          ],
                        )),
                  ),
                  Expanded(child: TextFormFieldWithFocusEvent()),
                ],
              )),
        ],
      ),
    );
  }

  void showAuthResultDialog(BuildContext context, Widget widget) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(AppContainerRadius.radius8),
            ),
            child: widget);
      },
    );
  }
}

class TextFormFieldWithFocusEvent extends ConsumerStatefulWidget {
  @override
  _TextFormFieldWithFocusEventState createState() =>
      _TextFormFieldWithFocusEventState();
}

class _TextFormFieldWithFocusEventState
    extends ConsumerState<TextFormFieldWithFocusEvent> {
  final FocusNode _focusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    _focusNode.addListener(_onFocusChange);
  }

  void _onFocusChange() {
    if (_focusNode.hasFocus) {
      // ref.read(searchNotifierProvider.notifier).toggle();
    } else {
      // ref.read(searchNotifierProvider.notifier).toggle();
    }
  }

  @override
  void dispose() {
    _focusNode.removeListener(_onFocusChange);
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return TextFormField(
      focusNode: _focusNode,
      decoration: InputDecoration(
        hintText: "What can we help you to find ?",
        fillColor: AppColors.grayED,
        filled: true,
        hintStyle: theme.textTheme.bodySmall!.copyWith(color: AppColors.gray44),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(AppContainerRadius.radius8),
          borderSide: BorderSide.none,
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(AppContainerRadius.radius8),
          borderSide: BorderSide.none,
        ),
        suffixIcon: IconButton(
          onPressed: () {
            ref.read(searchNotifierProvider.notifier).toggle();
          },
          icon: SvgPicture.asset(
            "assets/images/icons/${ref.watch(searchNotifierProvider) ? "close-circle" : "search-normal"}.svg",
            color: AppColors.gray71,
            width: AppIconsSize.s24,
            height: AppIconsSize.s24,
          ),
        ),
      ),
    );
  }
}
