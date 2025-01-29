import 'package:flutter/material.dart';
import 'package:stackfood/features/home/presentation/banner/view/carousel_view.dart';
import 'package:stackfood/features/home/presentation/categories/view/category_item_view.dart';
import 'package:stackfood/features/home/presentation/home_screen/widget/home_title_section.dart';

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
        SliverToBoxAdapter(
          child: CategoryItemSection(),
        )
      ],
    );
  }
}
