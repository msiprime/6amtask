import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stackfood/core/di/injection_container.dart';
import 'package:stackfood/features/home/data/repository/home_repo_impl.dart';
import 'package:stackfood/features/home/presentation/restaurant/cubit/restaurant_home_cubit.dart';
import 'package:stackfood/features/home/presentation/restaurant/widget/restaurant_item_card.dart';

class RestaurantHomeSection extends StatelessWidget {
  final ScrollController scrollController;

  const RestaurantHomeSection({super.key, required this.scrollController});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          RestaurantHomeCubit(homeRepository: sl.get<HomeRepositoryImpl>())
            ..getRestaurants(),
      child: RestaurantHomeCardView(scrollController: scrollController),
    );
  }
}

class RestaurantHomeCardView extends StatefulWidget {
  final ScrollController scrollController;

  const RestaurantHomeCardView({super.key, required this.scrollController});

  @override
  RestaurantHomeCardViewState createState() => RestaurantHomeCardViewState();
}

class RestaurantHomeCardViewState extends State<RestaurantHomeCardView> {
  late ScrollController _scrollController;

  @override
  void initState() {
    super.initState();
    _scrollController = widget.scrollController;
    _scrollController.addListener(_scrollListener);
  }

  @override
  void dispose() {
    _scrollController.removeListener(_scrollListener);
    super.dispose();
  }

  void _scrollListener() {
    if (_scrollController.position.pixels >=
        _scrollController.position.maxScrollExtent * 0.9) {
      // Load more data when reaching near the end
      context.read<RestaurantHomeCubit>().getRestaurants(isPagination: true);
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RestaurantHomeCubit, RestaurantHomeState>(
      builder: (context, state) {
        if (state is RestaurantHomeLoading || state is RestaurantHomeInitial) {
          return SliverToBoxAdapter(
            child: Center(child: CircularProgressIndicator.adaptive()),
          );
        } else if (state is RestaurantHomeLoaded) {
          final restaurants = state.restaurants;
          return SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, index) {
                if (index == restaurants.length && !state.hasReachedMax) {
                  // Display a loading spinner at the end of the list when more data is loading
                  return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 20),
                    child: Center(
                      child: CircularProgressIndicator.adaptive(),
                    ),
                  );
                }

                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: RestaurantItemCard(restaurant: restaurants[index]),
                );
              },
              childCount: restaurants.length + (state.isLoading ? 1 : 0),
            ),
          );
        } else if (state is RestaurantHomeError) {
          return SliverToBoxAdapter(
            child: Center(
              child: Text(
                "Error: ${state.message}",
                style: const TextStyle(color: Colors.red),
              ),
            ),
          );
        } else {
          return SliverToBoxAdapter(child: SizedBox.shrink());
        }
      },
    );
  }
}
