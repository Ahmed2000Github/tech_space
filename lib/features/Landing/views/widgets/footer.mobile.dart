import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:tech_space/configurations/app-colors.dart';
import 'package:tech_space/configurations/app-paddings.dart';
import 'package:tech_space/core/widgets/link.dart';
import 'package:tech_space/features/Landing/views/widgets/custom_icon_button.dart';

class FooterMobile extends StatelessWidget {
  const FooterMobile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return Column(
      children: [
        Container(
          
          color: AppColors.primary900,
          child: Stack(
            children: [
              Positioned(
                  bottom: 0,
                  left: 0,
                  child: Image.asset(
                    "assets/images/shapes/shape-5.png",
                    width: (width - 2 * AppPaddings.p24),
                    fit: BoxFit.fill,
                  )),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: AppPaddings.p24),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Padding(
                      padding:
                          const EdgeInsets.symmetric(vertical: AppPaddings.p16),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Align(
                            alignment: Alignment.centerLeft,
                            child: CustomIconButton(
                              onPress: () {},
                              icon: SvgPicture.asset(
                                  "assets/images/icons/message-question.svg"),
                            ),
                          ),
                          const SizedBox(height: AppPaddings.p12),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('Sign up for News and updates',
                                  style: Theme.of(context)
                                      .textTheme
                                      .titleSmall
                                      ?.copyWith(color: Colors.white)),
                              const SizedBox(height: AppPaddings.p12),
                              SizedBox(
                                height: 48,
                                width: width,
                                child: TextFormField(
                                  cursorColor: AppColors.primary,
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyMedium
                                      ?.copyWith(color: AppColors.white),
                                  decoration: InputDecoration(
                                    hintText: 'E-mail Address',
                                    hintStyle: Theme.of(context)
                                        .textTheme
                                        .bodyMedium
                                        ?.copyWith(color: AppColors.grayCB),
                                    filled: true,
                                    fillColor: Colors.transparent,
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(8),
                                      borderSide: BorderSide(color: Colors.white),
                                    ),
                                    enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(8),
                                      borderSide: BorderSide(color: Colors.white),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(8),
                                      borderSide:
                                          BorderSide(color: AppColors.primary),
                                    ),
                                    prefixIcon: Padding(
                                      padding: const EdgeInsets.all(12.0),
                                      child: SvgPicture.asset(
                                          'assets/images/icons/profile.svg',
                                          color: AppColors.grayCB),
                                    ),
                                    suffixIcon: Padding(
                                      padding: const EdgeInsets.all(12.0),
                                      child: IconButton(
                                          onPressed: () {},
                                          padding: EdgeInsets.all(0),
                                          icon: SvgPicture.asset(
                                              'assets/images/icons/arrow-circle-right.svg',
                                              color: AppColors.grayCB)),
                                    ),
                                  ),
                                ),
                              ),
                              const SizedBox(height: AppPaddings.p8),
                            ],
                          ),
                          Theme(
                            data: Theme.of(context)
                                .copyWith(dividerColor: Colors.transparent),
                            child: ExpansionTile(
                                trailing: SvgPicture.asset(
                                    "assets/images/icons/arrow-circle-down.svg"),
                                title: Text('Company',
                                    style: Theme.of(context)
                                        .textTheme
                                        .titleSmall
                                        ?.copyWith(color: Colors.white)),
                                children: [
                                  Container(
                                    padding: EdgeInsets.symmetric(
                                        horizontal: AppPaddings.p16),
                                    alignment: Alignment.centerLeft,
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        const SizedBox(height: AppPaddings.p8),
                                        Link(
                                            onPressed: () {},
                                            text: 'About us',
                                            color: AppColors.grayCB,
                                            style: Theme.of(context)
                                                .textTheme
                                                .bodyMedium
                                                ?.copyWith(
                                                    color: AppColors.grayCB)),
                                        const SizedBox(height: AppPaddings.p8),
                                        Link(
                                            onPressed: () {},
                                            text: 'How it works?',
                                            color: AppColors.grayCB,
                                            style: Theme.of(context)
                                                .textTheme
                                                .bodyMedium
                                                ?.copyWith(
                                                    color: AppColors.grayCB)),
                                        const SizedBox(height: AppPaddings.p8),
                                        Link(
                                            onPressed: () {},
                                            text: 'Our promises',
                                            color: AppColors.grayCB,
                                            style: Theme.of(context)
                                                .textTheme
                                                .bodyMedium
                                                ?.copyWith(
                                                    color: AppColors.grayCB)),
                                      ],
                                    ),
                                  )
                                ]),
                          ),
                          Theme(
                            data: Theme.of(context)
                                .copyWith(dividerColor: Colors.transparent),
                            child: ExpansionTile(
                                trailing: SvgPicture.asset(
                                    "assets/images/icons/arrow-circle-down.svg"),
                                title: Text('Info',
                                    style: Theme.of(context)
                                        .textTheme
                                        .titleSmall
                                        ?.copyWith(color: Colors.white)),
                                children: [
                                  Container(
                                    padding: EdgeInsets.symmetric(
                                        horizontal: AppPaddings.p16),
                                    alignment: Alignment.centerLeft,
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        const SizedBox(height: AppPaddings.p8),
                                        Text('Blog',
                                            style: Theme.of(context)
                                                .textTheme
                                                .bodyMedium
                                                ?.copyWith(
                                                    color: AppColors.grayCB)),
                                        const SizedBox(height: AppPaddings.p8),
                                        Text('Returns',
                                            style: Theme.of(context)
                                                .textTheme
                                                .bodyMedium
                                                ?.copyWith(
                                                    color: AppColors.grayCB)),
                                        const SizedBox(height: AppPaddings.p8),
                                        Text('FAQ',
                                            style: Theme.of(context)
                                                .textTheme
                                                .bodyMedium
                                                ?.copyWith(
                                                    color: AppColors.grayCB)),
                                        const SizedBox(height: AppPaddings.p8),
                                        Text('Order status',
                                            style: Theme.of(context)
                                                .textTheme
                                                .bodyMedium
                                                ?.copyWith(
                                                    color: AppColors.grayCB)),
                                      ],
                                    ),
                                  )
                                ]),
                          ),
                          Theme(
                            data: Theme.of(context)
                                .copyWith(dividerColor: Colors.transparent),
                            child: ExpansionTile(
                                trailing: SvgPicture.asset(
                                    "assets/images/icons/arrow-circle-down.svg"),
                                title: Text('Contact us',
                                    style: Theme.of(context)
                                        .textTheme
                                        .titleSmall
                                        ?.copyWith(color: Colors.white)),
                                children: [
                                  Container(
                                    padding: EdgeInsets.symmetric(
                                        horizontal: AppPaddings.p16),
                                    alignment: Alignment.centerLeft,
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        const SizedBox(height: AppPaddings.p8),
                                        Row(
                                          children: [
                                            SvgPicture.asset(
                                                'assets/images/icons/location.svg',
                                                color: AppColors.grayCB),
                                            const SizedBox(width: 8),
                                            Text('123 Main Street, Anytown, USA',
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .bodyMedium
                                                    ?.copyWith(
                                                        color: AppColors.grayCB)),
                                          ],
                                        ),
                                        const SizedBox(height: AppPaddings.p8),
                                        Row(
                                          children: [
                                            SvgPicture.asset(
                                                'assets/images/icons/call-calling.svg',
                                                color: AppColors.grayCB),
                                            const SizedBox(width: 8),
                                            Text('+1 (555) 123-4567',
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .bodyMedium
                                                    ?.copyWith(
                                                        color: AppColors.grayCB)),
                                          ],
                                        ),
                                        const SizedBox(height: AppPaddings.p8),
                                        Row(
                                          children: [
                                            SvgPicture.asset(
                                                'assets/images/icons/sms-edit.svg',
                                                color: AppColors.grayCB),
                                            const SizedBox(width: 8),
                                            Text('TechHeimSupport@gmail.com',
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .bodyMedium
                                                    ?.copyWith(
                                                        color: AppColors.grayCB)),
                                          ],
                                        ),
                                      ],
                                    ),
                                  )
                                ]),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: AppPaddings.p4),
                  ],
                ),
              ),
            ],
          ),
        ),
        Container(
          height: 56,
          width: width,
          padding: const EdgeInsets.symmetric(
              horizontal: AppPaddings.p24, vertical: AppPaddings.p4),
          color: AppColors.primary900,
          child: Flex(
            direction: Axis.horizontal,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Flexible(
                  flex: 1,
                  child: Image.asset("assets/images/general/paypal.png")),
              Flexible(
                  flex: 1,
                  child: Image.asset(
                      "assets/images/general/american-express.png")),
              Flexible(
                  flex: 1,
                  child: Image.asset("assets/images/general/visa.png")),
              
              Flexible(
                  flex: 1,
                  child: Image.asset("assets/images/general/master-card.png")),
                  Flexible(flex: 3, child: SizedBox(width: AppPaddings.p4)),
              Flexible(
                flex: 1,
                child: IconButton(
                    onPressed: () {},
                    padding: EdgeInsets.all(0),
                    icon: SvgPicture.asset(
                      'assets/images/icons/facebook-1.svg',
                    )),
              ),
              Flexible(
                flex: 1,
                child: IconButton(
                    onPressed: () {},
                    padding: EdgeInsets.all(0),
                    icon: SvgPicture.asset(
                      'assets/images/icons/twitter-1.svg',
                    )),
              ),
              Flexible(
                flex: 1,
                child: IconButton(
                    onPressed: () {},
                    padding: EdgeInsets.all(0),
                    icon: SvgPicture.asset(
                      'assets/images/icons/instagram-1.svg',
                    )),
              ),
              Flexible(
                flex: 1,
                child: IconButton(
                    onPressed: () {},
                    padding: EdgeInsets.all(0),
                    icon: SvgPicture.asset(
                      'assets/images/icons/youtube-1.svg',
                    )),
              ),
            ],
          ),
        )
      ],
    );
  }
}
