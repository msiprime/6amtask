import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stackfood/core/di/injection_container.dart';
import 'package:stackfood/core/global/extension/context_extension.dart';
import 'package:stackfood/core/global/widgets/app_carousel.dart';
import 'package:stackfood/core/global/widgets/error_state_handler.dart';
import 'package:stackfood/features/home/data/repository/home_repo_impl.dart';
import 'package:stackfood/features/home/presentation/banner/cubit/home_banner_cubit.dart';
import 'package:stackfood/features/home/presentation/banner/widget/carousel_shimmer.dart';

class HomeCarouselSection extends StatelessWidget {
  const HomeCarouselSection({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeBannerCubit(
        homeRepository: sl.get<HomeRepositoryImpl>(),
      )..getBanners(),
      child: const HomeCarouselView(),
    );
  }
}

class HomeCarouselView extends StatelessWidget {
  const HomeCarouselView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeBannerCubit, HomeBannerState>(
      builder: (context, state) {
        return switch (state) {
          BannerInitial() || BannerLoading() => const CarouselShimmer(),
          BannerLoaded(:final banners) => AppCarouselSlider(
              imageUrls: banners.map((e) => e.imageUrl).toList(),
              maxHeight: context.screenHeight * 0.17,
            ),
          BannerError() => ErrorStateHandler(
              child: const CarouselShimmer(),
              onRetry: () => context.read<HomeBannerCubit>().getBanners(),
            ),
        };
      },
    );
  }
}
