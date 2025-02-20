// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:tech_space/configurations/app-colors.dart';

class Link extends StatefulWidget {
  Color? color;
  final String text;
  TextStyle? style;

  Link({
    super.key,
    this.color,
    required this.text,
    this.style,
  });

  @override
  State<Link> createState() => _LinkState();
}

class _LinkState extends State<Link> {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return MouseRegion(
        cursor: SystemMouseCursors.click,
        child: Text(
          widget.text,
          style: (widget.style ?? theme.textTheme.headlineLarge)!
              .copyWith(color: widget.color ?? theme.primaryColor),
        ));
  }
}
