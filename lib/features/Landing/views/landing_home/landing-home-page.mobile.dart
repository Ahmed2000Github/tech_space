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
import 'package:tech_space/features/Landing/models/brand_model.dart';
import 'package:tech_space/features/Landing/models/category-model.dart';
import 'package:tech_space/features/Landing/models/product_model.dart';
import 'package:tech_space/features/Landing/models/product_on_sale.dart';
import 'package:tech_space/features/Landing/providers/account_menu_notifier.dart';
import 'package:tech_space/features/Landing/providers/cart_notifier.dart';
import 'package:tech_space/features/Landing/providers/products_menu_provider.dart';
import 'package:tech_space/core/widgets/link_button.dart';
import 'package:tech_space/features/Landing/views/widgets/account-menu.dart';
import 'package:tech_space/features/Landing/views/widgets/app-button.dart';
import 'package:tech_space/features/Landing/views/widgets/app-drawer.dart';
import 'package:tech_space/features/Landing/views/widgets/cart.dart';
import 'package:tech_space/features/Landing/views/widgets/cart.mobile.dart';
import 'package:tech_space/features/Landing/views/widgets/custom_icon_button.dart';
import 'package:tech_space/features/Landing/views/widgets/footer.desktop.dart';
import 'package:tech_space/features/Landing/views/widgets/footer.mobile.dart';
import 'package:tech_space/features/Landing/views/widgets/hearder.mobile.dart';
import 'package:tech_space/features/Landing/views/widgets/products-menu.dart';
import 'package:tech_space/features/Landing/views/widgets/rounded_shape_painter.dart';

class LandingHomePageMobile extends ConsumerWidget {

    final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  LandingHomePageMobile({Key? key}) : super(key: key);
  bool _isHovered = false;
  bool _isProductsMenuOpen = false;
  


  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    final width = MediaQuery.of(context).size.width;
    _isProductsMenuOpen = ref.watch(productsMenuNotifierProvider);
    return Scaffold(
          key: _scaffoldKey,
        appBar:  HearderMobile(scaffoldKey: _scaffoldKey,),
        drawer: Drawer(
          shape: BeveledRectangleBorder(),
          child: AppDrawer(),
        ),
        body: Stack(
          children: [
            SingleChildScrollView(
              child: Column(
                children: [
                  Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: AppPaddings.p24),
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
                                    const Text(
                                      "Tech Heim",
                                      style: AppTextStylesMobile.h1,
                                    ),
                                    RichText(
                                      text: TextSpan(
                                        text: 'Join the',
                                        style: AppTextStylesMobile.caption,
                                        children: <TextSpan>[
                                          TextSpan(
                                              text: 'digital revolution',
                                              style: AppTextStylesMobile.caption
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
                                          horizontal: AppPaddings.p20,
                                          vertical: AppPaddings.p20),
                                      text: "Explore More",
                                      textStyle:
                                          AppTextStylesMobile.overline.copyWith(
                                        color: AppColors.white,
                                        fontWeight: FontWeight.normal,
                                      ),
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
                        const SizedBox(height: AppSpacing.s24),
                        SizedBox(
                            height: 100,
                            child: ListView(
                              scrollDirection: Axis.horizontal,
                              children: CategoryModel.categories
                                  .map((category) => Container(
                                        width: 80,
                                        margin:
                                            const EdgeInsets.only(right: 10),
                                        child: Column(
                                          children: [
                                            Image.asset(
                                              'assets/images/products/${category.image}',
                                            ),
                                            Text(
                                              category.name,
                                              style: AppTextStylesMobile.bodySM,
                                            )
                                          ],
                                        ),
                                      ))
                                  .toList(),
                            )),
                        const SizedBox(height: AppSpacing.s24),
                        Container(
                            height: 180,
                            decoration: BoxDecoration(
                                color: AppColors.primary500,
                                borderRadius: BorderRadius.circular(8)),
                            child: Stack(
                              children: [
                                Positioned(
                                    left: 0,
                                    top: 0,
                                    child: Image.asset(
                                      'assets/images/shapes/shape-1.png',
                                      width: 200,
                                    )),
                                ListView(
                                    scrollDirection: Axis.horizontal,
                                    padding: const EdgeInsets.symmetric(
                                        vertical: AppPaddings.p16),
                                    children: [
                                      Container(
                                        width: 140,
                                        child: Column(
                                          children: [
                                            const SizedBox(
                                                height: AppPaddings.p12),
                                            Text(
                                              "Products On Sale",
                                              style: AppTextStylesMobile.h4
                                                  .copyWith(
                                                      color: AppColors.white),
                                            ),
                                            const SizedBox(
                                                height: AppPaddings.p12),
                                            Text(
                                              "Shop Now!",
                                              style: AppTextStylesMobile.bodySM
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
                                                      width: 111,
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
                                                              height: 5),
                                                          Text(
                                                            product.name,
                                                            maxLines: 2,
                                                            style: AppTextStylesMobile
                                                                .bodySM
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
                                                                style: AppTextStylesMobile
                                                                    .bodySM
                                                                    .copyWith(
                                                                        decoration:
                                                                            TextDecoration.lineThrough),
                                                              ),
                                                              const Spacer(),
                                                              Text(
                                                                  "\$${product.salePrice}",
                                                                  style: AppTextStylesMobile
                                                                      .bodySM),
                                                            ],
                                                          )
                                                        ],
                                                      ),
                                                    ),
                                                    Positioned(
                                                        left: 0,
                                                        top: 4,
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
                                                            style: AppTextStylesMobile
                                                                .bodySM
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
                        const SizedBox(height: AppSpacing.s24),
                        Container(
                          // constraints: const BoxConstraints(maxHeight: 400),
                          padding: const EdgeInsets.symmetric(
                              vertical: AppPaddings.p32),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  const Text(
                                    "New Products",
                                    style: AppTextStylesMobile.h3,
                                  ),
                                  LinkButton(onPressed: () {}, text: "View all")
                                ],
                              ),
                              const SizedBox(height: 5),
                              const Divider(
                                color: AppColors.grayB4,
                              ),
                              const SizedBox(height: AppPaddings.p24),
                              SizedBox(
                                width: double.infinity,
                                child: Wrap(
                                  spacing: AppSpacing.s16,
                                  runSpacing: AppSpacing.s16,
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
                                                              (AppPaddings.p24 *
                                                                  2) -
                                                              AppSpacing.s16) /
                                                          2,
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
                                                        mainAxisSize:
                                                            MainAxisSize.min,
                                                        children: [
                                                          Flexible(
                                                            flex: 3,
                                                            child: Image.asset(
                                                              'assets/images/products/${product.imageUrl}',
                                                            ),
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
                                                          SizedBox(
                                                            height: 40,
                                                            child: Align(
                                                              alignment: Alignment
                                                                  .centerLeft,
                                                              child: Text(
                                                                product.name,
                                                                maxLines: 2,
                                                                style: AppTextStylesMobile.bodySM.copyWith(
                                                                    color: _isHovered
                                                                        ? AppColors
                                                                            .primary500
                                                                        : AppColors
                                                                            .black,
                                                                    overflow:
                                                                        TextOverflow
                                                                            .ellipsis),
                                                              ),
                                                            ),
                                                          ),
                                                          Row(
                                                            children: [
                                                              Text(
                                                                "\$${product.price}",
                                                                style:
                                                                    AppTextStylesMobile
                                                                        .bodySM,
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
                                                                    style: AppTextStylesMobile
                                                                        .h4
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
                        const SizedBox(height: AppSpacing.s24),
                        Column(mainAxisSize: MainAxisSize.min, children: [
                          Container(
                            height: 180,
                            decoration: BoxDecoration(
                                image: const DecorationImage(
                                    image: AssetImage(
                                        'assets/images/shapes/bg-1.png'),
                                    fit: BoxFit.cover),
                                borderRadius: BorderRadius.circular(8)),
                            child: Stack(
                              children: [
                                Positioned(
                                    left: -50,
                                    top: 20,
                                    child: Image.asset(
                                      'assets/images/shapes/shape-2.png',
                                      width: AppSpacing.s72,
                                    )),
                                Positioned(
                                    left: (width - 2 * AppPaddings.p24) * .3,
                                    top: -50,
                                    child: Image.asset(
                                      'assets/images/shapes/shape-2.png',
                                      width: AppSpacing.s72,
                                    )),
                                Positioned(
                                    right: -30,
                                    bottom: -30,
                                    child: Image.asset(
                                      'assets/images/shapes/shape-2.png',
                                      width: AppSpacing.s72,
                                    )),
                                Positioned(
                                  left: 10,
                                  bottom: -5,
                                  child: Image.asset(
                                    'assets/images/products/product-17.png',
                                    width: (width - 2 * AppPaddings.p24) * .45,
                                    height: 120,
                                    fit: BoxFit.fill,
                                  ),
                                ),
                                Padding(
                                  padding:
                                      const EdgeInsets.all(AppPaddings.p12),
                                  child: Row(
                                    children: [
                                      Expanded(
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            RichText(
                                              text: TextSpan(
                                                text: 'Iphone ',
                                                style: AppTextStylesMobile.h4,
                                                children: <TextSpan>[
                                                  TextSpan(
                                                      text: '15 Series',
                                                      style: AppTextStylesMobile
                                                          .h4
                                                          .copyWith(
                                                              color: Colors
                                                                  .white)),
                                                ],
                                              ),
                                            ),
                                            const Spacer(),
                                          ],
                                        ),
                                      ),
                                      Flexible(
                                        flex: 1,
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            FittedBox(
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children:
                                                    List.generate(4, (index) {
                                                  return Container(
                                                    margin: index == 0
                                                        ? null
                                                        : const EdgeInsets.only(
                                                            left: AppPaddings
                                                                .p16),
                                                    padding:
                                                        const EdgeInsets.all(
                                                            AppPaddings.p8),
                                                    decoration: BoxDecoration(
                                                        borderRadius:
                                                            BorderRadius.circular(
                                                                AppContainerRadius
                                                                    .radius8),
                                                        border: Border.all(
                                                            color:
                                                                Colors.black)),
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
                                            const Align(
                                              alignment: Alignment.centerLeft,
                                              child: FittedBox(
                                                alignment: Alignment.centerLeft,
                                                fit: BoxFit.fill,
                                                child: Text(
                                                    "It feels good to be the first",
                                                    style:
                                                        AppTextStylesMobile.h4),
                                              ),
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  // left: AppPaddings.p12,
                                                  top: AppPaddings.p4),
                                              child: Text(
                                                  "Get ready for the future of smartphones.Experience innovation like never before. Stay tuned for the big iPhone 15 pre-sale.",
                                                  maxLines: 5,
                                                  style: AppTextStylesMobile
                                                      .overline
                                                      .copyWith(fontSize: 8)),
                                            ),
                                            // const SizedBox(height: 10),
                                            const Spacer(),
                                            Align(
                                              alignment: Alignment.centerLeft,
                                              child: AppButton.primary(
                                                onPressed: () {},
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                        horizontal:
                                                            AppPaddings.p8,
                                                        vertical:
                                                            AppPaddings.p4),
                                                text: "Shop Now",
                                                textStyle: AppTextStylesMobile
                                                    .buttonLG
                                                    .copyWith(
                                                  color: Colors.white,
                                                ),
                                              ),
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
                          const SizedBox(height: AppPaddings.p16),
                          Flexible(
                            flex: 2,
                            child: Container(
                              height: 180,
                              decoration: BoxDecoration(
                                  image: const DecorationImage(
                                      image: AssetImage(
                                          'assets/images/shapes/bg-2.png'),
                                      fit: BoxFit.fill),
                                  borderRadius: BorderRadius.circular(8)),
                              padding:
                                  const EdgeInsets.only(top: AppPaddings.p12),
                              child: Stack(
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        'Play Station 5',
                                        textAlign: TextAlign.center,
                                        style: theme.textTheme.titleLarge!
                                            .copyWith(
                                                color: AppColors.secondary200),
                                      ),
                                    ],
                                  ),
                                  Positioned(
                                    right: 10,
                                    bottom: 10,
                                    child: Image.asset(
                                      'assets/images/products/product-18.png',
                                      width: 130,
                                    ),
                                  ),
                                  Positioned(
                                      left: 25,
                                      bottom: AppPaddings.p8,
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.end,
                                        children: [
                                          Text(
                                            'Digital Edition + 2TB',
                                            style: AppTextStylesMobile.h4
                                                .copyWith(
                                                    color:
                                                        AppColors.primary400),
                                          ),
                                          const SizedBox(
                                              height: AppSpacing.s24),
                                          AppButton.primary(
                                            onPressed: () {},
                                            padding: const EdgeInsets.symmetric(
                                                horizontal: AppPaddings.p8,
                                                vertical: AppPaddings.p8),
                                            text: "Buy Now",
                                            textStyle: AppTextStylesMobile
                                                .buttonLG
                                                .copyWith(
                                              color: Colors.white,
                                            ),
                                          ),
                                        ],
                                      )),
                                ],
                              ),
                            ),
                          )
                        ]),
                        const SizedBox(height: AppSpacing.s24),
                        Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Row(
                              mainAxisAlignment:
                                  MainAxisAlignment.spaceBetween,
                              children: [
                                const Text(
                                  "Best Sellers",
                                  style: AppTextStylesMobile.h3,
                                ),
                                LinkButton(onPressed: () {}, text: "View all")
                              ],
                            ),
                            const SizedBox(height: 5),
                            const Divider(
                              color: AppColors.grayB4,
                            ),
                            const SizedBox(height: AppPaddings.p24),
                            SizedBox(
                              width: double.infinity,
                              child: Wrap(
                                spacing: AppSpacing.s16,
                                runSpacing: AppSpacing.s16,
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
                                                            (AppPaddings.p24 *
                                                                2) -
                                                            AppSpacing.s16) /
                                                        2,
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
                                                      mainAxisSize:
                                                          MainAxisSize.min,
                                                      children: [
                                                        Flexible(
                                                          flex: 3,
                                                          child: Image.asset(
                                                            'assets/images/products/${product.imageUrl}',
                                                          ),
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
                                                        SizedBox(
                                                          height: 40,
                                                          child: Align(
                                                            alignment: Alignment
                                                                .centerLeft,
                                                            child: Text(
                                                              product.name,
                                                              maxLines: 2,
                                                              style: AppTextStylesMobile.bodySM.copyWith(
                                                                  color: _isHovered
                                                                      ? AppColors
                                                                          .primary500
                                                                      : AppColors
                                                                          .black,
                                                                  overflow:
                                                                      TextOverflow
                                                                          .ellipsis),
                                                            ),
                                                          ),
                                                        ),
                                                        Row(
                                                          children: [
                                                            Text(
                                                              "\$${product.price}",
                                                              style:
                                                                  AppTextStylesMobile
                                                                      .bodySM,
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
                                                                  style: AppTextStylesMobile
                                                                      .h4
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
                        const SizedBox(height: AppSpacing.s24),
                        SizedBox(
                          height: 150,
                          // padding: const EdgeInsets.symmetric(
                          //     vertical: AppPaddings.p32),
                          child: Column(
                            children: [
                              const Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "Top Brands",
                                    style: AppTextStylesMobile.h3,
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
                        const SizedBox(height: AppSpacing.s24),
                        Container(
                          height: 200,
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
                                        (width - 2 * AppPaddings.p24) * .5,
                                        200),
                                  )),
                              Padding(
                                padding: const EdgeInsets.all(AppPaddings.p8),
                                child: Row(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          vertical: AppPaddings.p24),
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            'SMART WATCH',
                                            style:
                                                AppTextStylesMobile.h3.copyWith(
                                              color: Colors.white,
                                            ),
                                          ),
                                          const SizedBox(
                                              height: AppPaddings.p16),
                                          Text(
                                            'Various designs and brands',
                                            style: AppTextStylesMobile.overline
                                                .copyWith(
                                              fontWeight: FontWeight.normal,
                                              color: Colors.white,
                                            ),
                                          ),
                                          const Spacer(),
                                          Align(
                                            alignment: Alignment.center,
                                            child: AppButton.secondary(
                                              onPressed: () {},
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      horizontal:
                                                          AppPaddings.p16,
                                                      vertical:
                                                          AppPaddings.p16),
                                              textColor: AppColors.primary900,
                                              text: "Shop Now",
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                    Expanded(
                                      child: Padding(
                                        padding: const EdgeInsets.all(
                                            AppPaddings.p8),
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
                        const SizedBox(height: 20),
                        Container(
                          // height: 420,
                          padding: const EdgeInsets.symmetric(
                              vertical: AppPaddings.p32),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  const Text(
                                    "Our Blogs",
                                    style: AppTextStylesMobile.h3,
                                  ),
                                  LinkButton(onPressed: () {}, text: "View all")
                                ],
                              ),
                              const SizedBox(height: 5),
                              const Divider(
                                color: AppColors.grayB4,
                              ),
                              const SizedBox(height: AppPaddings.p4),

                              Container(
                                margin: const EdgeInsets.only(top: 10),
                                decoration: BoxDecoration(
                                  color: AppColors.white,
                                  borderRadius: BorderRadius.circular(
                                      AppContainerRadius.radius8),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.black.withOpacity(0.1),
                                      spreadRadius: 1,
                                      blurRadius: 5,
                                      offset: const Offset(0, 3),
                                    ),
                                  ],
                                ),
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    ClipRRect(
                                      borderRadius: const BorderRadius.vertical(
                                          top: Radius.circular(AppPaddings.p8)),
                                      child: Image.asset(
                                        'assets/images/general/image-1.png',
                                        fit: BoxFit.fill,
                                      ),
                                    ),
                                    const SizedBox(height: 10),
                                    Padding(
                                      padding:
                                          const EdgeInsets.all(AppPaddings.p8),
                                      child: Column(children: [
                                        Row(
                                          children: [
                                            SvgPicture.asset(
                                              'assets/images/icons/calendar.svg',
                                              width: AppIconsSize.s20,
                                              height: AppIconsSize.s20,
                                            ),
                                            const Text(
                                              "August 8, 2023",
                                              style: AppTextStyles.bodyXS,
                                            ),
                                            const Spacer(),
                                            SvgPicture.asset(
                                              'assets/images/icons/timer.svg',
                                              width: AppIconsSize.s20,
                                              height: AppIconsSize.s20,
                                            ),
                                            const Text(
                                              "3 min read",
                                              style: AppTextStyles.bodyXS,
                                            ),
                                          ],
                                        ),
                                        const SizedBox(height: 10),
                                        Text(
                                          "Meta Platforms plans to release free software that...",
                                          maxLines: 2,
                                          style: theme.textTheme.bodyMedium,
                                        ),
                                        const SizedBox(height: 10),
                                        Text(
                                            "The parent company of Facebook, Meta Platforms, is introducing software to help developers",
                                            maxLines: 3,
                                            style: AppTextStylesMobile.bodySM
                                                .copyWith(
                                                    color: AppColors.gray9E)),
                                      ]),
                                    )
                                  ],
                                ),
                              ),
                              const SizedBox(height: AppSpacing.s16),
                              Container(
                                decoration: BoxDecoration(
                                  color: AppColors.white,
                                  borderRadius: BorderRadius.circular(
                                      AppContainerRadius.radius8),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.black.withOpacity(0.1),
                                      spreadRadius: 1,
                                      blurRadius: 5,
                                      offset: const Offset(0, 3),
                                    ),
                                  ],
                                ),
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    ClipRRect(
                                      borderRadius: const BorderRadius.vertical(
                                          top: Radius.circular(AppPaddings.p8)),
                                      child: Image.asset(
                                        'assets/images/general/image-4.png',
                                        fit: BoxFit.fill,
                                        width: double.infinity,
                                      ),
                                    ),
                                    Padding(
                                      padding:
                                          const EdgeInsets.all(AppPaddings.p12),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Row(
                                            children: [
                                              SvgPicture.asset(
                                                'assets/images/icons/calendar.svg',
                                                width: AppIconsSize.s20,
                                                height: AppIconsSize.s20,
                                              ),
                                              const Text(
                                                "March , 28 , 2023",
                                                style: AppTextStyles.bodyXS,
                                              ),
                                              const Spacer(),
                                              SvgPicture.asset(
                                                'assets/images/icons/timer.svg',
                                                width: AppIconsSize.s20,
                                                height: AppIconsSize.s20,
                                              ),
                                              const Text(
                                                "5 min read",
                                                style: AppTextStyles.bodyXS,
                                              ),
                                            ],
                                          ),
                                          const SizedBox(height: 10),
                                          Text(
                                              "8 Things You Probably Didn’t Know About Headphones",
                                              maxLines: 2,
                                              style:
                                                  theme.textTheme.bodyMedium),
                                          const SizedBox(height: 10),
                                          Text(
                                            "Owning a headphone could mean a different thing for different people. For some, it acts as a fashion statement. It’s easy to spot these people, the headphones are almost always just hanging around the neck.",
                                            maxLines: 3,
                                            style: AppTextStylesMobile.bodySM
                                                .copyWith(
                                                    color: AppColors.gray9E),
                                          ),
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                              ),
                              const SizedBox(height: AppSpacing.s16),
                              Container(
                                margin: const EdgeInsets.only(top: 10),
                                decoration: BoxDecoration(
                                  color: AppColors.white,
                                  borderRadius: BorderRadius.circular(
                                      AppContainerRadius.radius8),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.black.withOpacity(0.1),
                                      spreadRadius: 1,
                                      blurRadius: 5,
                                      offset: const Offset(0, 3),
                                    ),
                                  ],
                                ),
                                child: Column(
                                  children: [
                                    ClipRRect(
                                      borderRadius: const BorderRadius.vertical(
                                          top: Radius.circular(AppPaddings.p8)),
                                      child: Image.asset(
                                        'assets/images/general/image-5.png',
                                        fit: BoxFit.fill,
                                        width: double.infinity,
                                      ),
                                    ),
                                    Padding(
                                      padding:
                                          const EdgeInsets.all(AppPaddings.p12),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Row(
                                            children: [
                                              SvgPicture.asset(
                                                'assets/images/icons/calendar.svg',
                                                width: AppIconsSize.s20,
                                                height: AppIconsSize.s20,
                                              ),
                                              const Text(
                                                "August , 17 , 2023",
                                                style: AppTextStyles.bodyXS,
                                              ),
                                              const Spacer(),
                                              SvgPicture.asset(
                                                'assets/images/icons/timer.svg',
                                                width: AppIconsSize.s20,
                                                height: AppIconsSize.s20,
                                              ),
                                              const Text(
                                                "4 min read",
                                                style: AppTextStyles.bodyXS,
                                              ),
                                            ],
                                          ),
                                          const SizedBox(height: 10),
                                          Text(
                                            "Analyzing the August 17th Bitcoin Price Drop",
                                            style: theme.textTheme.bodyMedium,
                                          ),
                                          const SizedBox(height: 10),
                                          Text(
                                            "On August 17th at 9:30PM UTC, Bitcoin’s price dropped more than 8% in a 10-minute window, to a two-month low of under \$26k. This pulled",
                                            maxLines: 2,
                                            style: AppTextStylesMobile.bodySM
                                                .copyWith(
                                                    color: AppColors.gray9E),
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
                        const SizedBox(height: 20),
                        SizedBox(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  SvgPicture.asset(
                                    'assets/images/icons/desktop-star.svg',
                                    width: AppIconsSize.s24,
                                    height: AppIconsSize.s24,
                                  ),
                                  const SizedBox(width: AppSpacing.s8),
                                  const Text("Latest and Greatest Tech",
                                      style: AppTextStylesMobile.h4),
                                ],
                              ),
                              const SizedBox(height: AppSpacing.s16),
                              Row(
                                children: [
                                  SvgPicture.asset(
                                    'assets/images/icons/guarentee.svg',
                                    width: AppIconsSize.s24,
                                    height: AppIconsSize.s24,
                                  ),
                                  const SizedBox(width: AppSpacing.s8),
                                  const Text("Guarantee",
                                      style: AppTextStylesMobile.h4),
                                ],
                              ),
                              const SizedBox(height: AppSpacing.s16),
                              Row(
                                children: [
                                  SvgPicture.asset(
                                    'assets/images/icons/free-shipping.svg',
                                    width: AppIconsSize.s24,
                                    height: AppIconsSize.s24,
                                  ),
                                  const SizedBox(width: AppSpacing.s8),
                                  const Text("Free Shipping over 1000\$",
                                      style: AppTextStylesMobile.h4),
                                ],
                              ),
                              const SizedBox(height: AppSpacing.s16),
                              Row(
                                children: [
                                  SvgPicture.asset(
                                    'assets/images/icons/support-time.svg',
                                    width: AppIconsSize.s24,
                                    height: AppIconsSize.s24,
                                  ),
                                  const SizedBox(width: AppSpacing.s8),
                                  const Text("24/7 Support",
                                      style: AppTextStylesMobile.h4),
                                ],
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 20),
                      ],
                    ),
                  ),
                  const FooterMobile()
                ],
              ),
            ),
            Positioned(
                bottom: 320,
                right: AppPaddings.p24,
                child: CustomIconButton(
                  onPress: () {},
                  icon: SvgPicture.asset(
                      "assets/images/icons/arrow-circle-up.svg"),
                )),
                 if (_isProductsMenuOpen) ProductsMenu(),
            if (ref.watch(accountMenuNotifierProvider)) AccountMenu(),
            if (ref.watch(cartNotifierProvider)) CartMobile(),
          ],
        ));
  }
}
