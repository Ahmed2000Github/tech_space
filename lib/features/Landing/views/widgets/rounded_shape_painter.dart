import 'package:flutter/material.dart';

class RoundedShapePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Color(0xFFFF6951)
      ..style = PaintingStyle.fill;

    final rect = Rect.fromLTWH(0, 0, size.width, size.height);
    final path = getPath(rect);

    canvas.drawPath(path, paint);
  }

  Path getPath(Rect rect) {
    final radius = rect.height /1.8;
    return Path()
      ..moveTo(rect.left + radius, rect.top)
      ..arcToPoint(Offset(rect.left + radius, rect.bottom), radius: Radius.circular(radius), clockwise: false)
      ..lineTo(rect.right, rect.bottom)
      ..lineTo(rect.right, rect.top)
      ..lineTo(rect.left + radius, rect.top)
      ..close();
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}