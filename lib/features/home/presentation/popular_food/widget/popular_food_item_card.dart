import 'package:flutter/material.dart';
import 'package:stackfood/core/global/constants/app_size.dart';
import 'package:stackfood/core/global/constants/app_spacing.dart';
import 'package:stackfood/core/global/extension/context_extension.dart';
import 'package:stackfood/core/global/logger/logger.dart';
import 'package:stackfood/core/global/widgets/image_thumbnail.dart';
import 'package:stackfood/features/home/domain/entity/popular_product_entity.dart';

class PopularFoodItemCard extends StatelessWidget {
  final PopularFoodEntity popularFood;

  const PopularFoodItemCard({
    super.key,
    required this.popularFood,
  });

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        double itemHeight = constraints.maxHeight;
        double itemWidth = itemHeight * 1.2;

        logE("itemWidth: $itemWidth, itemHeight: $itemHeight");

        return Center(
          child: Card(
            elevation: 0,
            child: Column(
              children: [
                Expanded(
                  child: ImageContainer(
                    itemHeight: itemHeight * 0.5,
                    itemWidth: itemWidth,
                    popularFood: popularFood,
                  ),
                ),
                Expanded(
                  child: InfoContainer(
                    itemHeight: itemHeight * 0.5,
                    itemWidth: itemWidth,
                    popularFood: popularFood,
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

class ImageContainer extends StatelessWidget {
  const ImageContainer({
    super.key,
    required this.itemHeight,
    required this.itemWidth,
    required this.popularFood,
  });

  final double itemHeight;
  final double itemWidth;
  final PopularFoodEntity popularFood;

  @override
  Widget build(BuildContext context) {
    return CustomImageWidget(
      imageUrl: popularFood.imageFullUrl,
      fit: BoxFit.cover,
      height: itemHeight,
      width: itemWidth,
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(AppSpacing.lg),
        topRight: Radius.circular(AppSpacing.lg),
      ),
    );
  }
}

class InfoContainer extends StatelessWidget {
  const InfoContainer({
    super.key,
    required this.itemHeight,
    required this.itemWidth,
    required this.popularFood,
  });

  final double itemHeight;
  final double itemWidth;
  final PopularFoodEntity popularFood;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: itemHeight,
      width: itemWidth,
      padding: const EdgeInsets.all(AppSpacing.md),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: const BorderRadius.only(
          bottomLeft: Radius.circular(AppSpacing.lg),
          bottomRight: Radius.circular(AppSpacing.lg),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 6,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Text(
            popularFood.name,
            style: context.theme.textTheme.titleMedium
                ?.copyWith(fontWeight: FontWeight.w500),
            overflow: TextOverflow.ellipsis,
          ),
          Text(
            popularFood.restaurantName,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: context.theme.textTheme.titleSmall
                ?.copyWith(color: Colors.grey),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("\$${popularFood.price}",
                  style: context.theme.textTheme.titleMedium
                      ?.copyWith(fontWeight: FontWeight.w600)),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Icon(Icons.star, color: Colors.green, size: AppSize.xs),
                  Text(popularFood.avgRating,
                      style: context.theme.textTheme.titleMedium
                          ?.copyWith(color: Colors.green),
                      textAlign: TextAlign.center),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
