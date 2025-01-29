import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stackfood/core/di/injection_container.dart';
import 'package:stackfood/core/global/constants/app_spacing.dart';
import 'package:stackfood/features/home/data/repository/home_repo_impl.dart';
import 'package:stackfood/features/home/presentation/popular_food/cubit/popular_food_cubit.dart';
import 'package:stackfood/features/home/presentation/popular_food/widget/popular_food_item_card.dart';

class PopularFoodSection extends StatelessWidget {
  const PopularFoodSection({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          PopularFoodCubit(homeRepository: sl.get<HomeRepositoryImpl>())
            ..getPopularFoodNearby(),
      child: const PopularFoodView(),
    );
  }
}

class PopularFoodView extends StatelessWidget {
  const PopularFoodView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PopularFoodCubit, PopularFoodState>(
      builder: (context, state) {
        switch (state) {
          case PopularFoodLoading():
            return const Center(child: CircularProgressIndicator.adaptive());

          case PopularFoodLoaded(:final popularProducts):
            return ConstrainedBox(
              constraints: BoxConstraints(maxHeight: 200),
              child: ListView.builder(
                itemCount: popularProducts.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) => Padding(
                  padding: const EdgeInsets.only(left: AppSpacing.sm),
                  child:
                      PopularFoodItemCard(popularFood: popularProducts[index]),
                ),
              ),
            );

          case PopularFoodError(:final message):
            return Center(
              child: TextButton(
                onPressed: () {
                  context.read<PopularFoodCubit>().getPopularFoodNearby();
                },
                child: Text(message),
              ),
            );

          default:
            return const SizedBox.shrink();
        }
      },
    );
  }
}
