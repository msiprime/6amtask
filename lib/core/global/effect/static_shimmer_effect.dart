import 'package:skeletonizer/skeletonizer.dart';

/// A static shimmer effect that does not animate
class StaticShimmerEffect extends PaintingEffect {
  final Color baseColor;
  final Color highlightColor;

  final AlignmentGeometry begin;
  final AlignmentGeometry end;

  const StaticShimmerEffect({
    this.baseColor = const Color(0xFFEBEBF4),
    this.highlightColor = const Color(0xFFF4F4F4),
    this.begin = const AlignmentDirectional(-1.0, 0.3),
    this.end = const AlignmentDirectional(1.0, 0.3),
  }) : super(duration: Duration.zero); // No animation

  @override
  Paint createPaint(double t, Rect rect, TextDirection? textDirection) {
    return Paint()
      ..shader = LinearGradient(
        colors: [baseColor, baseColor, baseColor],
        stops: const [0.1, 0.3, 0.4],
        begin: begin,
        end: end,
        tileMode: TileMode.clamp,
      ).createShader(rect, textDirection: textDirection);
  }

  @override
  PaintingEffect lerp(PaintingEffect? other, double t) {
    if (other is StaticShimmerEffect) {
      return StaticShimmerEffect(
        baseColor: Color.lerp(baseColor, other.baseColor, t)!,
        highlightColor: Color.lerp(highlightColor, other.highlightColor, t)!,
        begin: AlignmentGeometry.lerp(begin, other.begin, t)!,
        end: AlignmentGeometry.lerp(end, other.end, t)!,
      );
    }
    return this;
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is StaticShimmerEffect &&
          baseColor == other.baseColor &&
          highlightColor == other.highlightColor &&
          begin == other.begin &&
          end == other.end;

  @override
  int get hashCode =>
      baseColor.hashCode ^
      highlightColor.hashCode ^
      begin.hashCode ^
      end.hashCode;
}
