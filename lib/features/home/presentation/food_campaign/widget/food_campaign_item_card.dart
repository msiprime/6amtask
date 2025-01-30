import 'package:flutter/material.dart';
import 'package:stackfood/core/global/constants/app_size.dart';
import 'package:stackfood/core/global/constants/app_spacing.dart';
import 'package:stackfood/core/global/extension/context_extension.dart';
import 'package:stackfood/core/global/theme/app_colors.dart';
import 'package:stackfood/core/global/widgets/app_text_widget.dart';
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
        color: AppColors.white,
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
                AppText(
                  campaign.name,
                  style: AppTextStyle.titleMedium,
                  fontWeight: FontWeight.w500,
                  overflow: TextOverflow.fade,
                ),
                AppText(
                  campaign.restaurantName,
                  style: AppTextStyle.titleSmall,
                  color: AppColors.grey,
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

            AppText(
              '\$ ${campaign.getDiscountedPrice().toStringAsFixed(0)}',
              style: AppTextStyle.titleSmall,
              fontWeight: FontWeight.w500,
            ),
            const SizedBox(width: AppSpacing.md),
            AppText(
              '(${campaign.price.toStringAsFixed(0)})',
              style: AppTextStyle.titleSmall,
              color: AppColors.grey,
              decoration: TextDecoration.lineThrough,
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
