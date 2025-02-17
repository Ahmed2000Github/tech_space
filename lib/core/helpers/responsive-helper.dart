import 'package:flutter/material.dart';

class ResponsiveHelper extends StatelessWidget {
  final Widget mobile;
  final Widget? tablet;
  final Widget desktop;

  const ResponsiveHelper({
    required this.mobile,
    Widget? tablet,
    required this.desktop,
    Key? key,
  })  : tablet = tablet ?? mobile, // Default tablet to mobile if not provided
        super(key: key);

  static bool isMobile(BuildContext context) =>
      MediaQuery.of(context).size.width < 600;

  static bool isTablet(BuildContext context) =>
      MediaQuery.of(context).size.width >= 600 &&
      MediaQuery.of(context).size.width < 1024;

  static bool isDesktop(BuildContext context) =>
      MediaQuery.of(context).size.width >= 1024;

  @override
  Widget build(BuildContext context) {
    if (isDesktop(context)) {
      return desktop;
    } else if (isTablet(context)) {
      return tablet?? desktop;
    } else {
      return mobile;
    }
  }
}
