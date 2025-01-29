import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stackfood/core/di/injection_container.dart';
import 'package:stackfood/core/global/constants/app_size.dart';
import 'package:stackfood/core/global/constants/app_spacing.dart';
import 'package:stackfood/core/global/extension/context_extension.dart';
import 'package:stackfood/core/global/widgets/custom_rating_widget.dart';
import 'package:stackfood/core/global/widgets/image_thumbnail.dart';
import 'package:stackfood/features/home/data/repository/home_repo_impl.dart';
import 'package:stackfood/features/home/domain/entity/campaign_entity.dart';
import 'package:stackfood/features/home/presentation/food_campaign/cubit/food_campaign_cubit.dart';

class FoodCampaignSection extends StatelessWidget {
  const FoodCampaignSection({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => FoodCampaignCubit(
        homeRepository: sl.get<HomeRepositoryImpl>(),
      )..getFoodCampaigns(),
      child: const FoodCampaignView(),
    );
  }
}

class FoodCampaignView extends StatelessWidget {
  const FoodCampaignView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FoodCampaignCubit, FoodCampaignState>(
      builder: (context, state) => switch (state) {
        FoodCampaignInitial() || FoodCampaignLoading() => const Center(
            child: CircularProgressIndicator(),
          ),
        FoodCampaignError(:final message) => Center(
            child: Text(message, style: const TextStyle(color: Colors.red)),
          ),
        FoodCampaignLoaded(:final campaigns) => ConstrainedBox(
            constraints: const BoxConstraints(
              maxHeight: 135,
            ),
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: campaigns.length,
              itemBuilder: (context, index) {
                final campaign = campaigns[index];
                return FoodCampaignItemCard(
                  campaign: campaign,
                );
              },
            ),
          ),
      },
    );
  }
}

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
                        Text(
                          '\$ ${campaign.getDiscountedPrice()}',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                        ),
                        const SizedBox(width: 6),
                        Text(
                          '\$ ${campaign.price}',
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
