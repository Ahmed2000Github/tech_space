import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:tech_space/configurations/app-colors.dart';
import 'package:tech_space/configurations/app-icons-size.dart';
import 'package:tech_space/configurations/app-paddings.dart';
import 'package:tech_space/configurations/app-utils.dart';
import 'package:tech_space/features/Landing/providers/account_menu_notifier.dart';
import 'package:tech_space/features/Landing/providers/cart_notifier.dart';
import 'package:tech_space/features/Landing/providers/nav-bar-item-hover-provider.dart';
import 'package:tech_space/features/Landing/providers/products_menu_provider.dart';

class Hearder extends ConsumerStatefulWidget implements PreferredSizeWidget {
  Hearder({Key? key}) : super(key: key);

  @override
  ConsumerState<Hearder> createState() => _HearderState();

  @override
  Size get preferredSize => const Size.fromHeight(80.0);
}

class _HearderState extends ConsumerState<Hearder> {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      height: 80,
      decoration: BoxDecoration(
          color: AppColors.white,
          border:
              Border(bottom: BorderSide(color: theme.primaryColor, width: 1))),
      padding: const EdgeInsets.symmetric(horizontal: AppPaddings.p108),
      child: Row(
        children: [
          Image.asset(
            'assets/images/logo/logo.png',
            // width: 100,
            // height: 100,
          ),
          const Spacer(),
          generatMenuItem(1, "Home", () {}),
          const SizedBox(width: AppPaddings.p48),
          generatMenuItem(2, "Products", () {
            ref.read(productsMenuNotifierProvider.notifier).toggle();
            ref.read(accountMenuNotifierProvider.notifier).close();
            ref.read(cartNotifierProvider.notifier).close();
          }),
          const SizedBox(width: AppPaddings.p48),
          generatMenuItem(3, "Blog", () {}),
          const SizedBox(width: AppPaddings.p48),
          generatMenuItem(4, "FAQ", () {}),
          const SizedBox(width: AppPaddings.p48),
          generatMenuItem(5, "Contact Us", () {}),
          const Spacer(),
          IconButton(
              onPressed: () {},
              icon: SvgPicture.asset(
                'assets/images/icons/search.svg',
                width: AppIconsSize.large,
                height: AppIconsSize.large,
              )),
          IconButton(
              onPressed: () {
                ref.read(cartNotifierProvider.notifier).toggle();
                 ref.read(accountMenuNotifierProvider.notifier).close();
              },

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
                    height: AppIconsSize.s20,
                    width: AppIconsSize.s20,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(color: AppColors.primary,borderRadius:BorderRadius.circular(AppIconsSize.s20,)),
                    child: Text("3",
                        style: theme.textTheme.bodyMedium!.copyWith(
                          color: Colors.white,
                        )),
                  ))
                ],
              )),
          IconButton(
              onPressed: () {
                ref.read(accountMenuNotifierProvider.notifier).toggle();
                ref.read(cartNotifierProvider.notifier).close();
              },
              icon: SvgPicture.asset(
                'assets/images/icons/profile.svg',
                width: AppIconsSize.large,
                height: AppIconsSize.large,
              )),
        ],
      ),
    );
  }

  generatMenuItem(int index, String title, void Function() action) {
    final _isActive = index == ref.watch(navBarItemHoverNotifier);
    final theme = Theme.of(context);
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      onEnter: (event) {
        action();
        ref.watch(navBarItemHoverNotifier.notifier).toggle(index);
      },
      onExit: (event) {
        action();
        ref.watch(navBarItemHoverNotifier.notifier).toggle(0);
      },
      child: SizedBox(
        width:
            AppUtils.getTextWidth(title, theme.textTheme.bodyLarge!, context),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              title,
              style: theme.textTheme.bodyLarge!
                  .copyWith(color: !_isActive ? null : AppColors.primary),
            ),
            const SizedBox(height: AppPaddings.p8),
            if (_isActive)
              Container(
                height: 1.0,
                // width: (10 * title.length).toDouble(),
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      Colors.transparent,
                      AppColors.primary,
                      AppColors.primary,
                      AppColors.primary,
                      Colors.transparent,
                    ], // Gradient colors
                    begin: Alignment.centerLeft, // Start of gradient
                    end: Alignment.centerRight, // End of gradient
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
