import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stackfood/core/di/injection_container.dart';
import 'package:stackfood/core/global/extension/context_extension.dart';
import 'package:stackfood/core/global/widgets/error_state_handler.dart';
import 'package:stackfood/features/home/data/repository/home_repo_impl.dart';
import 'package:stackfood/features/home/presentation/food_campaign/cubit/food_campaign_cubit.dart';
import 'package:stackfood/features/home/presentation/food_campaign/widget/food_campaign_item_card.dart';
import 'package:stackfood/features/home/presentation/food_campaign/widget/food_campaign_shimmer.dart';

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
        FoodCampaignInitial() || FoodCampaignLoading() => FoodCampaignShimmer(),
        FoodCampaignError() => ErrorStateHandler(
            child: FoodCampaignShimmer(),
            onRetry: () => context.read<FoodCampaignCubit>().getFoodCampaigns(),
          ),
        FoodCampaignLoaded(:final campaigns) => ConstrainedBox(
            constraints: BoxConstraints(
              maxHeight: context.isDesktop ? 165 : 135,
            ),
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: campaigns.length,
              itemBuilder: (context, index) {
                final campaign = campaigns[index];
                return Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: FoodCampaignItemCard(
                    campaign: campaign,
                  ),
                );
              },
            ),
          ),
      },
    );
  }
}
