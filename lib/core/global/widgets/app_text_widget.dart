import 'package:flutter/material.dart';

/// Enum representing different text styles from Flutter's [TextTheme].
/// Each variant corresponds to a specific text size, height, weight, and spacing.
enum AppTextStyle {
  /// **Size:** 57sp, **Height:** 64, **Weight:** Regular (w400), **Spacing:** -0.25
  displayLarge,

  /// **Size:** 45sp, **Height:** 52, **Weight:** Regular (w400), **Spacing:** 0.0
  displayMedium,

  /// **Size:** 36sp, **Height:** 44, **Weight:** Regular (w400), **Spacing:** 0.0
  displaySmall,

  /// **Size:** 32sp, **Height:** 40, **Weight:** Regular (w400), **Spacing:** 0.0
  headlineLarge,

  /// **Size:** 28sp, **Height:** 36, **Weight:** Regular (w400), **Spacing:** 0.0
  headlineMedium,

  /// **Size:** 24sp, **Height:** 32, **Weight:** Regular (w400), **Spacing:** 0.0
  headlineSmall,

  /// **Size:** 22sp, **Height:** 28, **Weight:** Regular (w400), **Spacing:** 0.0
  titleLarge,

  /// **Size:** 16sp, **Height:** 24, **Weight:** Medium (w500), **Spacing:** 0.15
  titleMedium,

  /// **Size:** 14sp, **Height:** 20, **Weight:** Medium (w500), **Spacing:** 0.1
  titleSmall,

  /// **Size:** 16sp, **Height:** 24, **Weight:** Regular (w400), **Spacing:** 0.5
  bodyLarge,

  /// **Size:** 14sp, **Height:** 20, **Weight:** Regular (w400), **Spacing:** 0.25
  bodyMedium,

  /// **Size:** 12sp, **Height:** 16, **Weight:** Regular (w400), **Spacing:** 0.4
  bodySmall,

  /// **Size:** 14sp, **Height:** 20, **Weight:** Medium (w500), **Spacing:** 0.1
  labelLarge,

  /// **Size:** 12sp, **Height:** 16, **Weight:** Medium (w500), **Spacing:** 0.5
  labelMedium,

  /// **Size:** 11sp, **Height:** 16, **Weight:** Medium (w500), **Spacing:** 0.5
  labelSmall,
}

/// Extension to fetch the correct [TextStyle] from [Theme.of(context).textTheme].
extension AppTextStyleExtension on AppTextStyle {
  TextStyle getStyle(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return switch (this) {
      AppTextStyle.displayLarge => textTheme.displayLarge ?? const TextStyle(),
      AppTextStyle.displayMedium =>
        textTheme.displayMedium ?? const TextStyle(),
      AppTextStyle.displaySmall => textTheme.displaySmall ?? const TextStyle(),
      AppTextStyle.headlineLarge =>
        textTheme.headlineLarge ?? const TextStyle(),
      AppTextStyle.headlineMedium =>
        textTheme.headlineMedium ?? const TextStyle(),
      AppTextStyle.headlineSmall =>
        textTheme.headlineSmall ?? const TextStyle(),
      AppTextStyle.titleLarge => textTheme.titleLarge ?? const TextStyle(),
      AppTextStyle.titleMedium => textTheme.titleMedium ?? const TextStyle(),
      AppTextStyle.titleSmall => textTheme.titleSmall ?? const TextStyle(),
      AppTextStyle.bodyLarge => textTheme.bodyLarge ?? const TextStyle(),
      AppTextStyle.bodyMedium => textTheme.bodyMedium ?? const TextStyle(),
      AppTextStyle.bodySmall => textTheme.bodySmall ?? const TextStyle(),
      AppTextStyle.labelLarge => textTheme.labelLarge ?? const TextStyle(),
      AppTextStyle.labelMedium => textTheme.labelMedium ?? const TextStyle(),
      AppTextStyle.labelSmall => textTheme.labelSmall ?? const TextStyle(),
    };
  }
}

/// **Reusable `AppText` Widget** for light/dark mode with flexible styles.
class AppText extends StatelessWidget {
  final String text;
  final AppTextStyle style;
  final Color? color;
  final TextAlign? textAlign;
  final FontWeight? fontWeight;
  final int? maxLines;
  final TextOverflow? overflow;
  final TextDecoration? decoration;
  final Color? decorationColor;
  final double? fontSize;
  final bool? softWrap;

  const AppText(
    this.text, {
    super.key,
    this.style = AppTextStyle.bodyMedium,
    this.color,
    this.textAlign,
    this.fontSize,
    this.fontWeight,
    this.maxLines = 1,
    this.overflow = TextOverflow.ellipsis,
    this.decoration = TextDecoration.none,
    this.decorationColor,
    this.softWrap,
  });

  @override
  Widget build(BuildContext context) {
    TextStyle baseStyle = style.getStyle(context);

    return Text(
      text,
      softWrap: softWrap,
      style: baseStyle.copyWith(
        fontSize: fontSize ?? baseStyle.fontSize,
        color: color ?? Theme.of(context).colorScheme.onSurface,
        fontWeight: fontWeight ?? baseStyle.fontWeight,
        decoration: decoration ?? TextDecoration.none,
        decorationColor:
            decorationColor ?? Theme.of(context).colorScheme.onSurface,
      ),
      textAlign: textAlign,
      maxLines: maxLines,
      overflow: overflow,
    );
  }
}
