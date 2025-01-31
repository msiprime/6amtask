import 'package:flutter/material.dart';
import 'package:stackfood/core/global/constants/app_size.dart';
import 'package:stackfood/core/global/constants/app_spacing.dart';
import 'package:stackfood/core/global/theme/app_colors.dart';
import 'package:stackfood/core/global/widgets/app_text_widget.dart';
import 'package:stackfood/core/global/widgets/custom_image_widget.dart';
import 'package:stackfood/core/global/widgets/custom_rating_widget.dart';
import 'package:stackfood/features/home/domain/entity/restaurant_entity.dart';

class RestaurantItemCard extends StatelessWidget {
  final RestaurantEntity restaurant;

  const RestaurantItemCard({
    required this.restaurant,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(AppSpacing.md),
      ),
      elevation: 0,
      color: Colors.white,
      child: Row(
        children: [
          Stack(children: [
            Padding(
              padding: const EdgeInsets.all(AppSpacing.sm),
              child: CustomImageWidget(
                borderRadius: BorderRadius.circular(AppSpacing.md),
                imageUrl: restaurant.logoFullUrl,
                height: 125,
                width: 120,
                scale: 0.5,
              ),
            ),
          ]),
          const SizedBox(width: AppSpacing.sm),
          Expanded(
              child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            spacing: AppSpacing.xxs,
            children: [
              AppText(
                restaurant.name,
                style: AppTextStyle.titleMedium,
                fontWeight: FontWeight.w500,
                overflow: TextOverflow.fade,
              ),
              AppText(
                restaurant.address,
                style: AppTextStyle.bodyMedium,
                color: AppColors.grey,
                maxLines: 2,
                overflow: TextOverflow.fade,
              ),
              FittedBox(
                child: RatingStars(
                  rating: restaurant.avgRating,
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                      child: AppText('\$ ${restaurant.id}',
                          style: AppTextStyle.titleMedium)),
                  IconButton(
                    style: ButtonStyle(
                      visualDensity: VisualDensity.compact,
                      padding: WidgetStatePropertyAll(
                        EdgeInsets.zero,
                      ),
                    ),
                    onPressed: () {},
                    icon: Icon(
                      Icons.add,
                      size: AppSize.xlg,
                    ),
                  ),
                ],
              ),
            ],
          ))
        ],
      ),
    );
  }
}
