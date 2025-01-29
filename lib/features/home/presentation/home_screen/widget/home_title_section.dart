import 'package:flutter/material.dart';
import 'package:stackfood/core/global/extension/context_extension.dart';

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
    // todo: dynamic padding
    return Padding(
      /// Since Material Widget takes 8 gap by default, I subtracted 8 from the right side.
      padding: const EdgeInsets.only(left: 12, right: 4),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: context.theme.textTheme.titleMedium?.copyWith(
              fontWeight: FontWeight.w600,
              fontSize: 18,
            ),
          ),
          // todo: dynamic Colors / app colors
          TextButton(
            style: TextButton.styleFrom(
              visualDensity: VisualDensity.compact,
              splashFactory: InkSplash.splashFactory,
              tapTargetSize: MaterialTapTargetSize.shrinkWrap,
            ),
            onPressed: onViewAllTap,
            child: Text(
              'View All',
              style: context.theme.textTheme.titleMedium?.copyWith(
                color: Colors.green,
                decoration: TextDecoration.underline,
                decorationColor: Colors.green,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
