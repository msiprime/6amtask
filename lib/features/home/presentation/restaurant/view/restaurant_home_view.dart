import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:stackfood/core/di/injection_container.dart';
import 'package:stackfood/core/global/constants/app_spacing.dart';
import 'package:stackfood/core/global/constants/app_strings.dart';
import 'package:stackfood/features/home/data/repository/home_repo_impl.dart';
import 'package:stackfood/features/home/presentation/restaurant/cubit/restaurant_home_cubit.dart';
import 'package:stackfood/features/home/presentation/restaurant/widget/error_restaurant_widget.dart';
import 'package:stackfood/features/home/presentation/restaurant/widget/restaurant_home_shimmer.dart';
import 'package:stackfood/features/home/presentation/restaurant/widget/restaurant_item_card.dart';

class RestaurantHomeSection extends StatelessWidget {
  final ScrollController scrollController;

  const RestaurantHomeSection({
    super.key,
    required this.scrollController,
  });

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
  @override
  void initState() {
    super.initState();
    widget.scrollController.addListener(_scrollListener);
  }

  @override
  void dispose() {
    widget.scrollController.removeListener(_scrollListener);
    super.dispose();
  }

  void _scrollListener() {
    final cubit = context.read<RestaurantHomeCubit>();
    if (widget.scrollController.position.pixels >=
            widget.scrollController.position.maxScrollExtent * 0.8 &&
        cubit.state.hasMoreData &&
        !cubit.state.isLoading) {
      cubit.getRestaurants();
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RestaurantHomeCubit, RestaurantHomeState>(
      builder: (context, state) {
        if (state.isLoading && state.restaurantList.isEmpty) {
          return RestaurantShimmer();
        }

        if (state.errorMessage.isNotEmpty && state.restaurantList.isEmpty) {
          return ErrorRestaurantWidget();
        }

        return SliverList(
          delegate: SliverChildBuilderDelegate(
            (context, index) {
              if (index == state.restaurantList.length) {
                return state.hasMoreData
                    ? RestaurantShimmer(useSliver: false)
                    : _buildNoMoreDataWidget();
              }
              return Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: AppSpacing.custom10),
                child:
                    RestaurantItemCard(restaurant: state.restaurantList[index]),
              );
            },
            childCount: state.restaurantList.length + 1,
          ),
        );
      },
    );
  }

  Widget _buildNoMoreDataWidget() => const Padding(
        padding: EdgeInsets.symmetric(vertical: 16),
        child: Center(
            child: Column(
          children: [
            Text(AppStrings.noMoreRestaurant),
            Gap(100),
          ],
        )),
      );
}
