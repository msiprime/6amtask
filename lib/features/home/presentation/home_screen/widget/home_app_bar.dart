import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:stackfood/core/global/constants/app_size.dart';
import 'package:stackfood/core/global/constants/app_spacing.dart';
import 'package:stackfood/core/global/constants/app_strings.dart';
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
      child: TextFormField(
        decoration: _buildInputDecoration(),
      ),
    );
  }

  InputDecoration _buildInputDecoration() {
    return InputDecoration(
      hintStyle: TextStyle(
        color: AppColors.grey,
        fontSize: AppSize.xs,
      ),
      hintText: AppStrings.searchForFoodRestaurant,
      suffixIcon: const Icon(
        CupertinoIcons.search,
        color: AppColors.grey,
      ),
      filled: true,
      fillColor: AppColors.white,
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(AppSize.xxxs),
        borderSide: BorderSide.none,
      ),
      contentPadding: const EdgeInsets.symmetric(
        horizontal: AppSpacing.lg,
        vertical: AppSpacing.xxs,
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
        Expanded(
          child: Row(
            children: [
              const Icon(Icons.home, color: AppColors.grey),
              const SizedBox(width: 8),
              Expanded(
                child: AppText(
                  "76A eighth avenue, New York, US",
                  style: AppTextStyle.titleSmall,
                  color: context.theme.dividerColor.withOpacity(0.6),
                ),
              ),
            ],
          ),
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
