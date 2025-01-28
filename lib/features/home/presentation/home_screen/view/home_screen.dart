import 'package:flutter/material.dart';
import 'package:stackfood/features/home/presentation/banner/view/carousel_view.dart';

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
        )
      ],
    );
  }
}
