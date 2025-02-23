// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:tech_space/configurations/app-colors.dart';

class Link extends StatefulWidget {
  Color? color;
  final String text;
  TextStyle? style;
  void Function() onPressed;

  Link({
    Key? key,
    this.color,
    required this.text,
    this.style,
    required this.onPressed,
  }) : super(key: key);

  @override
  State<Link> createState() => _LinkState();
}

class _LinkState extends State<Link> {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return GestureDetector(
      onTap: widget.onPressed,
      child: MouseRegion(
          cursor: SystemMouseCursors.click,
          child: Text(
            widget.text,
            style: (widget.style ?? theme.textTheme.headlineLarge)!
                .copyWith(color: widget.color ?? theme.primaryColor),
          )),
    );
  }
}
