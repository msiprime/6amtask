import 'package:flutter/material.dart';
import 'package:stackfood/core/global/constants/app_size.dart';
import 'package:stackfood/core/global/constants/app_spacing.dart';
import 'package:stackfood/core/global/extension/context_extension.dart';
import 'package:stackfood/core/global/widgets/custom_rating_widget.dart';
import 'package:stackfood/core/global/widgets/image_thumbnail.dart';
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
              Text(
                restaurant.name,
                maxLines: 1,
                style: context.theme.textTheme.titleMedium?.copyWith(
                  fontWeight: FontWeight.w500,
                  overflow: TextOverflow.fade,
                ),
                overflow: TextOverflow.fade,
              ),
              Text(
                restaurant.address,
                maxLines: 2,
                style: context.theme.textTheme.titleSmall?.copyWith(
                  color: Colors.grey,
                  overflow: TextOverflow.fade,
                ),
                overflow: TextOverflow.fade,
              ),
              RatingStars(rating: restaurant.avgRating),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      /// We could make it double, (AS PER UI, I am keeping it as it is)
                      Text(
                        '\$ ${"10"}',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                      const SizedBox(width: 6),
                    ],
                  ),
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
