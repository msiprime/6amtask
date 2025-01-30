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
      stepWidth: context.isDesktop ? 370 : 330,
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppSpacing.md),
        ),
        elevation: 0,
        color: Colors.white,
        child: Row(
          children: [
            _ImageAndDiscountPart(campaign: campaign),
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
                  campaign.restaurantName,
                  style: context.theme.textTheme.titleSmall?.copyWith(
                    color: Colors.grey,
                  ),
                  overflow: TextOverflow.fade,
                ),
                RatingStars(rating: campaign.averageRating),
                _PriceAndAddToCartPart(campaign: campaign),
              ],
            ))
          ],
        ),
      ),
    );
  }
}

class _PriceAndAddToCartPart extends StatelessWidget {
  const _PriceAndAddToCartPart({
    required this.campaign,
  });

  final CampaignEntity campaign;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            /// We could make it double, (AS PER UI, I am keeping it as it is)
            Text(
              '\$ ${campaign.getDiscountedPrice().toStringAsFixed(0)}',
              style: context.theme.textTheme.titleSmall?.copyWith(
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(width: 6),
            Text(
              '\$ ${campaign.price.toStringAsFixed(0)}',
              style: context.theme.textTheme.titleSmall?.copyWith(
                color: Colors.grey,
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
    );
  }
}

class _ImageAndDiscountPart extends StatelessWidget {
  const _ImageAndDiscountPart({
    required this.campaign,
  });

  final CampaignEntity campaign;

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
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
    ]);
  }
}
