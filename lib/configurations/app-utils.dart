import 'package:flutter/material.dart';

class AppUtils {
  
static double getTextWidth(String text, TextStyle style, BuildContext context) {
    final textSpan = TextSpan(text: text, style: style);
    final textPainter = TextPainter(
      text: textSpan,
      textDirection:
          TextDirection.ltr, // Set the text direction (left to right)
    );

    textPainter.layout(); // Perform layout to calculate text width

    return textPainter.size.width; // Return the width of the text
  }
}