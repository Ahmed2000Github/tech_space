// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:tech_space/configurations/app-colors.dart';
import 'package:tech_space/configurations/app-container-radius.dart';
import 'package:tech_space/configurations/app-icons-size.dart';

import 'package:tech_space/configurations/app-paddings.dart';
import 'package:tech_space/configurations/app-text-styles.dart';
import 'package:tech_space/features/Landing/models/category-model.dart';
import 'package:tech_space/features/Landing/providers/nav-bar-item-hover-provider.dart';
import 'package:tech_space/features/Landing/providers/products_menu_provider.dart';

class ProductsMenu extends ConsumerStatefulWidget {
  ProductsMenu({Key? key}) : super(key: key);

  @override
  ConsumerState<ProductsMenu> createState() => _ProductsMenuState();
}

class _ProductsMenuState extends ConsumerState<ProductsMenu>
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
    _topPositionAnimation = Tween<double>(begin: -450, end: 0).animate(
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
    var _isProductsMenuOpen = ref.watch(productsMenuNotifierProvider);
    return Container(
      height: height,
      color: Colors.black.withOpacity(.5),
      // padding: EdgeInsets.only(bottom: height - 450),
      child: Stack(
        children: [
          AnimatedBuilder(
              animation: _controller,
              builder: (context, child) {
                return Positioned(
                  top: _topPositionAnimation.value,
                  left: AppPaddings.p108,
                  child: MouseRegion(
                    onEnter: (event) {
                      ref.watch(productsMenuNotifierProvider.notifier).toggle();
                      ref.watch(navBarItemHoverNotifier.notifier).toggle(2);
                    },
                    onExit: (event) {
                      ref.watch(productsMenuNotifierProvider.notifier).toggle();
                      ref.watch(navBarItemHoverNotifier.notifier).toggle(0);
                    },
                    child: Container(
                      height: 450,
                      width: width - 2 * AppPaddings.p108,
                      color: Colors.white,
                      child: Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(AppPaddings.p16)
                                .subtract(
                                    const EdgeInsets.only(top: AppPaddings.p8)),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children:
                                  ProductMenuCategory.samples.map((category) {
                                return Padding(
                                  padding: const EdgeInsets.only(
                                      top: AppPaddings.p8),
                                  child: StatefulBuilder(
                                      builder: (context, setInnerState) {
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
                                      child: Row(
                                        children: [
                                          SvgPicture.asset(
                                            category.icon,
                                            width: AppIconsSize.s24,
                                            height: AppIconsSize.s24,
                                            color: !_isActive
                                                ? null
                                                : AppColors.primary,
                                          ),
                                          const SizedBox(width: 8),
                                          Text(
                                            category.name,
                                            style: theme.textTheme.bodyLarge!
                                                .copyWith(
                                              color: !_isActive
                                                  ? null
                                                  : AppColors.primary,
                                            ),
                                          ),
                                        ],
                                      ),
                                    );
                                  }),
                                );
                              }).toList(),
                            ),
                          ),
                          const VerticalDivider(
                            width: 10,
                            color: AppColors.gray9E,
                          ),
                          Padding(
                            padding: const EdgeInsets.all(AppPaddings.p16),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                MouseRegion(
                                  cursor: SystemMouseCursors.click,
                                  child: Row(
                                    children: [
                                      SvgPicture.asset(
                                          "assets/images/icons/Subproducts.svg",
                                          width: AppIconsSize.s24,
                                          height: AppIconsSize.s24),
                                      const SizedBox(width: 8),
                                      Text(
                                        "Smart Phones",
                                        style: theme.textTheme.bodyLarge,
                                      ),
                                    ],
                                  ),
                                ),
                                const SizedBox(height: AppPaddings.p16),
                                MouseRegion(
                                  cursor: SystemMouseCursors.click,
                                  child: Row(
                                    children: [
                                      SvgPicture.asset(
                                          "assets/images/icons/devices.svg",
                                          width: AppIconsSize.s24,
                                          height: AppIconsSize.s24),
                                      const SizedBox(width: 8),
                                      Text("Accessories",
                                          style: AppTextStyles.buttonLG
                                              .copyWith(
                                                  color: AppColors.primary)),
                                    ],
                                  ),
                                ),
                                const SizedBox(height: AppPaddings.p16),
                                MouseRegion(
                                  cursor: SystemMouseCursors.click,
                                  child: Padding(
                                    padding:
                                        const EdgeInsets.all(AppPaddings.p8),
                                    child: Text(
                                      "View all",
                                      style: AppTextStyles.buttonLG
                                          .copyWith(color: AppColors.primary),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Expanded(
                              child: Center(
                            child: Padding(
                              padding: const EdgeInsets.all(AppPaddings.p16),
                              child: SizedBox(
                                height: 156,
                                child: Builder(builder: (context) {
                                  const imageWidth =
                                      (140 - 2 * AppPaddings.p8) - 16;
                                  return ListView(
                                    scrollDirection: Axis.horizontal,
                                    padding: const EdgeInsets.symmetric(
                                        vertical: AppPaddings.p8),
                                    children: CategoryModel.categories2
                                        .map((category) {
                                      return Row(
                                        children: [
                                          Material(
                                            elevation: 5,
                                            borderRadius: BorderRadius.circular(
                                                AppContainerRadius.radius4),
                                            child: Container(
                                              padding: const EdgeInsets.all(
                                                  AppPaddings.p8),
                                              constraints: const BoxConstraints(
                                                  maxWidth: imageWidth +
                                                      AppPaddings.p16),
                                              child: Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Image.asset(
                                                    category.image,
                                                    width: imageWidth,
                                                    height: imageWidth,
                                                  ),
                                                  Text(
                                                    category.name,
                                                    style:
                                                        AppTextStyles.buttonLG,
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                          const SizedBox(
                                              width: AppPaddings.p16),
                                        ],
                                      );
                                    }).toList(),
                                  );
                                }),
                              ),
                            ),
                          ))
                        ],
                      ),
                    ),
                  ),
                );
              }),
        ],
      ),
    );
  }
}

class ProductMenuCategory {
  String name;
  String icon;
  ProductMenuCategory({
    required this.name,
    required this.icon,
  });
  static List<ProductMenuCategory> samples = [
    ProductMenuCategory(
        name: 'Mobile Phones', icon: 'assets/images/icons/mobile.svg'),
    ProductMenuCategory(
        name: 'Laptops & Computers', icon: 'assets/images/icons/monitor.svg'),
    ProductMenuCategory(
        name: 'Tablets & E-reader', icon: 'assets/images/icons/mobile.svg'),
    ProductMenuCategory(
        name: 'Wearables', icon: 'assets/images/icons/watch.svg'),
    ProductMenuCategory(
        name: 'Audio', icon: 'assets/images/icons/headphone.svg'),
    ProductMenuCategory(
        name: 'Cameras', icon: 'assets/images/icons/camera.svg'),
    ProductMenuCategory(name: 'Gaming', icon: 'assets/images/icons/game.svg'),
    ProductMenuCategory(
        name: 'Networking', icon: 'assets/images/icons/data.svg'),
    ProductMenuCategory(
        name: 'Accessories', icon: 'assets/images/icons/devices.svg'),
  ];
}
