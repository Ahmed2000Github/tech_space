import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:tech_space/configurations/app-colors.dart';
import 'package:tech_space/configurations/app-container-radius.dart';
import 'package:tech_space/configurations/app-icons-size.dart';
import 'package:tech_space/configurations/app-paddings.dart';
import 'package:tech_space/configurations/app-text-styles.dart';
import 'package:tech_space/features/Landing/models/brand_model.dart';
import 'package:tech_space/features/Landing/models/category-model.dart';
import 'package:tech_space/features/Landing/models/product_model.dart';
import 'package:tech_space/features/Landing/models/product_on_sale.dart';
import 'package:tech_space/features/Landing/providers/account_menu_notifier.dart';
import 'package:tech_space/features/Landing/providers/cart_notifier.dart';
import 'package:tech_space/features/Landing/providers/products_menu_provider.dart';
import 'package:tech_space/features/Landing/views/widgets/account-menu.dart';
import 'package:tech_space/features/Landing/views/widgets/cart.dart';
import 'package:tech_space/features/Landing/views/widgets/custom_icon_button.dart';
import 'package:tech_space/features/Landing/views/widgets/footer.dart';
import 'package:tech_space/features/Landing/views/widgets/hearder.dart';
import 'package:tech_space/core/widgets/link_button.dart';
import 'package:tech_space/features/Landing/views/widgets/app-button.dart';
import 'package:tech_space/features/Landing/views/widgets/products-menu.dart';
import 'package:tech_space/features/Landing/views/widgets/rounded_shape_painter.dart';
import 'package:tech_space/features/Landing/views/widgets/search_menu.dart';

class LandingHomePageDesktop extends ConsumerWidget {
  LandingHomePageDesktop({Key? key}) : super(key: key);
  bool _isHovered = false;
  bool _isProductsMenuOpen = false;

  @override
  Widget build(BuildContext context,WidgetRef ref ) {
    final theme = Theme.of(context);
    final width = MediaQuery.of(context).size.width;
    _isProductsMenuOpen = ref.watch(productsMenuNotifierProvider);
    return Scaffold(
        appBar: Hearder(),
        body: Stack(
          children: [
            SingleChildScrollView(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: AppPaddings.p108),
                    child: Column(
                      children: [
                        AspectRatio(
                          aspectRatio: 16 / 7,
                          child: Row(
                            children: [
                              SizedBox(
                                height: 448,
                                child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Tech Heim",
                                      style: theme.textTheme.displayLarge,
                                    ),
                                    RichText(
                                      text: TextSpan(
                                        text: 'Join the',
                                        style: theme.textTheme.headlineSmall,
                                        children: <TextSpan>[
                                          TextSpan(
                                              text: 'digital revolution',
                                              style: theme
                                                  .textTheme.headlineSmall!
                                                  .copyWith(
                                                      color: theme.colorScheme
                                                          .secondary)),
                                          const TextSpan(text: '"'),
                                        ],
                                      ),
                                    ),
                                    AppButton.secondary(
                                      onPressed: () {},
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: AppPaddings.p108,
                                          vertical: AppPaddings.p20),
                                      text: "Tech Heim",
                                    )
                                  ],
                                ),
                              ),
                              Expanded(
                                  child: Image.asset(
                                      'assets/images/products/product-1.png'))
                            ],
                          ),
                        ),
                        const SizedBox(height: 20),
                        Container(
                            height: 200,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: CategoryModel.categories
                                  .map((category) => Container(
                                        width: (width -
                                                (AppPaddings.p108 * 2) -
                                                (AppPaddings.p24 * 3)) /
                                            CategoryModel.categories.length,
                                        margin:
                                            const EdgeInsets.only(right: 10),
                                        child: Column(
                                          children: [
                                            Image.asset(
                                              'assets/images/products/${category.image}',
                                            ),
                                            Text(
                                              category.name,
                                              style: theme.textTheme.bodyLarge,
                                            )
                                          ],
                                        ),
                                      ))
                                  .toList(),
                            )),
                        const SizedBox(height: 20),
                        Container(
                            height: 325,
                            decoration: BoxDecoration(
                                color: AppColors.primary500,
                                borderRadius: BorderRadius.circular(8)),
                            child: Stack(
                              children: [
                                Positioned(
                                    left: 0,
                                    top: 0,
                                    child: Image.asset(
                                        'assets/images/shapes/shape-1.png')),
                                ListView(
                                    scrollDirection: Axis.horizontal,
                                    padding: const EdgeInsets.symmetric(
                                        vertical: AppPaddings.p48),
                                    children: [
                                      Container(
                                        width: 200,
                                        margin: const EdgeInsets.symmetric(
                                            horizontal: AppPaddings.p32),
                                        child: Column(
                                          children: [
                                            const SizedBox(
                                                height: AppPaddings.p12),
                                            Text(
                                              "Products On Sale",
                                              style: theme.textTheme.titleLarge!
                                                  .copyWith(
                                                      color: AppColors.white),
                                            ),
                                            const SizedBox(
                                                height: AppPaddings.p12),
                                            Text(
                                              "Shop Now!",
                                              style: AppTextStyles.bodyXL
                                                  .copyWith(
                                                      color: AppColors.white),
                                            ),
                                            const Spacer(),
                                            LinkButton(
                                              onPressed: () {},
                                              text: "View all",
                                              textColor: Colors.white,
                                            )
                                          ],
                                        ),
                                      ),
                                      ...ProductOnSale.products
                                          .map((product) => Container(
                                                margin: const EdgeInsets.only(
                                                    right: AppPaddings.p24),
                                                child: Stack(
                                                  children: [
                                                    Container(
                                                      width: 184,
                                                      padding:
                                                          const EdgeInsets.all(
                                                              AppPaddings.p8),
                                                      decoration: BoxDecoration(
                                                          color:
                                                              AppColors.white,
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(8)),
                                                      child: Column(
                                                        children: [
                                                          Image.asset(
                                                            'assets/images/products/${product.image}',
                                                          ),
                                                          const SizedBox(
                                                              height: 15),
                                                          Text(
                                                            product.name,
                                                            maxLines: 2,
                                                            style: theme
                                                                .textTheme
                                                                .bodySmall!
                                                                .copyWith(
                                                                    overflow:
                                                                        TextOverflow
                                                                            .ellipsis),
                                                          ),
                                                          const Spacer(),
                                                          Row(
                                                            children: [
                                                              Text(
                                                                "\$${product.originalPrice}",
                                                                style: theme
                                                                    .textTheme
                                                                    .bodySmall!
                                                                    .copyWith(
                                                                        decoration:
                                                                            TextDecoration.lineThrough),
                                                              ),
                                                              const Spacer(),
                                                              Text(
                                                                "\$${product.salePrice}",
                                                                style: theme
                                                                    .textTheme
                                                                    .bodySmall,
                                                              ),
                                                            ],
                                                          )
                                                        ],
                                                      ),
                                                    ),
                                                    Positioned(
                                                        left: 0,
                                                        top: 20,
                                                        child: Container(
                                                          padding:
                                                              const EdgeInsets
                                                                  .symmetric(
                                                                  horizontal:
                                                                      AppPaddings
                                                                          .p4,
                                                                  vertical:
                                                                      AppPaddings
                                                                          .p8),
                                                          decoration: const BoxDecoration(
                                                              color: AppColors
                                                                  .secondary100,
                                                              borderRadius: BorderRadius.only(
                                                                  topRight: Radius
                                                                      .circular(
                                                                          AppContainerRadius
                                                                              .radius8),
                                                                  bottomRight: Radius
                                                                      .circular(
                                                                          AppContainerRadius
                                                                              .radius8))),
                                                          child: Text(
                                                            '-${product.discountPercentage}%',
                                                            style: theme
                                                                .textTheme
                                                                .bodySmall!
                                                                .copyWith(
                                                                    color: AppColors
                                                                        .secondary400),
                                                          ),
                                                        ))
                                                  ],
                                                ),
                                              ))
                                          .toList(),
                                    ]),
                              ],
                            )),
                        const SizedBox(height: 30),
                        Container(
                          height: width * .34,
                          constraints: const BoxConstraints(maxHeight: 400),
                          padding: const EdgeInsets.symmetric(
                              vertical: AppPaddings.p32),
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "New Products",
                                    style: theme.textTheme.headlineSmall,
                                  ),
                                  LinkButton(onPressed: () {}, text: "View all")
                                ],
                              ),
                              const SizedBox(height: 5),
                              const Divider(
                                color: AppColors.grayB4,
                              ),
                              const SizedBox(height: AppPaddings.p24),
                              Expanded(
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: ProductModel.getProducts()
                                      .map((product) => Container(
                                            child: StatefulBuilder(builder:
                                                (context, setInnerState) {
                                              return MouseRegion(
                                                cursor:
                                                    SystemMouseCursors.click,
                                                onEnter: (_) {
                                                  setInnerState(() {
                                                    _isHovered = true;
                                                  });
                                                },
                                                onExit: (_) {
                                                  setInnerState(() {
                                                    _isHovered = false;
                                                  });
                                                },
                                                child: Stack(
                                                  children: [
                                                    Container(
                                                      width: (width -
                                                              (AppPaddings
                                                                      .p108 *
                                                                  2) -
                                                              (AppPaddings.p24 *
                                                                  3)) /
                                                          ProductModel
                                                                  .getProducts()
                                                              .length,
                                                      padding:
                                                          const EdgeInsets.all(
                                                              AppPaddings.p8),
                                                      decoration: BoxDecoration(
                                                          color:
                                                              AppColors.white,
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(8),
                                                          boxShadow: [
                                                            BoxShadow(
                                                              color: Colors
                                                                  .black
                                                                  .withOpacity(
                                                                      0.1),
                                                              spreadRadius: 1,
                                                              blurRadius: 5,
                                                              offset:
                                                                  const Offset(
                                                                      0, 3),
                                                            ),
                                                          ]),
                                                      child: Column(
                                                        children: [
                                                          Image.asset(
                                                            'assets/images/products/${product.imageUrl}',
                                                          ),
                                                          Container(
                                                            height:
                                                                1.0, // Thickness of the divider
                                                            decoration:
                                                                BoxDecoration(
                                                              gradient:
                                                                  LinearGradient(
                                                                colors: [
                                                                  Colors
                                                                      .transparent,
                                                                  _isHovered
                                                                      ? AppColors
                                                                          .primary500
                                                                      : AppColors
                                                                          .black,
                                                                  Colors
                                                                      .transparent,
                                                                ], // Gradient colors
                                                                begin: Alignment
                                                                    .centerLeft, // Start of gradient
                                                                end: Alignment
                                                                    .centerRight, // End of gradient
                                                              ),
                                                            ),
                                                          ),
                                                          const SizedBox(
                                                              height: 10),
                                                          Text(
                                                            product.name,
                                                            maxLines: 2,
                                                            style: theme.textTheme.bodySmall!.copyWith(
                                                                color: _isHovered
                                                                    ? AppColors
                                                                        .primary500
                                                                    : AppColors
                                                                        .black,
                                                                overflow:
                                                                    TextOverflow
                                                                        .ellipsis),
                                                          ),
                                                          const Spacer(),
                                                          Row(
                                                            children: [
                                                              Text(
                                                                "\$${product.price}",
                                                                style: theme
                                                                    .textTheme
                                                                    .bodySmall,
                                                              ),
                                                              const Spacer(),
                                                              Row(
                                                                children: [
                                                                  SvgPicture
                                                                      .asset(
                                                                    'assets/images/icons/star.svg',
                                                                    width: AppIconsSize
                                                                        .small,
                                                                    height:
                                                                        AppIconsSize
                                                                            .small,
                                                                  ),
                                                                  const SizedBox(
                                                                      width: 4),
                                                                  Text(
                                                                    product
                                                                        .rating
                                                                        .toString(),
                                                                    style: theme
                                                                        .textTheme
                                                                        .titleSmall!
                                                                        .copyWith(
                                                                            color:
                                                                                AppColors.primary500),
                                                                  ),
                                                                ],
                                                              )
                                                            ],
                                                          )
                                                        ],
                                                      ),
                                                    ),
                                                    if (product.reduction !=
                                                            null &&
                                                        !_isHovered)
                                                      Positioned(
                                                          left: 0,
                                                          top: 20,
                                                          child: Container(
                                                            padding: const EdgeInsets
                                                                .symmetric(
                                                                horizontal:
                                                                    AppPaddings
                                                                        .p4,
                                                                vertical:
                                                                    AppPaddings
                                                                        .p8),
                                                            decoration: const BoxDecoration(
                                                                color: AppColors
                                                                    .secondary100,
                                                                borderRadius: BorderRadius.only(
                                                                    topRight: Radius.circular(
                                                                        AppContainerRadius
                                                                            .radius8),
                                                                    bottomRight:
                                                                        Radius.circular(
                                                                            AppContainerRadius.radius8))),
                                                            child: Text(
                                                              '-${product.reduction}%',
                                                              style: theme
                                                                  .textTheme
                                                                  .bodySmall!
                                                                  .copyWith(
                                                                      color: AppColors
                                                                          .secondary400),
                                                            ),
                                                          )),
                                                    if (_isHovered)
                                                      Positioned(
                                                          child: IconButton(
                                                        onPressed: () {},
                                                        icon: SvgPicture.asset(
                                                          'assets/images/icons/heart.svg',
                                                          width: AppIconsSize
                                                              .small,
                                                          height: AppIconsSize
                                                              .small,
                                                        ),
                                                      ))
                                                  ],
                                                ),
                                              );
                                            }),
                                          ))
                                      .toList(),
                                ),
                              )
                            ],
                          ),
                        ),
                        const SizedBox(height: 20),
                        Flex(direction: Axis.horizontal, children: [
                          Flexible(
                              flex: 3,
                              child: AspectRatio(
                                aspectRatio: 16 / 9.4,
                                child: Container(
                                  decoration: BoxDecoration(
                                      image: const DecorationImage(
                                          image: AssetImage(
                                              'assets/images/shapes/bg-1.png'),
                                          fit: BoxFit.cover),
                                      borderRadius: BorderRadius.circular(8)),
                                  child: Stack(
                                    children: [
                                      Positioned(
                                          left: -59,
                                          top: 20,
                                          child: Image.asset(
                                              'assets/images/shapes/shape-2.png')),
                                      Positioned(
                                          left: 280,
                                          top: -59,
                                          child: Image.asset(
                                              'assets/images/shapes/shape-2.png')),
                                      Positioned(
                                          right: -30,
                                          bottom: -30,
                                          child: Image.asset(
                                              'assets/images/shapes/shape-2.png')),
                                      Padding(
                                        padding: const EdgeInsets.all(
                                            AppPaddings.p20),
                                        child: Row(
                                          children: [
                                            Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                RichText(
                                                  text: TextSpan(
                                                    text: 'Iphone ',
                                                    style: theme
                                                        .textTheme.titleLarge,
                                                    children: <TextSpan>[
                                                      TextSpan(
                                                          text: '15 Series',
                                                          style: theme.textTheme
                                                              .titleLarge!
                                                              .copyWith(
                                                                  color: Colors
                                                                      .white)),
                                                    ],
                                                  ),
                                                ),
                                                const Spacer(),
                                                Image.asset(
                                                  'assets/images/products/product-17.png',
                                                  height: 180,
                                                ),
                                              ],
                                            ),
                                            Expanded(
                                              child: Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: [
                                                  FittedBox(
                                                    child: Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceBetween,
                                                      children: List.generate(4,
                                                          (index) {
                                                        return Container(
                                                          margin: index == 0
                                                              ? null
                                                              : const EdgeInsets
                                                                  .only(
                                                                  left:
                                                                      AppPaddings
                                                                          .p16),
                                                          padding:
                                                              const EdgeInsets
                                                                  .all(
                                                                  AppPaddings
                                                                      .p8),
                                                          decoration: BoxDecoration(
                                                              borderRadius:
                                                                  BorderRadius.circular(
                                                                      AppContainerRadius
                                                                          .radius8),
                                                              border: Border.all(
                                                                  color: Colors
                                                                      .black)),
                                                          child: Column(
                                                            children: [
                                                              Text('8',
                                                                  style: theme
                                                                      .textTheme
                                                                      .titleSmall),
                                                              Text('Days',
                                                                  style: theme
                                                                      .textTheme
                                                                      .bodySmall),
                                                            ],
                                                          ),
                                                        );
                                                      }),
                                                    ),
                                                  ),
                                                  const SizedBox(height: 20),
                                                  Align(
                                                    alignment:
                                                        Alignment.centerLeft,
                                                    child: FittedBox(
                                                      alignment:
                                                          Alignment.centerLeft,
                                                      fit: BoxFit.fill,
                                                      child: Text(
                                                          "It feels good to be the first",
                                                          style: theme.textTheme
                                                              .titleMedium),
                                                    ),
                                                  ),
                                                  Padding(
                                                    padding:
                                                        const EdgeInsets.only(
                                                            left:
                                                                AppPaddings.p12,
                                                            top:
                                                                AppPaddings.p4),
                                                    child: Text(
                                                        "Get ready for the future of smartphones.Experience innovation like never before. Stay tuned for the big iPhone 15 pre-sale.",
                                                        style: theme.textTheme
                                                            .bodyMedium),
                                                  ),
                                                  const SizedBox(height: 10),
                                                  AppButton.primary(
                                                    onPressed: () {},
                                                    padding: const EdgeInsets
                                                        .symmetric(
                                                        horizontal:
                                                            AppPaddings.p32,
                                                        vertical:
                                                            AppPaddings.p16),
                                                    text: "Register Now",
                                                  ),
                                                ],
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              )),
                          const SizedBox(width: AppPaddings.p24),
                          Flexible(
                            flex: 2,
                            child: AspectRatio(
                              aspectRatio: 16 / 14,
                              child: Container(
                                decoration: BoxDecoration(
                                    image: const DecorationImage(
                                        image: AssetImage(
                                            'assets/images/shapes/bg-2.png'),
                                        fit: BoxFit.cover),
                                    borderRadius: BorderRadius.circular(8)),
                                padding:
                                    const EdgeInsets.only(top: AppPaddings.p32),
                                child: Stack(
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          'Play Station 5',
                                          textAlign: TextAlign.center,
                                          style: theme.textTheme.titleLarge!
                                              .copyWith(
                                                  color:
                                                      AppColors.secondary200),
                                        ),
                                      ],
                                    ),
                                    Positioned(
                                      right: 10,
                                      bottom: 80,
                                      child: Image.asset(
                                        'assets/images/products/product-18.png',
                                        width: 140,
                                      ),
                                    ),
                                    Positioned(
                                        left: 30,
                                        bottom: 30,
                                        child: Column(
                                          children: [
                                            Text(
                                              'Digital Edition + 2TB',
                                              style: theme
                                                  .textTheme.titleMedium!
                                                  .copyWith(
                                                      color:
                                                          AppColors.primary400),
                                            ),
                                            const SizedBox(height: 50),
                                            AppButton.primary(
                                              onPressed: () {},
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      horizontal:
                                                          AppPaddings.p32,
                                                      vertical:
                                                          AppPaddings.p16),
                                              text: "Buy Now",
                                            ),
                                          ],
                                        )),
                                  ],
                                ),
                              ),
                            ),
                          )
                        ]),
                        const SizedBox(height: 20),
                        Container(
                          height: width * .34,
                          constraints: const BoxConstraints(maxHeight: 400),
                          padding: const EdgeInsets.symmetric(
                              vertical: AppPaddings.p32),
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "Best Sellers",
                                    style: theme.textTheme.headlineSmall,
                                  ),
                                  LinkButton(onPressed: () {}, text: "View all")
                                ],
                              ),
                              const SizedBox(height: 5),
                              const Divider(
                                color: AppColors.grayB4,
                              ),
                              const SizedBox(height: AppPaddings.p24),
                              Expanded(
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: ProductModel.getProducts2()
                                      .map((product) => Container(
                                            child: StatefulBuilder(builder:
                                                (context, setInnerState) {
                                              return MouseRegion(
                                                cursor:
                                                    SystemMouseCursors.click,
                                                onEnter: (_) {
                                                  setInnerState(() {
                                                    _isHovered = true;
                                                  });
                                                },
                                                onExit: (_) {
                                                  setInnerState(() {
                                                    _isHovered = false;
                                                  });
                                                },
                                                child: Stack(
                                                  children: [
                                                    Container(
                                                      width: (width -
                                                              (AppPaddings
                                                                      .p108 *
                                                                  2) -
                                                              (AppPaddings.p24 *
                                                                  3)) /
                                                          ProductModel
                                                                  .getProducts()
                                                              .length,
                                                      padding:
                                                          const EdgeInsets.all(
                                                              AppPaddings.p8),
                                                      decoration: BoxDecoration(
                                                          color:
                                                              AppColors.white,
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(8),
                                                          boxShadow: [
                                                            BoxShadow(
                                                              color: Colors
                                                                  .black
                                                                  .withOpacity(
                                                                      0.1),
                                                              spreadRadius: 1,
                                                              blurRadius: 5,
                                                              offset:
                                                                  const Offset(
                                                                      0, 3),
                                                            ),
                                                          ]),
                                                      child: Column(
                                                        children: [
                                                          Image.asset(
                                                            'assets/images/products/${product.imageUrl}',
                                                          ),
                                                          Container(
                                                            height:
                                                                1.0, // Thickness of the divider
                                                            decoration:
                                                                BoxDecoration(
                                                              gradient:
                                                                  LinearGradient(
                                                                colors: [
                                                                  Colors
                                                                      .transparent,
                                                                  _isHovered
                                                                      ? AppColors
                                                                          .primary500
                                                                      : AppColors
                                                                          .black,
                                                                  Colors
                                                                      .transparent,
                                                                ], // Gradient colors
                                                                begin: Alignment
                                                                    .centerLeft, // Start of gradient
                                                                end: Alignment
                                                                    .centerRight, // End of gradient
                                                              ),
                                                            ),
                                                          ),
                                                          const SizedBox(
                                                              height: 10),
                                                          Text(
                                                            product.name,
                                                            maxLines: 2,
                                                            style: theme.textTheme.bodySmall!.copyWith(
                                                                color: _isHovered
                                                                    ? AppColors
                                                                        .primary500
                                                                    : AppColors
                                                                        .black,
                                                                overflow:
                                                                    TextOverflow
                                                                        .ellipsis),
                                                          ),
                                                          const Spacer(),
                                                          Row(
                                                            children: [
                                                              Text(
                                                                "\$${product.price}",
                                                                style: theme
                                                                    .textTheme
                                                                    .bodySmall,
                                                              ),
                                                              const Spacer(),
                                                              Row(
                                                                children: [
                                                                  SvgPicture
                                                                      .asset(
                                                                    'assets/images/icons/star.svg',
                                                                    width: AppIconsSize
                                                                        .small,
                                                                    height:
                                                                        AppIconsSize
                                                                            .small,
                                                                  ),
                                                                  const SizedBox(
                                                                      width: 4),
                                                                  Text(
                                                                    product
                                                                        .rating
                                                                        .toString(),
                                                                    style: theme
                                                                        .textTheme
                                                                        .titleSmall!
                                                                        .copyWith(
                                                                            color:
                                                                                AppColors.primary500),
                                                                  ),
                                                                ],
                                                              )
                                                            ],
                                                          )
                                                        ],
                                                      ),
                                                    ),
                                                    if (product.reduction !=
                                                            null &&
                                                        !_isHovered)
                                                      Positioned(
                                                          left: 0,
                                                          top: 20,
                                                          child: Container(
                                                            padding: const EdgeInsets
                                                                .symmetric(
                                                                horizontal:
                                                                    AppPaddings
                                                                        .p4,
                                                                vertical:
                                                                    AppPaddings
                                                                        .p8),
                                                            decoration: const BoxDecoration(
                                                                color: AppColors
                                                                    .secondary100,
                                                                borderRadius: BorderRadius.only(
                                                                    topRight: Radius.circular(
                                                                        AppContainerRadius
                                                                            .radius8),
                                                                    bottomRight:
                                                                        Radius.circular(
                                                                            AppContainerRadius.radius8))),
                                                            child: Text(
                                                              '-${product.reduction}%',
                                                              style: theme
                                                                  .textTheme
                                                                  .bodySmall!
                                                                  .copyWith(
                                                                      color: AppColors
                                                                          .secondary400),
                                                            ),
                                                          )),
                                                    if (_isHovered)
                                                      Positioned(
                                                          child: IconButton(
                                                        onPressed: () {},
                                                        icon: SvgPicture.asset(
                                                          'assets/images/icons/heart.svg',
                                                          width: AppIconsSize
                                                              .small,
                                                          height: AppIconsSize
                                                              .small,
                                                        ),
                                                      ))
                                                  ],
                                                ),
                                              );
                                            }),
                                          ))
                                      .toList(),
                                ),
                              )
                            ],
                          ),
                        ),
                        const SizedBox(height: 20),
                        Container(
                          height: 250,
                          padding: const EdgeInsets.symmetric(
                              vertical: AppPaddings.p32),
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "Top Brands",
                                    style: theme.textTheme.headlineSmall,
                                  ),
                                ],
                              ),
                              const SizedBox(height: 5),
                              const Divider(
                                color: AppColors.grayB4,
                              ),
                              const SizedBox(height: AppPaddings.p4),
                              Expanded(
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: BrandModel.getSampleBrands()
                                      .map((brand) => Flexible(
                                            flex: 1,
                                            child: Container(
                                              child: Image.asset(
                                                'assets/images/brands/${brand.imageUrl}',
                                              ),
                                            ),
                                          ))
                                      .toList(),
                                ),
                              )
                            ],
                          ),
                        ),
                        const SizedBox(height: 20),
                        AspectRatio(
                          aspectRatio: 16 / 6,
                          child: Container(
                            height: 420,
                            decoration: BoxDecoration(
                                color: AppColors.primary900,
                                borderRadius: BorderRadius.circular(
                                    AppContainerRadius.radius8)),
                            child: Stack(
                              children: [
                                Positioned(
                                    right: 0,
                                    top: 0,
                                    bottom: 0,
                                    child: CustomPaint(
                                      painter: RoundedShapePainter(),
                                      size: Size(
                                          (width - 2 * AppPaddings.p108) * .45,
                                          200),
                                    )),
                                Padding(
                                  padding:
                                      const EdgeInsets.all(AppPaddings.p48),
                                  child: Row(
                                    children: [
                                      Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          Text(
                                            'SMART WATCH',
                                            style: theme
                                                .textTheme.headlineLarge!
                                                .copyWith(
                                              color: Colors.white,
                                            ),
                                          ),
                                          const SizedBox(
                                              height: AppPaddings.p16),
                                          Text(
                                            'Various designs and brands',
                                            style: theme.textTheme.bodyLarge!
                                                .copyWith(
                                              color: Colors.white,
                                            ),
                                          ),
                                          const SizedBox(
                                              height: AppPaddings.p16),
                                          AppButton.secondary(
                                            onPressed: () {},
                                            padding: const EdgeInsets.symmetric(
                                                horizontal: AppPaddings.p16,
                                                vertical: AppPaddings.p16),
                                            textColor: AppColors.primary900,
                                            text: "view",
                                          )
                                        ],
                                      ),
                                      Expanded(
                                        child: Padding(
                                          padding: const EdgeInsets.all(
                                              AppPaddings.p48),
                                          child: Image.asset(
                                              'assets/images/products/product-19.png'),
                                        ),
                                      )
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(height: 20),
                        Container(
                          height: 420,
                          padding: const EdgeInsets.symmetric(
                              vertical: AppPaddings.p32),
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "Our Blogs",
                                    style: theme.textTheme.headlineSmall,
                                  ),
                                  LinkButton(onPressed: () {}, text: "View all")
                                ],
                              ),
                              const SizedBox(height: 5),
                              const Divider(
                                color: AppColors.grayB4,
                              ),
                              const SizedBox(height: AppPaddings.p4),
                              Expanded(
                                child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Flexible(
                                        flex: 1,
                                        child: Column(
                                          children: [
                                            ClipRRect(
                                              borderRadius:
                                                  const BorderRadius.vertical(
                                                      top: Radius.circular(
                                                          AppPaddings.p8)),
                                              child: Image.asset(
                                                'assets/images/general/image-1.png',
                                                fit: BoxFit.fill,
                                              ),
                                            ),
                                            const SizedBox(height: 10),
                                            Padding(
                                              padding: const EdgeInsets.all(
                                                  AppPaddings.p8),
                                              child: Column(children: [
                                                Row(
                                                  children: [
                                                    SvgPicture.asset(
                                                      'assets/images/icons/calendar.svg',
                                                      width: AppIconsSize.s20,
                                                      height: AppIconsSize.s20,
                                                    ),
                                                    Text(
                                                      "August 8, 2023",
                                                      style:
                                                          AppTextStyles.bodyXS,
                                                    ),
                                                    const Spacer(),
                                                    SvgPicture.asset(
                                                      'assets/images/icons/timer.svg',
                                                      width: AppIconsSize.s20,
                                                      height: AppIconsSize.s20,
                                                    ),
                                                    Text(
                                                      "3 min read",
                                                      style:
                                                          AppTextStyles.bodyXS,
                                                    ),
                                                  ],
                                                ),
                                                const SizedBox(height: 10),
                                                Text(
                                                  "Meta Platforms plans to release free software that...",
                                                  maxLines: 1,
                                                  style: theme
                                                      .textTheme.titleMedium,
                                                ),
                                                const SizedBox(height: 10),
                                                Text(
                                                    "The parent company of Facebook, Meta Platforms, is introducing software to help developers",
                                                    maxLines: 2,
                                                    style: theme
                                                        .textTheme.bodySmall),
                                              ]),
                                            )
                                          ],
                                        ),
                                      ),
                                      const SizedBox(width: 10),
                                      Flexible(
                                          flex: 2,
                                          child: Column(
                                            children: [
                                              Container(
                                                decoration: BoxDecoration(
                                                  color: AppColors.white,
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          AppContainerRadius
                                                              .radius8),
                                                  boxShadow: [
                                                    BoxShadow(
                                                      color: Colors.black
                                                          .withOpacity(0.1),
                                                      spreadRadius: 1,
                                                      blurRadius: 5,
                                                      offset:
                                                          const Offset(0, 3),
                                                    ),
                                                  ],
                                                ),
                                                child: Row(
                                                  children: [
                                                    ClipRRect(
                                                      borderRadius:
                                                          const BorderRadius
                                                              .horizontal(
                                                              left: Radius
                                                                  .circular(
                                                                      AppPaddings
                                                                          .p8)),
                                                      child: Image.asset(
                                                        'assets/images/general/image-2.png',
                                                        height: 140,
                                                      ),
                                                    ),
                                                    Expanded(
                                                      child: Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                .all(AppPaddings
                                                                    .p12),
                                                        child: Column(
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .start,
                                                          children: [
                                                            Text(
                                                              "8 Things You Probably Didn’t Know About Headphones",
                                                              style: theme
                                                                  .textTheme
                                                                  .titleSmall!
                                                                  .copyWith(
                                                                      color: AppColors
                                                                          .secondary),
                                                            ),
                                                            const SizedBox(
                                                                height: 10),
                                                            Text(
                                                              "Owning a headphone could mean a different thing for different people. For some, it acts as a fashion statement. It’s easy to spot these people, the headphones are almost always just hanging around the neck.",
                                                              maxLines: 2,
                                                              style: theme
                                                                  .textTheme
                                                                  .bodySmall!
                                                                  .copyWith(
                                                                      overflow:
                                                                          TextOverflow
                                                                              .ellipsis),
                                                            ),
                                                            const SizedBox(
                                                                height: 10),
                                                            Row(
                                                              children: [
                                                                SvgPicture
                                                                    .asset(
                                                                  'assets/images/icons/calendar.svg',
                                                                  width:
                                                                      AppIconsSize
                                                                          .s20,
                                                                  height:
                                                                      AppIconsSize
                                                                          .s20,
                                                                ),
                                                                Text(
                                                                    "March 28, 2023",
                                                                    style: AppTextStyles
                                                                        .bodyXS),
                                                                Spacer(),
                                                                SvgPicture
                                                                    .asset(
                                                                  'assets/images/icons/save.svg',
                                                                  width:
                                                                      AppIconsSize
                                                                          .s20,
                                                                  height:
                                                                      AppIconsSize
                                                                          .s20,
                                                                ),
                                                              ],
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                    )
                                                  ],
                                                ),
                                              ),
                                              // SizedBox(height: 10),
                                              Container(
                                                margin:
                                                    EdgeInsets.only(top: 10),
                                                decoration: BoxDecoration(
                                                  color: AppColors.white,
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          AppContainerRadius
                                                              .radius8),
                                                  boxShadow: [
                                                    BoxShadow(
                                                      color: Colors.black
                                                          .withOpacity(0.1),
                                                      spreadRadius: 1,
                                                      blurRadius: 5,
                                                      offset:
                                                          const Offset(0, 3),
                                                    ),
                                                  ],
                                                ),
                                                child: Row(
                                                  children: [
                                                    ClipRRect(
                                                      borderRadius:
                                                          const BorderRadius
                                                              .horizontal(
                                                              left: Radius
                                                                  .circular(
                                                                      AppPaddings
                                                                          .p8)),
                                                      child: Image.asset(
                                                        'assets/images/general/image-3.png',
                                                        height: 140,
                                                      ),
                                                    ),
                                                    Expanded(
                                                      child: Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                .all(AppPaddings
                                                                    .p12),
                                                        child: Column(
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .start,
                                                          children: [
                                                            Text(
                                                              "Analyzing the August 17th Bitcoin Price Drop",
                                                              style: theme
                                                                  .textTheme
                                                                  .titleSmall!
                                                                  .copyWith(
                                                                      color: AppColors
                                                                          .secondary),
                                                            ),
                                                            const SizedBox(
                                                                height: 10),
                                                            Text(
                                                              "On August 17th at 9:30PM UTC, Bitcoin’s price dropped more than 8% in a 10-minute window, to a two-month low of under \$26k. This pulled",
                                                              maxLines: 2,
                                                              style: theme
                                                                  .textTheme
                                                                  .bodySmall!
                                                                  .copyWith(
                                                                      overflow:
                                                                          TextOverflow
                                                                              .ellipsis),
                                                            ),
                                                            const SizedBox(
                                                                height: 10),
                                                            Row(
                                                              children: [
                                                                SvgPicture
                                                                    .asset(
                                                                  'assets/images/icons/calendar.svg',
                                                                  width:
                                                                      AppIconsSize
                                                                          .s20,
                                                                  height:
                                                                      AppIconsSize
                                                                          .s20,
                                                                ),
                                                                Text(
                                                                    "August 17, 2023",
                                                                    style: AppTextStyles
                                                                        .bodyXS),
                                                                Spacer(),
                                                                Visibility(
                                                                  visible:
                                                                      false,
                                                                  child:
                                                                      SvgPicture
                                                                          .asset(
                                                                    'assets/images/icons/save.svg',
                                                                    width:
                                                                        AppIconsSize
                                                                            .s20,
                                                                    height:
                                                                        AppIconsSize
                                                                            .s20,
                                                                  ),
                                                                ),
                                                              ],
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                    )
                                                  ],
                                                ),
                                              ),
                                            ],
                                          ))
                                    ]),
                              )
                            ],
                          ),
                        ),
                        const SizedBox(height: 20),
                        SizedBox(
                          height: 100,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                child: Row(
                                  children: [
                                    SvgPicture.asset(
                                      'assets/images/icons/desktop-star.svg',
                                      width: AppIconsSize.s24,
                                      height: AppIconsSize.s24,
                                    ),
                                    const SizedBox(width: AppPaddings.p4),
                                    Text("Latest and Greatest Tech",
                                        style: AppTextStyles.bodyXL),
                                  ],
                                ),
                              ),
                              Container(
                                child: Row(
                                  children: [
                                    SvgPicture.asset(
                                      'assets/images/icons/guarentee.svg',
                                      width: AppIconsSize.s24,
                                      height: AppIconsSize.s24,
                                    ),
                                    const SizedBox(width: AppPaddings.p4),
                                    Text("Guarantee",
                                        style: AppTextStyles.bodyXL),
                                  ],
                                ),
                              ),
                              Container(
                                child: Row(
                                  children: [
                                    SvgPicture.asset(
                                      'assets/images/icons/free-shipping.svg',
                                      width: AppIconsSize.s24,
                                      height: AppIconsSize.s24,
                                    ),
                                    const SizedBox(width: AppPaddings.p4),
                                    Text("Free Shipping over 1000\$",
                                        style: AppTextStyles.bodyXL),
                                  ],
                                ),
                              ),
                              Container(
                                child: Row(
                                  children: [
                                    SvgPicture.asset(
                                      'assets/images/icons/support-time.svg',
                                      width: AppIconsSize.s24,
                                      height: AppIconsSize.s24,
                                    ),
                                    const SizedBox(width: AppPaddings.p4),
                                    Text("24/7 Support",
                                        style: AppTextStyles.bodyXL),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 20),
                      ],
                    ),
                  ),
                  Footer()
                ],
              ),
            ),
            Positioned(
                bottom: 100,
                right: AppPaddings.p108,
                child: CustomIconButton(
                  onPress: () {},
                  icon: SvgPicture.asset(
                      "assets/images/icons/arrow-circle-up.svg"),
                )),
            if(_isProductsMenuOpen)ProductsMenu(),
            if( ref.watch(accountMenuNotifierProvider))AccountMenu(),
            if( ref.watch(cartNotifierProvider))Cart(),
            SearchMenu()
          ],
        ));
  }
}
