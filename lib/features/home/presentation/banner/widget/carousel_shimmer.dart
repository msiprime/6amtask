import 'package:flutter/material.dart';
import 'package:skeletonizer/skeletonizer.dart';
import 'package:stackfood/core/global/extension/context_extension.dart';
import 'package:stackfood/core/global/widgets/app_carousel.dart';

class CarouselShimmer extends StatelessWidget {
  const CarouselShimmer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Skeletonizer(
      child: AppCarouselSlider(
        imageUrls: [
          'https://via.placeholder.com/150',
          'https://via.placeholder.com/150',
          'https://via.placeholder.com/150',
          'https://via.placeholder.com/150',
          'https://via.placeholder.com/150',
          'https://via.placeholder.com/150',
        ],
        maxHeight: context.screenHeight * 0.17,
      ),
    ));
  }
}
