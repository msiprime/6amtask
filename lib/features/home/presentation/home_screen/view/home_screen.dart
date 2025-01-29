import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:stackfood/core/global/constants/app_size.dart';
import 'package:stackfood/core/global/constants/app_spacing.dart';
import 'package:stackfood/core/global/extension/context_extension.dart';
import 'package:stackfood/core/global/widgets/custom_rating_widget.dart';
import 'package:stackfood/core/global/widgets/image_thumbnail.dart';
import 'package:stackfood/features/home/presentation/banner/view/carousel_view.dart';
import 'package:stackfood/features/home/presentation/categories/view/category_item_view.dart';
import 'package:stackfood/features/home/presentation/home_screen/widget/home_title_section.dart';
import 'package:stackfood/features/home/presentation/popular_food/view/popular_food_view.dart';

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
  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
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
          child: FoodCampaignItemCard(),
        ),
        SliverGap(AppSpacing.md),
      ],
    );
  }
}

class FoodCampaignItemCard extends StatelessWidget {
  const FoodCampaignItemCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
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
              imageUrl: 'https://via.placeholder.com/150',
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
                'Burger',
                style: context.theme.textTheme.titleMedium?.copyWith(
                  fontWeight: FontWeight.bold,
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
              RatingStars(rating: 3.2),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      const Text(
                        '\$5',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                      const SizedBox(width: 6),
                      Text(
                        '\$10',
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
    );
  }
}
