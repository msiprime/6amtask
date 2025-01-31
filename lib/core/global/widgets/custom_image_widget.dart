import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:skeletonizer/skeletonizer.dart';
import 'package:stackfood/core/global/widgets/thumbnail_error.dart';

class CustomImageWidget extends StatelessWidget {
  const CustomImageWidget({
    required this.imageUrl,
    super.key,
    this.width,
    this.height,
    this.memCacheHeight,
    this.memCacheWidth,
    this.resizeHeight,
    this.resizeWidth,
    this.fit = BoxFit.cover,
    this.withPlaceholder = true,
    this.withAdaptiveColors = true,
    this.borderRadius,
    this.scale = 1.0,
    this.errorBuilder = _defaultErrorBuilder,
  });

  final double scale;

  final String imageUrl;

  final double? width;

  final double? height;

  final int? memCacheWidth;

  final int? memCacheHeight;

  final int? resizeWidth;

  final int? resizeHeight;

  final BorderRadiusGeometry? borderRadius;

  final BoxFit? fit;

  final bool withPlaceholder;

  final bool withAdaptiveColors;

  final ThumbnailErrorBuilder errorBuilder;

  static Widget _defaultErrorBuilder(
    BuildContext context,
    Object error,
    StackTrace? stackTrace, {
    double? height,
    double? width,
    BorderRadiusGeometry? borderRadius,
  }) {
    return ThumbnailError(
      error: error,
      stackTrace: stackTrace,
      height: height ?? double.infinity,
      width: width ?? double.infinity,
      borderRadius: borderRadius,
      fit: BoxFit.cover,
    );
  }

  @override
  Widget build(BuildContext context) {
    final width = this.width;
    final height = this.height;

    return NetworkImageAttachment(
      scale: scale,
      url: imageUrl,
      fit: fit,
      width: width,
      height: height,
      memCacheWidth: memCacheWidth,
      memCacheHeight: memCacheHeight,
      resizeWidth: resizeWidth,
      resizeHeight: resizeHeight,
      withPlaceholder: withPlaceholder,
      withAdaptiveColors: withAdaptiveColors,
      borderRadius: borderRadius,
      errorBuilder: errorBuilder,
    );
  }
}

class NetworkImageAttachment extends StatelessWidget {
  const NetworkImageAttachment({
    required this.url,
    required this.errorBuilder,
    required this.withAdaptiveColors,
    required this.withPlaceholder,
    required this.width,
    required this.height,
    required this.borderRadius,
    required this.fit,
    required this.memCacheWidth,
    required this.memCacheHeight,
    required this.resizeHeight,
    required this.resizeWidth,
    required this.scale,
    super.key,
  });

  final double scale;
  final String url;
  final double? width;
  final double? height;
  final int? memCacheWidth;
  final int? memCacheHeight;
  final int? resizeWidth;
  final int? resizeHeight;
  final BorderRadiusGeometry? borderRadius;
  final BoxFit? fit;
  final bool withPlaceholder;
  final bool withAdaptiveColors;
  final ThumbnailErrorBuilder errorBuilder;

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      scale: scale,
      imageUrl: url,
      cacheKey: url,
      memCacheHeight: memCacheHeight,
      memCacheWidth: memCacheWidth,
      imageBuilder: (context, imageProvider) {
        return Container(
          height: height,
          width: width,
          decoration: BoxDecoration(
            borderRadius: borderRadius,
            image: DecorationImage(
              image: resizeHeight == null && resizeWidth == null
                  ? imageProvider
                  : ResizeImage(
                      imageProvider,
                      width: resizeWidth,
                      height: resizeHeight,
                    ),
              fit: fit,
            ),
          ),
        );
      },
      placeholder: !withPlaceholder
          ? null
          : (context, __) => Skeletonizer(
                  child: Container(
                height: height,
                width: width,
                decoration: BoxDecoration(
                  borderRadius: borderRadius,
                  color: Colors.white,
                ),
                child: ClipRRect(
                  borderRadius: borderRadius ?? BorderRadius.zero,
                  child: Image.asset(
                    'assets/images/placeholder.png',
                    fit: BoxFit.cover,
                  ),
                ),
              )),
      errorWidget: (context, url, error) {
        return errorBuilder(
          context,
          error,
          StackTrace.current,
          height: height,
          width: width,
          borderRadius: borderRadius,
        );
      },
    );
  }
}
