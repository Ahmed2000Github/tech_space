// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:tech_space/configurations/app-colors.dart';
import 'package:tech_space/configurations/app-icons-size.dart';

import 'package:tech_space/configurations/app-paddings.dart';
import 'package:tech_space/features/Landing/providers/account_menu_notifier.dart';

class AccountMenu extends ConsumerStatefulWidget {
  AccountMenu({Key? key}) : super(key: key);

  @override
  ConsumerState<AccountMenu> createState() => _AccountMenuState();
}

class _AccountMenuState extends ConsumerState<AccountMenu>
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
    return Container(
      height: height,
      color: Colors.black.withOpacity(.5),
      child: Stack(
        children: [
          AnimatedBuilder(
              animation: _controller,
              builder: (context, child) {
                return Positioned(
                  top: _topPositionAnimation.value,
                  right: AppPaddings.p108,
                  child: MouseRegion(
                    onEnter: (event) {
                      // ref.read(accountMenuNotifierProvider.notifier).toggle();
                    },
                    onExit: (event) {
                      ref.read(accountMenuNotifierProvider.notifier).toggle();
                    },
                    child: Container(
                      height: 270,
                      width: 280,
                      color: Colors.white,
                      child: Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(AppPaddings.p16),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                generateItem(
                                    "Jimmy Smith", "profile-circle", () {},
                                    showEmail: true),
                                generateItem("Orders", "bag-2", () {}),
                                generateItem("Wish List", "heart", () {}),
                                generateItem(
                                    "Payments", "dollar-circle", () {}),
                                generateItem("Log out", "logout", () {}),
                              ],
                            ),
                          ),
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

  generateItem(String title, String icon, void Function() action,
      {bool showEmail = false}) {
    final theme = Theme.of(context);
    return Padding(
      padding: const EdgeInsets.only(top: AppPaddings.p8),
      child: StatefulBuilder(builder: (context, setInnerState) {
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
            crossAxisAlignment: showEmail?CrossAxisAlignment.start: CrossAxisAlignment.center,
            children: [
              SvgPicture.asset(
                "assets/images/icons/$icon.svg",
                width: AppIconsSize.s24,
                height: AppIconsSize.s24,
                color: !_isActive ? null : AppColors.primary,
              ),
              const SizedBox(width: 8),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: theme.textTheme.bodyLarge!.copyWith(
                      color: !_isActive ? null : AppColors.primary,
                    ),
                  ),
                  if (showEmail) SizedBox(height: AppPaddings.p8),
                  if (showEmail)
                    Text(
                      "Jimmy.smith1996@gmail.com",
                      style: theme.textTheme.bodySmall!.copyWith(
                        color: !_isActive ? null : AppColors.primary,
                      ),
                    ),
                ],
              ),
            ],
          ),
        );
      }),
    );
  }
}
