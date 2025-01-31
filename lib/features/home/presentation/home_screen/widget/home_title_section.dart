import 'package:flutter/material.dart';
import 'package:stackfood/core/global/constants/app_spacing.dart';
import 'package:stackfood/core/global/constants/app_strings.dart';
import 'package:stackfood/core/global/theme/app_colors.dart';
import 'package:stackfood/core/global/widgets/app_text_widget.dart';

class HomeTitleSection extends StatelessWidget {
  final String title;
  final VoidCallback? onViewAllTap;

  const HomeTitleSection({
    super.key,
    required this.title,
    this.onViewAllTap,
  });

  @override
  Widget build(BuildContext context) {
    return SliverPersistentHeader(
      delegate:
          _CustomSliverHeaderDelegate(title: title, onViewAllTap: onViewAllTap),
    );
  }
}

class _CustomSliverHeaderDelegate extends SliverPersistentHeaderDelegate {
  final String title;
  final VoidCallback? onViewAllTap;

  _CustomSliverHeaderDelegate({
    required this.title,
    this.onViewAllTap,
  });

  @override
  double get minExtent => 40.0;

  @override
  double get maxExtent => 40.0;

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Padding(
      /// Since Material Widget takes 8 gap by default, I subtracted 8 from the right side.
      padding: const EdgeInsets.only(left: AppSpacing.md, right: AppSpacing.xs),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: AppText(
              title,
              style: AppTextStyle.titleLarge,
              fontSize: 18.0,
              fontWeight: FontWeight.w600,
            ),
          ),
          TextButton(
            style: TextButton.styleFrom(
              visualDensity: VisualDensity.compact,
              splashFactory: InkSplash.splashFactory,
              tapTargetSize: MaterialTapTargetSize.shrinkWrap,
            ),
            onPressed: onViewAllTap,
            child: AppText(
              AppStrings.viewAll,
              color: AppColors.green,
              fontWeight: FontWeight.w500,
              style: AppTextStyle.titleMedium,
              decoration: TextDecoration.underline,
              decorationColor: AppColors.green,
            ),
          ),
        ],
      ),
    );
  }

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) {
    return false;
  }
}
