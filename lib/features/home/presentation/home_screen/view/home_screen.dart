import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:stackfood/core/global/constants/app_spacing.dart';
import 'package:stackfood/core/global/constants/app_strings.dart';
import 'package:stackfood/features/home/presentation/banner/view/carousel_view.dart';
import 'package:stackfood/features/home/presentation/categories/view/category_item_view.dart';
import 'package:stackfood/features/home/presentation/food_campaign/view/food_campaign_view.dart';
import 'package:stackfood/features/home/presentation/home_screen/widget/home_app_bar.dart';
import 'package:stackfood/features/home/presentation/home_screen/widget/home_title_section.dart';
import 'package:stackfood/features/home/presentation/popular_food/view/popular_food_view.dart';
import 'package:stackfood/features/home/presentation/restaurant/view/restaurant_home_view.dart';

import '../../../../random/refresh/global_refresh_cubit.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  static const routeName = 'home_screen';

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GlobalRefreshCubit(),
      child: HomeView(),
    );
  }
}

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  HomeViewState createState() => HomeViewState();
}

class HomeViewState extends State<HomeView> {
  late ScrollController _scrollController;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: false,
      child: Scaffold(
        body: RefreshIndicator(
          displacement: 100,
          color: Colors.white,
          elevation: 10,
          semanticsLabel: 'Refresh',
          semanticsValue: 'Refresh',
          strokeWidth: 2,
          backgroundColor: Colors.orange,
          triggerMode: RefreshIndicatorTriggerMode.anywhere,
          onRefresh: () async {
            context.read<GlobalRefreshCubit>().refresh();
          },
          child: CustomScrollView(
            controller: _scrollController,
            slivers: [
              const HomeAppBar(),
              const SliverGap(AppSpacing.md),

              /// HomeCarouselSection
              HomeCarouselSection(),

              /// Home Category Section
              HomeTitleSection(
                  title: AppStrings.categories, onViewAllTap: () {}),
              CategoryItemSection(),
              const SliverGap(AppSpacing.sm),

              /// Popular Food Section
              HomeTitleSection(
                  title: AppStrings.popularFoodNearBy, onViewAllTap: () {}),
              PopularFoodSection(),
              const SliverGap(AppSpacing.md),

              /// Food Campaign Section
              HomeTitleSection(
                  title: AppStrings.foodCampaign, onViewAllTap: () {}),
              FoodCampaignSection(),
              const SliverGap(AppSpacing.md),

              /// Restaurant Home Section
              HomeTitleSection(
                  title: AppStrings.restaurants, onViewAllTap: () {}),
              RestaurantHomeSection(scrollController: _scrollController),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }
}
