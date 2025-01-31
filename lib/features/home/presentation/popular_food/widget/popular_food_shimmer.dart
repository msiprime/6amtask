import 'package:flutter/material.dart';
import 'package:skeletonizer/skeletonizer.dart';
import 'package:stackfood/core/global/constants/app_spacing.dart';
import 'package:stackfood/core/global/effect/static_shimmer_effect.dart';
import 'package:stackfood/core/global/extension/context_extension.dart';
import 'package:stackfood/features/home/domain/entity/popular_product_entity.dart';
import 'package:stackfood/features/home/presentation/popular_food/widget/popular_food_item_card.dart';

class PopularFoodShimmer extends StatelessWidget {
  final bool isAnimated;

  const PopularFoodShimmer({
    this.isAnimated = true,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Skeletonizer(
        effect: isAnimated ? null : StaticShimmerEffect(),
        child: ConstrainedBox(
          constraints: BoxConstraints(maxHeight: context.isDesktop ? 250 : 210),
          child: ListView.builder(
            itemCount: 10,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) => Padding(
              padding: const EdgeInsets.only(left: AppSpacing.sm),
              child: PopularFoodItemCard(
                popularFood: PopularFoodEntity(
                  id: 0,
                  name: "Food Name",
                  description: "Food Description",
                  image: "image",
                  categoryId: 0,
                  price: "00",
                  restaurantId: 0,
                  avgRating: "5",
                  restaurantName: "Restaurant Name",
                  imageFullUrl: "image URL",
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
