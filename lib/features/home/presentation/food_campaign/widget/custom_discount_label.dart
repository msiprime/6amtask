import 'dart:math' as math;

import 'package:flutter/material.dart';

class CustomDiscountLabel extends StatelessWidget {
  final String discount;
  final Color backgroundColor;
  final Color textColor;

  const CustomDiscountLabel({
    super.key,
    required this.discount,
    this.backgroundColor = Colors.green,
    this.textColor = Colors.white,
  });

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      size: const Size(60, 25),
      painter: DiscountPainter(
        discount: discount,
        backgroundColor: backgroundColor,
        textColor: textColor,
      ),
    );
  }
}

class DiscountPainter extends CustomPainter {
  final String discount;
  final Color backgroundColor;
  final Color textColor;

  DiscountPainter({
    required this.discount,
    required this.backgroundColor,
    required this.textColor,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final double radius = size.height * 0.5;

    final Paint paint = Paint()
      ..color = backgroundColor
      ..style = PaintingStyle.fill;

    final Path path = Path();
    path.moveTo(0, 0);
    path.lineTo(size.width - radius, 0);
    path.arcTo(
      Rect.fromCircle(
          center: Offset(size.width - radius, size.height / 2), radius: radius),
      -math.pi / 2,
      math.pi,
      false,
    );
    path.lineTo(0, size.height);
    path.close();

    canvas.drawPath(path, paint);

    final TextStyle textStyle = TextStyle(
      color: textColor,
      fontSize: 12,
      fontWeight: FontWeight.bold,
    );

    final TextPainter textPainter = TextPainter(
      text: TextSpan(text: "$discount% off", style: textStyle),
      textDirection: TextDirection.ltr,
    );
    textPainter.layout();

    final double xPos = (size.width - textPainter.width - radius * 0.4) / 2;
    final double yPos = (size.height - textPainter.height) / 2;

    textPainter.paint(canvas, Offset(xPos, yPos));
  }

  @override
  bool shouldRepaint(covariant DiscountPainter oldDelegate) {
    return oldDelegate.discount != discount ||
        oldDelegate.backgroundColor != backgroundColor ||
        oldDelegate.textColor != textColor;
  }
}
