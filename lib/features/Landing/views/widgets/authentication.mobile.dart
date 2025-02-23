import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/route_manager.dart';
import 'package:tech_space/configurations/app-colors.dart';
import 'package:tech_space/configurations/app-container-radius.dart';
import 'package:tech_space/configurations/app-icons-size.dart';
import 'package:tech_space/configurations/app-paddings.dart';
import 'package:tech_space/configurations/app-spacing.dart';
import 'package:tech_space/configurations/app-text-styles-mobile.dart';
import 'package:tech_space/configurations/app-text-styles.dart';
import 'package:tech_space/core/widgets/link.dart';

class AuthenticationMobile extends StatelessWidget {
  AuthenticationMobile({Key? key}) : super(key: key);
  bool _isFirstPasswordHidden1 = true;
  bool _isFirstPasswordHidden2 = true;
  bool _isCheckBoxActivated = false;
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(onPressed: (){
          Navigator.pop(context);
        }, icon: SvgPicture.asset(
            "assets/images/icons/arrow-left.svg",
            width: AppIconsSize.s20,
            height: AppIconsSize.s20,
          ), ),
      ),
      body: Container(
        // width: 500,
        // height: 580,
        padding: const EdgeInsets.symmetric(
            horizontal: AppPaddings.p24),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(AppContainerRadius.radius4),
        ),
        child: Column(
          children: [
            Text(
              'Tech Heim',
              style: AppTextStylesMobile.h3.copyWith(
                color: AppColors.primary400,
                fontWeight: FontWeight.bold,
              ),
            ),
             const SizedBox(height: AppSpacing.s24),
            Expanded(
              child: DefaultTabController(
                length: 2,
                child: Column(
                  children: [
                    TabBar(
                      labelStyle: AppTextStylesMobile.buttonLG,
                      labelColor: theme.primaryColor,
                      unselectedLabelColor: AppColors.gray71,
                      indicatorSize: TabBarIndicatorSize.tab,
                      indicator: UnderlineTabIndicator(
                        borderSide:
                            BorderSide(width: 2.0, color: theme.primaryColor),
                        // insets: EdgeInsets.symmetric(horizontal: width / 15),
                      ),
                      tabs: const [
                        Tab(
                          text: 'Log in',
                        ),
                        Tab(
                          text: 'Create Account',
                        ),
                      ],
                    ),
                    Expanded(
                      child: TabBarView(
                        children: [
                          getLoginWidget(context),
                          getSignUpWidget(context),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  getLoginWidget(BuildContext context) {
    final theme = Theme.of(context);
    return SingleChildScrollView(
      child: Column(
        children: [
          const SizedBox(height: AppSpacing.s40),
          Text(
            'Log in to Tech Heim',
            style: AppTextStylesMobile.h2,
          ),
          const SizedBox(height: AppSpacing.s24),
          SizedBox(
            height: AppSpacing.s40,
            child: TextFormField(
              decoration: InputDecoration(
                hintText: "E-mail",
                hintStyle:
                    AppTextStylesMobile.bodyMD.copyWith(color: AppColors.gray44),
                enabledBorder: const OutlineInputBorder(
                    borderSide: BorderSide(
                      color: AppColors.gray71,
                    ),
                    borderRadius: BorderRadius.all(
                        Radius.circular(AppContainerRadius.radius8))),
                prefixIcon: Padding(
                  padding: const EdgeInsets.all(AppPaddings.p8),
                  child: SvgPicture.asset(
                    "assets/images/icons/sms.svg",
                    width: AppIconsSize.s20,
                    height: AppIconsSize.s20,
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(height: AppSpacing.s16),
          StatefulBuilder(builder: (context, setInnerState) {
            return SizedBox(
              height: AppSpacing.s40,
              child: TextFormField(
                obscureText: _isFirstPasswordHidden1,
                decoration: InputDecoration(
                  hintText: "Password",
                  hintStyle: AppTextStylesMobile.bodyMD
                      .copyWith(color: AppColors.gray44),
                  enabledBorder: const OutlineInputBorder(
                      borderSide: BorderSide(
                        color: AppColors.gray71,
                      ),
                      borderRadius: BorderRadius.all(
                          Radius.circular(AppContainerRadius.radius8))),
                  prefixIcon: Padding(
                    padding: const EdgeInsets.all(AppPaddings.p8),
                    child: SvgPicture.asset(
                      "assets/images/icons/key.svg",
                      width: AppIconsSize.s20,
                      height: AppIconsSize.s20,
                    ),
                  ),
                  suffixIcon: IconButton(
                      onPressed: () => setInnerState(
                            () => _isFirstPasswordHidden1 =
                                !_isFirstPasswordHidden1,
                          ),
                      icon: Icon(
                        _isFirstPasswordHidden1
                            ? Icons.visibility_off_outlined
                            : Icons.visibility_outlined,
                        color: AppColors.grayB4,
                        weight: 10,
                      )),
                ),
              ),
            );
          }),
          const SizedBox(height: AppSpacing.s24),
          Align(
              alignment: Alignment.centerRight,
              child: Link(
                onPressed: () {},
                text: "Forgot Password ?",
                style: AppTextStylesMobile.bodyMD,
              )),
          const SizedBox(height: AppSpacing.s8),
          StatefulBuilder(builder: (context, setInnerState) {
            return Row(
              children: [
                Checkbox(
                  value: _isCheckBoxActivated,
                  side: const BorderSide(
                    width: 1,
                    color: AppColors.gray50, // // Dynamic border color
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(6), // Set border radius
                    side: const BorderSide(
                        width: 2,
                        color: Colors.blue), // Set border width & color
                  ),
                  onChanged: (bool? value) {
                    setInnerState(
                      () {
                        _isCheckBoxActivated = !_isCheckBoxActivated;
                      },
                    );
                  },
                ),
                Link(
                  onPressed: () {
                    setInnerState(
                      () {
                        _isCheckBoxActivated = !_isCheckBoxActivated;
                      },
                    );
                  },
                  text: 'Keep me logged in',
                  style: AppTextStylesMobile.bodyMD,
                  color: AppColors.gray71,
                ),
              ],
            );
          }),
          const SizedBox(height: AppSpacing.s8),
          buildButton(context, "Log In", () {}),
          const SizedBox(height: AppSpacing.s24),
          Row(
            children: [
              const Expanded(child: Divider(color: AppColors.gray71)),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: AppPaddings.p8),
                child: Text(
                  'Or Log In with',
                  style: AppTextStylesMobile.bodyMD
                      .copyWith(color: AppColors.gray71),
                ),
              ),
              const Expanded(child: Divider(color: AppColors.gray71)),
            ],
          ),
          const SizedBox(height: AppSpacing.s24),
          Row(
            children: [
              buildAuthButton(context, "Google", "google", () {}),
              const SizedBox(width: AppSpacing.s24),
              buildAuthButton(context, "Facebook", "facebook-2", () {}),
            ],
          ),
          const SizedBox(height: AppSpacing.s16),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Don’t have an account ? ",
                style: AppTextStylesMobile.bodyMD
                    .copyWith(color: AppColors.gray71),
              ),
              Link(
                onPressed: () {},
                text: "Sign up",
                style: AppTextStylesMobile.bodyMD,
                color: theme.primaryColor,
              ),
            ],
          ),
        ],
      ),
    );
  }

  getSignUpWidget(BuildContext context) {
    final theme = Theme.of(context);
    return SingleChildScrollView(
      child: Column(
        children: [
          const SizedBox(height: AppSpacing.s40),
          Text(
            'Log in to Tech Heim',
            style: AppTextStylesMobile.h2,
          ),
          const SizedBox(height: AppSpacing.s24),
          SizedBox(
            height: AppSpacing.s40,
            child: TextFormField(
              decoration: InputDecoration(
                hintText: "Full Name",
                hintStyle:
                    AppTextStylesMobile.bodyMD.copyWith(color: AppColors.gray44),
                enabledBorder: const OutlineInputBorder(
                    borderSide: BorderSide(
                      color: AppColors.gray71,
                    ),
                    borderRadius: BorderRadius.all(
                        Radius.circular(AppContainerRadius.radius8))),
                prefixIcon: Padding(
                  padding: const EdgeInsets.all(AppPaddings.p8),
                  child: SvgPicture.asset(
                    "assets/images/icons/user.svg",
                    width: AppIconsSize.s20,
                    height: AppIconsSize.s20,
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(height: AppSpacing.s16),
          SizedBox(
            height: AppSpacing.s40,
            child: TextFormField(
              decoration: InputDecoration(
                hintText: "E-mail",
                hintStyle:
                    AppTextStylesMobile.bodyMD.copyWith(color: AppColors.gray44),
                enabledBorder: const OutlineInputBorder(
                    borderSide: BorderSide(
                      color: AppColors.gray71,
                    ),
                    borderRadius: BorderRadius.all(
                        Radius.circular(AppContainerRadius.radius8))),
                prefixIcon: Padding(
                  padding: const EdgeInsets.all(AppPaddings.p8),
                  child: SvgPicture.asset(
                    "assets/images/icons/sms.svg",
                    width: AppIconsSize.s20,
                    height: AppIconsSize.s20,
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(height: AppSpacing.s16),
          StatefulBuilder(builder: (context, setInnerState) {
            return SizedBox(
               height: AppSpacing.s40,
              child: TextFormField(
                obscureText: _isFirstPasswordHidden2,
                decoration: InputDecoration(
                  hintText: "Password",
                  hintStyle: AppTextStylesMobile.bodyMD
                      .copyWith(color: AppColors.gray44),
                  enabledBorder: const OutlineInputBorder(
                      borderSide: BorderSide(
                        color: AppColors.gray71,
                      ),
                      borderRadius: BorderRadius.all(
                          Radius.circular(AppContainerRadius.radius8))),
                  prefixIcon: Padding(
                    padding: const EdgeInsets.all(AppPaddings.p8),
                    child: SvgPicture.asset(
                      "assets/images/icons/key.svg",
                      width: AppIconsSize.s20,
                      height: AppIconsSize.s20,
                    ),
                  ),
                  suffixIcon: IconButton(
                      onPressed: () => setInnerState(
                            () => _isFirstPasswordHidden2 =
                                !_isFirstPasswordHidden2,
                          ),
                      icon: Icon(
                        _isFirstPasswordHidden2
                            ? Icons.visibility_off_outlined
                            : Icons.visibility_outlined,
                        color: AppColors.grayB4,
                        weight: 10,
                      )),
                ),
              ),
            );
          }),
          const SizedBox(height: AppSpacing.s24),
          StatefulBuilder(builder: (context, setInnerState) {
            return Row(
              children: [
                Checkbox(
                  value: _isCheckBoxActivated,
                  side: const BorderSide(
                    width: 1,
                    color: AppColors.gray50, // // Dynamic border color
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(6), // Set border radius
                    side: const BorderSide(
                        width: 2,
                        color: Colors.blue), // Set border width & color
                  ),
                  onChanged: (bool? value) {
                    setInnerState(
                      () {
                        _isCheckBoxActivated = !_isCheckBoxActivated;
                      },
                    );
                  },
                ),
                Link(
                  onPressed: () {
                    setInnerState(
                      () {
                        _isCheckBoxActivated = !_isCheckBoxActivated;
                      },
                    );
                  },
                  text: 'I agree to all ',
                  style: theme.textTheme.bodySmall,
                  color: AppColors.gray71,
                ),
                Link(
                  onPressed: () {},
                  text: 'Terms & Conditions',
                  style: AppTextStylesMobile.bodyMD.copyWith(
                    decoration: TextDecoration.underline,
                    decorationColor: AppColors.primary,
                  ),
                ),
              ],
            );
          }),
          const SizedBox(height: AppSpacing.s24),
          buildButton(context, "Create Account", () {}),
          const SizedBox(height: AppSpacing.s24),
          Row(
            children: [
              const Expanded(child: Divider(color: AppColors.gray71)),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: AppPaddings.p8),
                child: Text(
                  'Or Sign Up with',
                  style: AppTextStylesMobile.bodyMD
                      .copyWith(color: AppColors.gray71),
                ),
              ),
              const Expanded(child: Divider(color: AppColors.gray71)),
            ],
          ),
          const SizedBox(height: AppSpacing.s24),
          Row(
            children: [
              buildAuthButton(context, "Google", "google", () {}),
              const SizedBox(width: AppSpacing.s24),
              buildAuthButton(context, "Facebook", "facebook-2", () {}),
            ],
          ),
          const SizedBox(height: AppSpacing.s24),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Already have an account ? ",
                style: AppTextStylesMobile.bodyMD
                    .copyWith(color: AppColors.gray71),
              ),
              Link(
                onPressed: () {},
                text: "Sign in",
                style: theme.textTheme.bodySmall,
                color: theme.primaryColor,
              ),
            ],
          ),
        ],
      ),
    );
  }

  buildButton(BuildContext context, String text, void Function() onPressed) {
    final theme = Theme.of(context);
    return GestureDetector(
      onTap: onPressed,
      child: MouseRegion(
        cursor: SystemMouseCursors.click,
        child: Container(
          width: double.infinity,
          alignment: Alignment.center,
          padding: const EdgeInsets.all(AppPaddings.p8),
          decoration: BoxDecoration(
            color: AppColors.primary,
            borderRadius: BorderRadius.circular(AppContainerRadius.radius8),
          ),
          child: Text(text,
              style: AppTextStylesMobile.buttonLG.copyWith(
                color: Colors.white,
              )),
        ),
      ),
    );
  }

  buildAuthButton(BuildContext context, String text, String icon,
      void Function() onPressed) {
    final theme = Theme.of(context);
    return Flexible(
      flex: 1,
      child: GestureDetector(
        onTap: onPressed,
        child: MouseRegion(
          cursor: SystemMouseCursors.click,
          child: Container(
            alignment: Alignment.center,
            padding: const EdgeInsets.all(AppPaddings.p8),
            decoration: BoxDecoration(
              color: AppColors.white,
              border: Border.all(
                color: AppColors.primary,
                width: 2,
              ),
              borderRadius: BorderRadius.circular(AppContainerRadius.radius8),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SvgPicture.asset(
                  "assets/images/icons/$icon.svg",
                  width: AppIconsSize.s20,
                  height: AppIconsSize.s20,
                ),
                const SizedBox(width: AppSpacing.s8),
                Text(text,
                    style: AppTextStylesMobile.buttonLG.copyWith(
                      color: AppColors.primary,
                    )),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
