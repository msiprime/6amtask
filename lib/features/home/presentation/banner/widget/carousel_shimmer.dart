import 'package:flutter/material.dart';
import 'package:skeletonizer/skeletonizer.dart';
import 'package:stackfood/core/global/effect/static_shimmer_effect.dart';
import 'package:stackfood/core/global/widgets/app_carousel.dart';

class CarouselShimmer extends StatelessWidget {
  final bool isAnimated;

  const CarouselShimmer({
    super.key,
    this.isAnimated = true,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Skeletonizer(
      effect: isAnimated ? null : StaticShimmerEffect(),
      child: AppCarouselSlider(
        autoPlay: false,
        imageUrls: [
          'https://via.placeholder.com/150',
          'https://via.placeholder.com/150',
          'https://via.placeholder.com/150',
          'https://via.placeholder.com/150',
          'https://via.placeholder.com/150',
          'https://via.placeholder.com/150',
        ],
      ),
    ));
  }
}
