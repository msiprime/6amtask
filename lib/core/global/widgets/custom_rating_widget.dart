import 'package:flutter/material.dart';

/// Custom Rating Maker Widget,
/// It takes the rating as a double value (4.1), (3.2) etc
/// and the filledColor and emptyColor as the color of the stars
/// used it to reduce package and dependency

class RatingStars extends StatelessWidget {
  final double rating;
  final Color filledColor;
  final Color emptyColor;
  final double size;

  const RatingStars({
    super.key,
    required this.rating,
    this.filledColor = Colors.green,
    this.emptyColor = Colors.grey,
    this.size = 24.0,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: List.generate(5, (index) {
        double fillAmount = (rating - index).clamp(0, 1);

        return Stack(
          children: [
            Icon(
              Icons.star,
              size: size,
              color: emptyColor,
            ),
            ClipRect(
              clipper: _StarClipper(fillAmount),
              child: Icon(
                Icons.star,
                size: size,
                color: filledColor,
              ),
            ),
          ],
        );
      }),
    );
  }
}

class _StarClipper extends CustomClipper<Rect> {
  final double fillPercentage;

  _StarClipper(this.fillPercentage);

  @override
  Rect getClip(Size size) {
    return Rect.fromLTWH(0, 0, size.width * fillPercentage, size.height);
  }

  @override
  bool shouldReclip(_StarClipper oldClipper) {
    return oldClipper.fillPercentage != fillPercentage;
  }
}
