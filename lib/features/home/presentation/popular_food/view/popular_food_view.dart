import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stackfood/core/di/injection_container.dart';
import 'package:stackfood/core/global/constants/app_spacing.dart';
import 'package:stackfood/core/global/extension/context_extension.dart';
import 'package:stackfood/core/global/widgets/error_state_handler.dart';
import 'package:stackfood/features/home/data/repository/home_repo_impl.dart';
import 'package:stackfood/features/home/presentation/popular_food/cubit/popular_food_cubit.dart';
import 'package:stackfood/features/home/presentation/popular_food/widget/popular_food_item_card.dart';
import 'package:stackfood/features/home/presentation/popular_food/widget/popular_food_shimmer.dart';
import 'package:stackfood/features/random/refresh/global_refresh_cubit.dart';

class PopularFoodSection extends StatelessWidget {
  const PopularFoodSection({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => PopularFoodCubit(
        homeRepository: sl.get<HomeRepositoryImpl>(),
      )..getPopularFoodNearby(),
      child: SliverToBoxAdapter(child: const PopularFoodView()),
    );
  }
}

class PopularFoodView extends StatelessWidget {
  const PopularFoodView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PopularFoodCubit, PopularFoodState>(
      builder: (context, state) {
        return switch (state) {
          PopularFoodLoading() ||
          PopularFoodInitial() =>
            const PopularFoodShimmer(),
          PopularFoodLoaded(:final popularProducts) =>
            BlocListener<GlobalRefreshCubit, int>(
              listener: (context, state) {
                if (state == 1) {
                  context.read<PopularFoodCubit>().getPopularFoodNearby();
                }
              },
              child: ConstrainedBox(
                constraints:
                    BoxConstraints(maxHeight: context.isDesktop ? 250 : 210),
                child: ListView.builder(
                  itemCount: popularProducts.length,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) => Padding(
                    padding: const EdgeInsets.only(left: AppSpacing.sm),
                    child: PopularFoodItemCard(
                      popularFood: popularProducts[index],
                    ),
                  ),
                ),
              ),
            ),
          PopularFoodError error => ErrorStateHandler(
              errorMessage: error.message,
              child: const PopularFoodShimmer(
                isAnimated: false,
              ),
              onRetry: () =>
                  context.read<PopularFoodCubit>().getPopularFoodNearby(),
            ),
        };
      },
    );
  }
}
