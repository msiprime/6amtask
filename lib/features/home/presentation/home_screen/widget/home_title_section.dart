import 'package:flutter/material.dart';
import 'package:stackfood/core/global/constants/app_spacing.dart';
import 'package:stackfood/core/global/constants/app_strings.dart';
import 'package:stackfood/core/global/theme/app_colors.dart';
import 'package:stackfood/core/global/widgets/app_text_widget.dart';

class HomeTitleSectionWithViewAll extends StatelessWidget {
  final String title;
  final VoidCallback? onViewAllTap;

  const HomeTitleSectionWithViewAll({
    super.key,
    required this.title,
    this.onViewAllTap,
  });

  @override
  Widget build(BuildContext context) {
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
              style: AppTextStyle.titleMedium,
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
}
