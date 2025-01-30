import 'package:flutter/material.dart';
import 'package:skeletonizer/skeletonizer.dart';
import 'package:stackfood/core/global/constants/app_spacing.dart';
import 'package:stackfood/core/global/extension/context_extension.dart';
import 'package:stackfood/features/home/domain/entity/popular_product_entity.dart';
import 'package:stackfood/features/home/presentation/popular_food/widget/popular_food_item_card.dart';

class PopularFoodShimmer extends StatelessWidget {
  const PopularFoodShimmer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Skeletonizer(
        child: ConstrainedBox(
          constraints: BoxConstraints(maxHeight: context.isMobile ? 200 : 250),
          child: ListView.builder(
            itemCount: 5,
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
