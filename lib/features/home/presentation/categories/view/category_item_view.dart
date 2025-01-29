import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stackfood/core/di/injection_container.dart';
import 'package:stackfood/core/global/constants/app_spacing.dart';
import 'package:stackfood/core/global/extension/context_extension.dart';
import 'package:stackfood/core/global/widgets/image_thumbnail.dart';
import 'package:stackfood/features/home/data/repository/home_repo_impl.dart';
import 'package:stackfood/features/home/domain/entity/category_entity.dart';
import 'package:stackfood/features/home/presentation/categories/cubit/home_category_cubit.dart';

class CategoryItemSection extends StatelessWidget {
  const CategoryItemSection({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          HomeCategoryCubit(homeRepository: sl.get<HomeRepositoryImpl>())
            ..getHomeCategories(),
      child: const CategoryItemView(),
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
          HomeCategoryInitial() || HomeCategoryLoading() => const Center(
              child: CircularProgressIndicator.adaptive(),
            ),
          HomeCategoryLoaded() => ConstrainedBox(
              constraints: BoxConstraints(maxHeight: 100),
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) =>
                    _CategoryItem(category: state.categories[index]),
                itemCount: state.categories.length,
              ),
            ),
          HomeCategoryError() => CategoryErrorWidget(message: state.message),
        };
      },
    );
  }
}

class CategoryErrorWidget extends StatelessWidget {
  final String message;

  const CategoryErrorWidget({
    super.key,
    required this.message,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(message, style: const TextStyle(color: Colors.red)),
          const SizedBox(height: AppSpacing.sm),
          ElevatedButton(
            onPressed: () => sl.get<HomeCategoryCubit>().getHomeCategories(),
            child: const Text("Retry"),
          ),
        ],
      ),
    );
  }
}

class _CategoryItem extends StatelessWidget {
  final CategoryEntity category;

  const _CategoryItem({
    required this.category,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: AppSpacing.md),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            height: 60,
            width: 60,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(AppSpacing.lg),
              boxShadow: const [
                BoxShadow(
                    color: Colors.black12, blurRadius: 4, offset: Offset(0, 2)),
              ],
            ),
            child: Center(
              child: CustomImageWidget(
                borderRadius: BorderRadius.circular(16),
                imageUrl: category.imageFullUrl,
                fit: BoxFit.contain,
              ),
            ),
          ),
          const SizedBox(height: AppSpacing.md),
          Expanded(
            child: Text(
              category.name,
              softWrap: true,
              overflow: TextOverflow.ellipsis,
              textAlign: TextAlign.center,
              style: context.theme.textTheme.labelLarge,
            ),
          ),
        ],
      ),
    );
  }
}
