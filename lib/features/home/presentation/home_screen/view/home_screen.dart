import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:stackfood/core/global/constants/app_spacing.dart';
import 'package:stackfood/features/home/presentation/banner/view/carousel_view.dart';
import 'package:stackfood/features/home/presentation/categories/view/category_item_view.dart';
import 'package:stackfood/features/home/presentation/food_campaign/view/food_campaign_view.dart';
import 'package:stackfood/features/home/presentation/home_screen/widget/home_title_section.dart';
import 'package:stackfood/features/home/presentation/popular_food/view/popular_food_view.dart';
import 'package:stackfood/features/home/presentation/restaurant/view/restaurant_home_view.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  static const routeName = 'home_screen';

  @override
  Widget build(BuildContext context) {
    return HomeView();
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
  void initState() {
    super.initState();
    _scrollController = ScrollController();
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      controller: _scrollController,
      slivers: [
        SliverAppBar(
          title: Text('Home'),
        ),
        SliverToBoxAdapter(
          child: HomeCarouselSection(),
        ),
        SliverToBoxAdapter(
          child: HomeTitleSectionWithViewAll(
            title: 'Categories',
            onViewAllTap: () {},
          ),
        ),
        SliverGap(AppSpacing.md),
        SliverToBoxAdapter(
          child: CategoryItemSection(),
        ),
        SliverGap(AppSpacing.md),
        SliverToBoxAdapter(
          child: HomeTitleSectionWithViewAll(
            title: 'Popular Food Nearby',
            onViewAllTap: () {},
          ),
        ),
        SliverGap(AppSpacing.sm),
        SliverToBoxAdapter(
          child: PopularFoodSection(),
        ),
        SliverGap(AppSpacing.md),
        SliverToBoxAdapter(
          child: HomeTitleSectionWithViewAll(
            title: 'Food Campaign',
            onViewAllTap: () {},
          ),
        ),
        SliverGap(AppSpacing.md),
        SliverToBoxAdapter(
          child: FoodCampaignSection(),
        ),
        SliverGap(AppSpacing.md),
        SliverToBoxAdapter(
          child: HomeTitleSectionWithViewAll(
            title: 'Restaurants',
            onViewAllTap: () {},
          ),
        ),
        SliverGap(AppSpacing.md),
        RestaurantHomeSection(scrollController: _scrollController),
        SliverGap(AppSpacing.md),
        SliverGap(AppSpacing.md),
        SliverGap(AppSpacing.md),
        SliverGap(AppSpacing.md),
      ],
    );
  }
}
