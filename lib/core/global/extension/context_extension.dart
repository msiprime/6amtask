import 'package:flutter/material.dart';
import 'package:stackfood/core/global/theme/app_colors.dart';

extension BuildContextX on BuildContext {
  ThemeData get theme => Theme.of(this);

  Brightness get brightness => theme.brightness;

  /// Whether current theme [Brightness] is light.
  bool get isLight => brightness == Brightness.light;

  /// Whether current theme [Brightness] is dark.
  bool get isDark => !isLight;

  /// Defines an adaptive [Color], depending on current theme brightness.
  Color get adaptiveColor => isDark ? AppColors.white : AppColors.black;

  /// Defines a reversed adaptive [Color], depending on current theme
  /// brightness.
  Color get reversedAdaptiveColor => isDark ? AppColors.black : AppColors.white;

  /// Defines [MediaQueryData] based on provided context.
  Size get size => MediaQuery.sizeOf(this);

  /// Defines value of device current width based on [size].
  double get screenWidth => size.width;

  /// Defines value of device current height based on [size].
  double get screenHeight => size.height;

  /// Whether the current device is an `Android`.
  bool get isAndroid => theme.platform == TargetPlatform.android;

  /// Whether the current device is an `iOS`.
  bool get isIOS => !isAndroid;

  /// Whether the current device is a `mobile`.
  bool get isMobileDevice => isAndroid || isIOS;

  /// Whether the device is a mobile phone.
  bool get isMobile => screenWidth < 600;

  /// Whether the device is a tablet.
  bool get isTablet => screenWidth >= 600 && screenWidth < 840;

  /// Whether the device is a desktop.
  bool get isDesktop => screenWidth >= 840;
}
