import 'package:flutter/material.dart';
import 'package:stackfood/core/global/constants/app_size.dart';
import 'package:stackfood/core/global/constants/app_spacing.dart';
import 'package:stackfood/core/global/theme/app_colors.dart';
import 'package:stackfood/core/global/widgets/app_text_widget.dart';
import 'package:stackfood/core/global/widgets/custom_image_widget.dart';
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

        return Center(
          child: Card(
            elevation: 0,
            child: Column(
              children: [
                Expanded(
                  child: ImageContainer(
                    itemHeight: itemHeight * 0.45,
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
        color: AppColors.white,
        borderRadius: const BorderRadius.only(
          bottomLeft: Radius.circular(AppSize.xs),
          bottomRight: Radius.circular(AppSize.xs),
        ),
        boxShadow: [
          BoxShadow(
            color: AppColors.black.withOpacity(0.1),
            blurRadius: 6,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          AppText(
            popularFood.name,
            style: AppTextStyle.titleMedium,
            fontWeight: FontWeight.w500,
            overflow: TextOverflow.ellipsis,
          ),
          AppText(
            popularFood.restaurantName,
            style: AppTextStyle.titleSmall,
            color: AppColors.grey,
            overflow: TextOverflow.ellipsis,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              AppText(
                "\$${popularFood.price}",
                style: AppTextStyle.titleMedium,
                fontWeight: FontWeight.w600,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Icon(Icons.star, color: AppColors.green, size: AppSize.xs),
                  AppText(
                    popularFood.avgRating,
                    style: AppTextStyle.titleMedium,
                    color: AppColors.green,
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
