// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:stackfood/core/di/injection_container.dart';
// import 'package:stackfood/core/global/constants/app_spacing.dart';
// import 'package:stackfood/features/home/data/repository/home_repo_impl.dart';
// import 'package:stackfood/features/home/presentation/popular_food/cubit/popular_food_cubit.dart';
// import 'package:stackfood/features/home/presentation/popular_food/widget/popular_food_item_card.dart';
// import 'package:stackfood/features/home/presentation/popular_food/widget/popular_food_shimmer.dart';
//
// class PopularFoodSection extends StatelessWidget {
//   const PopularFoodSection({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return BlocProvider(
//       create: (context) => PopularFoodCubit(
//         homeRepository: sl.get<HomeRepositoryImpl>(),
//       )..getPopularFoodNearby(),
//       child: const PopularFoodView(),
//     );
//   }
// }
//
// class PopularFoodView extends StatelessWidget {
//   const PopularFoodView({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return BlocBuilder<PopularFoodCubit, PopularFoodState>(
//       builder: (context, state) {
//         return switch (state) {
//           PopularFoodLoading() || PopularFoodInitial() => PopularFoodShimmer(),
//           PopularFoodLoaded(:final popularProducts) => ConstrainedBox(
//               constraints: const BoxConstraints(maxHeight: 200),
//               child: ListView.builder(
//                 itemCount: popularProducts.length,
//                 scrollDirection: Axis.horizontal,
//                 itemBuilder: (context, index) => Padding(
//                   padding: const EdgeInsets.only(left: AppSpacing.sm),
//                   child:
//                       PopularFoodItemCard(popularFood: popularProducts[index]),
//                 ),
//               ),
//             ),
//           PopularFoodError(:final message) => Center(
//               child: TextButton(
//                 onPressed: () =>
//                     context.read<PopularFoodCubit>().getPopularFoodNearby(),
//                 child: Text(message),
//               ),
//             ),
//         };
//       },
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stackfood/core/di/injection_container.dart';
import 'package:stackfood/core/global/constants/app_spacing.dart';
import 'package:stackfood/core/global/widgets/error_state_handler.dart';
import 'package:stackfood/features/home/data/repository/home_repo_impl.dart';
import 'package:stackfood/features/home/presentation/popular_food/cubit/popular_food_cubit.dart';
import 'package:stackfood/features/home/presentation/popular_food/widget/popular_food_item_card.dart';
import 'package:stackfood/features/home/presentation/popular_food/widget/popular_food_shimmer.dart';

class PopularFoodSection extends StatelessWidget {
  const PopularFoodSection({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => PopularFoodCubit(
        homeRepository: sl.get<HomeRepositoryImpl>(),
      )..getPopularFoodNearby(),
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
        return switch (state) {
          PopularFoodLoading() ||
          PopularFoodInitial() =>
            const PopularFoodShimmer(),
          PopularFoodLoaded(:final popularProducts) => ConstrainedBox(
              constraints: const BoxConstraints(maxHeight: 200),
              child: ListView.builder(
                itemCount: popularProducts.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) => Padding(
                  padding: const EdgeInsets.only(left: AppSpacing.sm),
                  child:
                      PopularFoodItemCard(popularFood: popularProducts[index]),
                ),
              ),
            ),
          PopularFoodError() => ErrorStateHandler(
              child: const PopularFoodShimmer(),
              onRetry: () =>
                  context.read<PopularFoodCubit>().getPopularFoodNearby(),
            ),
        };
      },
    );
  }
}
