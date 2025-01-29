import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stackfood/core/di/injection_container.dart';
import 'package:stackfood/core/global/extension/context_extension.dart';
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
          HomeCategoryLoaded() => _buildCategoryGrid(state.categories, context),
          HomeCategoryError() => _buildErrorWidget(state.message),
        };
      },
    );
  }

  /// Builds the category grid with optimized layout
  Widget _buildCategoryGrid(
      List<CategoryEntity> categories, BuildContext context) {
    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        crossAxisSpacing: 12,
        mainAxisSpacing: 12,
        childAspectRatio: 0.85,
      ),
      itemCount: categories.length,
      itemBuilder: (context, index) {
        final category = categories[index];
        return _CategoryItem(category: category);
      },
    );
  }

  /// Shows an error message with retry button
  Widget _buildErrorWidget(String message) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(message, style: const TextStyle(color: Colors.red)),
          const SizedBox(height: 8),
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

  const _CategoryItem({required this.category});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Container(
          height: 60,
          width: 60,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(16),
            boxShadow: const [
              BoxShadow(color: Colors.black12, blurRadius: 4),
            ],
          ),
          child: Center(
            child: Image.network(
              category.imageFullUrl,
              height: 40,
              width: 40,
              fit: BoxFit.contain,
              errorBuilder: (context, error, stackTrace) =>
                  const Icon(Icons.broken_image, color: Colors.red),
            ),
          ),
        ),
        const SizedBox(height: 6),
        Text(
          category.name,
          softWrap: true,
          overflow: TextOverflow.ellipsis,
          textAlign: TextAlign.center,
          style: context.theme.textTheme.titleMedium,
        ),
      ],
    );
  }
}
