import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stackfood/core/di/injection_container.dart';
import 'package:stackfood/core/global/extension/context_extension.dart';
import 'package:stackfood/core/global/widgets/error_state_handler.dart';
import 'package:stackfood/features/home/data/repository/home_repo_impl.dart';
import 'package:stackfood/features/home/presentation/categories/cubit/home_category_cubit.dart';
import 'package:stackfood/features/home/presentation/categories/widget/category_item.dart';
import 'package:stackfood/features/home/presentation/categories/widget/category_shimmer.dart';
import 'package:stackfood/features/random/refresh/global_refresh_cubit.dart';

class CategoryItemSection extends StatelessWidget {
  const CategoryItemSection({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
      HomeCategoryCubit(homeRepository: sl.get<HomeRepositoryImpl>())
        ..getHomeCategories(),
      child: SliverToBoxAdapter(child: const CategoryItemView()),
    );
  }
}

class CategoryItemView extends StatelessWidget {
  const CategoryItemView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCategoryCubit, HomeCategoryState>(
      builder: (context, state) {
        return switch (state) {
          HomeCategoryInitial() ||
          HomeCategoryLoading() =>
              CategoryShimmerWidget(),
          HomeCategoryLoaded() =>
              BlocListener<GlobalRefreshCubit, int>(
                listener: (context, state) {
                  if (state == 1) {
                    context
                        .read<HomeCategoryCubit>()
                        .getHomeCategories();
                  }
                },
                child: ConstrainedBox(
                  constraints:
                  BoxConstraints(maxHeight: context.isDesktop ? 150 : 100),
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) =>
                        CategoryItem(category: state.categories[index]),
                    itemCount: state.categories.length,
                  ),
                ),
              ),
          HomeCategoryError error =>
              ErrorStateHandler(
                errorMessage: error.message,
                child: CategoryShimmerWidget(
                  isAnimated: false,
                ),
                onRetry: () =>
                    context.read<HomeCategoryCubit>().getHomeCategories(),
              ),
        };
      },
    );
  }
}
