import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stackfood/core/di/injection_container.dart';
import 'package:stackfood/features/home/data/repository/home_repo_impl.dart';
import 'package:stackfood/features/home/presentation/restaurant/cubit/restaurant_home_cubit.dart';
import 'package:stackfood/features/home/presentation/restaurant/widget/restaurant_item_card.dart';

class RestaurantHomeSection extends StatelessWidget {
  const RestaurantHomeSection({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          RestaurantHomeCubit(homeRepository: sl.get<HomeRepositoryImpl>())
            ..getRestaurants(),
      child: RestaurantHomeCardView(),
    );
  }
}

class RestaurantHomeCardView extends StatelessWidget {
  const RestaurantHomeCardView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RestaurantHomeCubit, RestaurantHomeState>(
      builder: (context, state) {
        return switch (state) {
          RestaurantHomeLoading() ||
          RestaurantHomeInitial() =>
            const SliverToBoxAdapter(
              child: Center(child: CircularProgressIndicator.adaptive()),
            ),
          RestaurantHomeLoaded(:final restaurants) => SliverList(
              delegate: SliverChildBuilderDelegate(
                (context, index) => Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: RestaurantItemCard(restaurant: restaurants[index]),
                ),
                childCount: restaurants.length,
              ),
            ),
          RestaurantHomeError(:final message) => SliverToBoxAdapter(
              child: Center(
                child: Text(
                  "Error: $message",
                  style: const TextStyle(color: Colors.red),
                ),
              ),
            ),
        };
      },
    );
  }
}
