import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:stackfood/core/global/constants/app_size.dart';
import 'package:stackfood/core/global/constants/app_spacing.dart';
import 'package:stackfood/core/global/extension/context_extension.dart';
import 'package:stackfood/core/global/theme/app_colors.dart';

class TopHomeAppBar extends StatelessWidget {
  const TopHomeAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      elevation: 0,
      scrolledUnderElevation: 0,
      title: const TopHeaderAppBarSection(),
      floating: true,
      pinned: false,
      primary: true,
      collapsedHeight: 56,
      expandedHeight: 56,
      stretch: true,
    );
  }
}

class HomeSearchAppBar extends StatelessWidget {
  const HomeSearchAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      stretch: true,
      elevation: 0,
      scrolledUnderElevation: 0,
      titleSpacing: 0,
      floating: false,
      pinned: true,
      toolbarHeight: 80,
      title: Padding(
        padding: const EdgeInsets.symmetric(
            horizontal: AppSpacing.lg, vertical: AppSpacing.lg),
        child: SearchAnchor(
          suggestionsBuilder: (context, controller) => Future.value([]),
          builder: (context, controller) => SearchBar(
            controller: controller,
            shadowColor: WidgetStatePropertyAll(AppColors.red),
            scrollPadding: const EdgeInsets.all(AppSpacing.lg),
            elevation: WidgetStatePropertyAll(0),
            trailing: [
              IconButton(
                icon: const Icon(CupertinoIcons.search),
                onPressed: () {},
              ),
            ],
            shape: WidgetStatePropertyAll(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
            ),
            padding: WidgetStatePropertyAll(
                const EdgeInsets.symmetric(horizontal: AppSpacing.md)),
            hintStyle: WidgetStatePropertyAll(
              const TextStyle(
                fontSize: 16,
                color: AppColors.grey,
              ),
            ),
            hintText: 'Search for food, restaurants, etc.',
            backgroundColor: WidgetStatePropertyAll(Colors.white),
          ),
        ),
      ),
    );
  }
}

class TopHeaderAppBarSection extends StatelessWidget {
  const TopHeaderAppBarSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            const Icon(Icons.home, color: Colors.grey),
            const SizedBox(width: 8),
            Text(
              "76A eighth avenue, New York, US",
              style: context.theme.textTheme.titleSmall?.copyWith(
                color: Colors.grey,
              ),
            ),
          ],
        ),
        Stack(
          children: [
            const Icon(
              CupertinoIcons.bell_solid,
              size: AppSize.md,
            ),
            Positioned(
              top: 1,
              right: 2,
              child: Badge(
                smallSize: AppSize.xxxs,
                backgroundColor: Colors.red,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
