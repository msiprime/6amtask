import 'package:flutter/material.dart';

typedef ThumbnailErrorBuilder = Widget Function(
  BuildContext context,
  Object error,
  StackTrace? stackTrace, {
  double? height,
  double? width,
  BorderRadiusGeometry? borderRadius,
});

class ThumbnailError extends StatelessWidget {
  const ThumbnailError({
    required this.error,
    super.key,
    this.stackTrace,
    this.width,
    this.height,
    this.borderRadius,
    this.fit,
  });

  final double? width;

  final double? height;

  final BorderRadiusGeometry? borderRadius;

  final BoxFit? fit;

  final Object error;

  final StackTrace? stackTrace;

  @override
  Widget build(BuildContext context) {
    if (borderRadius == null) {
      return Image.asset(
        'assets/images/placeholder.png',
        width: width,
        height: height,
        fit: fit,
      );
    }
    return SizedBox(
      height: height,
      width: width,
      child: DecoratedBox(
        decoration: BoxDecoration(
          borderRadius: borderRadius,
          image: DecorationImage(
            fit: fit,
            filterQuality: FilterQuality.high,
            image: AssetImage('assets/images/placeholder.png'),
          ),
        ),
      ),
    );
  }
}
