import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:tech_space/configurations/app-colors.dart';
import 'package:tech_space/configurations/app-paddings.dart';
import 'package:tech_space/features/Landing/views/widgets/custom_icon_button.dart';

class Footer extends StatelessWidget {
  const Footer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: AppPaddings.p108),
          color: AppColors.primary900,
          height: 244,
          child: Stack(
            children: [
              Positioned(
                bottom: 0,
                  child: Image.asset("assets/images/shapes/shape-4.png")),
              Column(
                children: [
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(top: AppPaddings.p32),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('Company',
                                  style: Theme.of(context)
                                      .textTheme
                                      .titleSmall
                                      ?.copyWith(color: Colors.white)),
                              const SizedBox(height: AppPaddings.p8),
                              Text('About us',
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyMedium
                                      ?.copyWith(color: AppColors.grayCB)),
                              const SizedBox(height: AppPaddings.p8),
                              Text('How it works?',
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyMedium
                                      ?.copyWith(color: AppColors.grayCB)),
                              const SizedBox(height: AppPaddings.p8),
                              Text('Our promises',
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyMedium
                                      ?.copyWith(color: AppColors.grayCB)),
                            ],
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('Info',
                                  style: Theme.of(context)
                                      .textTheme
                                      .titleSmall
                                      ?.copyWith(color: Colors.white)),
                              const SizedBox(height: AppPaddings.p8),
                              Text('Blog',
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyMedium
                                      ?.copyWith(color: AppColors.grayCB)),
                              const SizedBox(height: AppPaddings.p8),
                              Text('Returns',
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyMedium
                                      ?.copyWith(color: AppColors.grayCB)),
                              const SizedBox(height: AppPaddings.p8),
                              Text('FAQ',
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyMedium
                                      ?.copyWith(color: AppColors.grayCB)),
                              const SizedBox(height: AppPaddings.p8),
                              Text('Order status',
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyMedium
                                      ?.copyWith(color: AppColors.grayCB)),
                            ],
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('Contact us',
                                  style: Theme.of(context)
                                      .textTheme
                                      .titleSmall
                                      ?.copyWith(color: Colors.white)),
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
                                          ?.copyWith(color: AppColors.grayCB)),
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
                                          ?.copyWith(color: AppColors.grayCB)),
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
                                          ?.copyWith(color: AppColors.grayCB)),
                                ],
                              ),
                            ],
                          ),
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
                                width: 288,
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
                                      borderSide:
                                          BorderSide(color: Colors.white),
                                    ),
                                    enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(8),
                                      borderSide:
                                          BorderSide(color: Colors.white),
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
                              Row(
                                children: [
                                  IconButton(
                                      onPressed: () {},
                                      padding: EdgeInsets.all(0),
                                      icon: SvgPicture.asset(
                                        'assets/images/icons/facebook.svg',
                                      )),
                                  IconButton(
                                      onPressed: () {},
                                      padding: EdgeInsets.all(0),
                                      icon: SvgPicture.asset(
                                        'assets/images/icons/twitter.svg',
                                      )),
                                  IconButton(
                                      onPressed: () {},
                                      padding: EdgeInsets.all(0),
                                      icon: SvgPicture.asset(
                                        'assets/images/icons/instagram.svg',
                                      )),
                                  IconButton(
                                      onPressed: () {},
                                      padding: EdgeInsets.all(0),
                                      icon: SvgPicture.asset(
                                        'assets/images/icons/youtube.svg',
                                      )),
                                ],
                              )
                            ],
                          ),
                          Column(
                            children: [
                              CustomIconButton(
                                onPress: () {},
                                icon: SvgPicture.asset(
                                    "assets/images/icons/message-question.svg"),
                              ),
                              
                            ],
                          )
             
                        ],
                      ),
                    ),
                  ),
                  Row(
                    children: [
                      Image.asset("assets/images/general/paypal.png"),
                      const SizedBox(width: AppPaddings.p4),
                      Image.asset("assets/images/general/american-express.png"),
                      const SizedBox(width: AppPaddings.p4),
                      Image.asset("assets/images/general/visa.png"),
                      const SizedBox(width: AppPaddings.p4),
                      Image.asset("assets/images/general/master-card.png")
                    ],
                  ),
                  SizedBox(height: AppPaddings.p4),
                ],
              ),
            ],
          ),
        ),
        Container(
          height: 56,
          padding: const EdgeInsets.symmetric(
              horizontal: AppPaddings.p108, vertical: AppPaddings.p4),
          color: AppColors.primary900,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  SvgPicture.asset(
                    'assets/images/icons/copyright.svg',
                  ),
                  Text(
                    ' 2023 Tech Heim.',
                    style: Theme.of(context)
                        .textTheme
                        .bodyMedium
                        ?.copyWith(color: AppColors.grayCB),
                  ),
                ],
              ),
              Row(
                children: [
                  Text(
                    'Cookie Settings',
                    style: Theme.of(context)
                        .textTheme
                        .bodyMedium
                        ?.copyWith(color: AppColors.grayCB),
                  ),
                  const SizedBox(width: AppPaddings.p48),
                  Text(
                    'Privacy Policy',
                    style: Theme.of(context)
                        .textTheme
                        .bodyMedium
                        ?.copyWith(color: AppColors.grayCB),
                  ),
                  const SizedBox(width: AppPaddings.p48),
                  Text(
                    'Terms and Conditions',
                    style: Theme.of(context)
                        .textTheme
                        .bodyMedium
                        ?.copyWith(color: AppColors.grayCB),
                  ),
                  const SizedBox(width: AppPaddings.p48),
                  Text(
                    'Imprint',
                    style: Theme.of(context)
                        .textTheme
                        .bodyMedium
                        ?.copyWith(color: AppColors.grayCB),
                  ),
                ],
              ),
            ],
          ),
        )
      ],
    );
  }
}
