import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stackfood/core/di/injection_container.dart';
import 'package:stackfood/core/global/extension/context_extension.dart';
import 'package:stackfood/core/global/widgets/app_carousel.dart';
import 'package:stackfood/features/home/data/repository/home_repo_impl.dart';
import 'package:stackfood/features/home/presentation/banner/cubit/home_banner_cubit.dart';

class HomeCarouselSection extends StatelessWidget {
  const HomeCarouselSection({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeBannerCubit(
        homeRepository: sl.get<HomeRepositoryImpl>(),
      )..getBanners(),
      child: HomeCarouselView(),
    );
  }
}

class HomeCarouselView extends StatelessWidget {
  const HomeCarouselView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeBannerCubit, HomeBannerState>(
      builder: (context, state) {
        if (state is BannerInitial || state is BannerLoading) {
          return const Center(
            child: CircularProgressIndicator.adaptive(),
          );
        } else if (state is BannerLoaded) {
          return AppCarouselSlider(
            imageUrls: state.banners.map((e) => e.imageUrl).toList(),
            height: context.screenHeight * 0.17,
          );
        } else if (state is BannerError) {
          return Center(
            child: Text(state.message),
          );
        }
        return const Center(
          child: CircularProgressIndicator.adaptive(),
        );
      },
    );
  }
}
