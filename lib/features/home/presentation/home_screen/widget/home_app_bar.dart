import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:stackfood/core/global/constants/app_size.dart';
import 'package:stackfood/core/global/constants/app_spacing.dart';
import 'package:stackfood/core/global/extension/context_extension.dart';
import 'package:stackfood/core/global/theme/app_colors.dart';
import 'package:stackfood/core/global/widgets/app_text_widget.dart';

class HomeAppBar extends StatelessWidget {
  const HomeAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      elevation: 0,

      /// This would obtain the behavior of Stack Food Mobile Demo I assume.
      // forceMaterialTransparency: true,
      scrolledUnderElevation: 0,
      forceElevated: false,
      title: const _TopHeaderAppBarSection(),
      surfaceTintColor: Colors.transparent,
      floating: true,
      pinned: true,
      primary: true,
      collapsedHeight: 56,
      expandedHeight: 110,
      bottom: PreferredSize(
        preferredSize: const Size.fromHeight(0),
        child: SizedBox(
          height: 56,
          child: _BottomSearchBarPart(),
        ),
      ),
      flexibleSpace: FlexibleSpaceBar(
        background: Container(
          color: Colors.transparent,
        ),
      ),
    );
  }
}

class _BottomSearchBarPart extends StatelessWidget {
  const _BottomSearchBarPart();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        left: AppSpacing.md,
        right: AppSpacing.md,
        bottom: AppSpacing.sm,
      ),
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
    );
  }
}

class _TopHeaderAppBarSection extends StatelessWidget {
  const _TopHeaderAppBarSection();

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            const Icon(Icons.home, color: Colors.grey),
            const SizedBox(width: 8),
            SizedBox(
              width: context.screenWidth * 0.5,
              child: AppText(
                "76A eighth avenue, New York, US",
                style: AppTextStyle.titleSmall,
                overflow: TextOverflow.ellipsis,
                maxLines: 1,
                color: context.theme.dividerColor.withOpacity(0.6),
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
