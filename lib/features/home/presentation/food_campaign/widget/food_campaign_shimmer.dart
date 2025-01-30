import 'package:flutter/material.dart';
import 'package:skeletonizer/skeletonizer.dart';
import 'package:stackfood/features/home/domain/entity/campaign_entity.dart';
import 'package:stackfood/features/home/presentation/food_campaign/widget/food_campaign_item_card.dart';

class FoodCampaignShimmer extends StatelessWidget {
  const FoodCampaignShimmer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Skeletonizer(
        child: ConstrainedBox(
          constraints: BoxConstraints(maxHeight: 135),
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: 5,
            itemBuilder: (context, index) => FoodCampaignItemCard(
              campaign: CampaignEntity(
                id: 0,
                name: 'something',
                averageRating: 5,
                imageUrl: '',
                description: 'Description of the campaign',
                discount: 0,
                discountType: '',
                price: 0,
                restaurantName: 'Restaurant Name',
              ),
            ),
          ),
        ),
      ),
    );
  }
}
