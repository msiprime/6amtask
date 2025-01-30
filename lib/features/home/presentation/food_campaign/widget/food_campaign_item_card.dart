import 'package:flutter/material.dart';
import 'package:stackfood/core/global/constants/app_size.dart';
import 'package:stackfood/core/global/constants/app_spacing.dart';
import 'package:stackfood/core/global/extension/context_extension.dart';
import 'package:stackfood/core/global/widgets/custom_rating_widget.dart';
import 'package:stackfood/core/global/widgets/image_thumbnail.dart';
import 'package:stackfood/features/home/domain/entity/campaign_entity.dart';
import 'package:stackfood/features/home/presentation/food_campaign/widget/custom_discount_label.dart';

class FoodCampaignItemCard extends StatelessWidget {
  final CampaignEntity campaign;

  const FoodCampaignItemCard({super.key, required this.campaign});

  @override
  Widget build(BuildContext context) {
    return IntrinsicWidth(
      stepWidth: 330,
      child: Card(
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
                  imageUrl: campaign.imageUrl,
                  height: 125,
                  width: 120,
                  scale: 0.5,
                ),
              ),
              Positioned(
                top: 30,
                left: 0,
                child: CustomDiscountLabel(
                  discount: campaign.discount.toStringAsFixed(0),
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
                  campaign.name,
                  style: context.theme.textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.w500,
                  ),
                  overflow: TextOverflow.fade,
                ),
                Text(
                  'Mc Donald, New York, USA',
                  style: context.theme.textTheme.titleSmall?.copyWith(
                    color: Colors.grey,
                  ),
                  overflow: TextOverflow.fade,
                ),
                RatingStars(rating: campaign.averageRating),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        /// We could make it double, (AS PER UI, I am keeping it as it is)
                        Text(
                          '\$ ${campaign.getDiscountedPrice().toStringAsFixed(0)}',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                        ),
                        const SizedBox(width: 6),
                        Text(
                          '\$ ${campaign.price.toStringAsFixed(0)}',
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.grey.shade500,
                            decoration: TextDecoration.lineThrough,
                          ),
                        ),
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
      ),
    );
  }
}
