import 'package:flutter/material.dart';
import 'package:stackfood/core/global/theme/app_colors.dart';

/// Provides values of current device screen `width` and `height` by provided
/// context.
extension BuildContextX on BuildContext {
  /// app localizations
  /// Defines current theme [Brightness].
  ///
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

  /// Defines a customizable adaptive [Color]. If [light] or [dark] is not
  /// provided default colors are used.
  Color customAdaptiveColor({Color? light, Color? dark}) =>
      isDark ? (light ?? AppColors.white) : (dark ?? AppColors.black);

  /// Defines a customizable reversed adaptive [Color]. If [light] or [dark]
  /// is not provided default reversed colors are used.
  Color customReversedAdaptiveColor({Color? light, Color? dark}) =>
      isDark ? (dark ?? AppColors.black) : (light ?? AppColors.white);

  /// Defines [MediaQueryData] based on provided context.
  Size get size => MediaQuery.sizeOf(this);

  /// Defines view insets from [MediaQuery] with current [BuildContext].
  EdgeInsets get viewInsets => MediaQuery.viewInsetsOf(this);

  /// Defines view padding of from [MediaQuery] with current [BuildContext].
  EdgeInsets get viewPadding => MediaQuery.viewPaddingOf(this);

  /// Defines value of device current width based on [size].
  double get screenWidth => size.width;

  /// Defines value of device current height based on [size].
  double get screenHeight => size.height;

  /// Defines value of current device pixel ratio.
  double get devicePixelRatio => MediaQuery.devicePixelRatioOf(this);

  /// Whether the current device is an `Android`.
  bool get isAndroid => theme.platform == TargetPlatform.android;

  /// Whether the current device is an `iOS`.
  bool get isIOS => !isAndroid;

  /// Whether the current device is a `mobile`.
  bool get isMobileDevice => isAndroid || isIOS;

  // /// Whether the device is a mobile phone.
  // bool get isMobile => screenWidth < 600 && screenHeight < 1000;
  //
  // /// Whether the device is a tablet.
  // bool get isTablet =>
  //     screenWidth >= 600 && screenWidth < 840 && screenHeight >= 1000;
  //
  // /// Whether the device is a desktop.
  // bool get isDesktop => screenWidth >= 840 && screenHeight >= 1000;

  /// Whether the device is a mobile phone.
  bool get isMobile => screenWidth < 600;

  /// Whether the device is a tablet.
  bool get isTablet => screenWidth >= 600 && screenWidth < 840;

  /// Whether the device is a desktop.
  bool get isDesktop => screenWidth >= 840;

  /// Returns the appropriate widget based on the screen size.
  Widget responsiveWidget({
    required Widget mobile,
    Widget? tablet,
    Widget? desktop,
  }) {
    if (isDesktop && desktop != null) return desktop;
    if (isTablet && tablet != null) return tablet;
    return mobile;
  }

  /// base extensions
  /// Returns the theme extension of type [T] or null if not found.
  T? extensionOrNull<T>() => Theme.of(this).extension<T>();

  /// Returns the theme extension of type [T].
  ///
  // ignore: lines_longer_than_80_chars
  /// {@template prime.template.theme_extension_must_not_be_null}
  /// The theme extension must be non-null.
  /// {@endtemplate}
  T extension<T>() => Theme.of(this).extension<T>()!;

  AppColors get appColorsTheme => extension<AppColors>();
}
