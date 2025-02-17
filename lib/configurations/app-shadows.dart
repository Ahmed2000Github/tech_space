import 'package:flutter/material.dart';

class AppShadows {
  static const List<BoxShadow> primaryShadow = [
    BoxShadow(
      color: Color(0xFF),
      spreadRadius: 1,
      blurRadius: 10,
      offset: Offset(-2, 2),
    ),
  ];
  static const List<BoxShadow> secondaryShadow = [
    BoxShadow(
      color: Color(0xFF),
      spreadRadius: 1,
      blurRadius: 10,
      offset: Offset(-2, 2),
    ),
  ];
  static const List<BoxShadow> tertiaryShadow = [
    BoxShadow(
      color: Color(0x26171717),
      spreadRadius: -1,
      blurRadius: 10,
      offset: Offset(-2, 2),
    ),
  ];

}