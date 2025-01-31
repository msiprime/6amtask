import 'package:flutter/material.dart';
import 'package:stackfood/core/global/constants/app_size.dart';
import 'package:stackfood/core/global/constants/app_strings.dart';
import 'package:stackfood/core/global/theme/app_colors.dart';
import 'package:stackfood/core/global/widgets/app_text_widget.dart';

class ErrorStateHandler extends StatelessWidget {
  final Widget child;
  final VoidCallback? onRetry;
  final String errorMessage;

  const ErrorStateHandler({
    super.key,
    required this.child,
    this.errorMessage = AppStrings.somethingWentWrong,
    this.onRetry,
  });

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (errorMessage.isNotEmpty) {
        ScaffoldMessenger.of(context)
          ..hideCurrentSnackBar(reason: SnackBarClosedReason.dismiss)
          ..showSnackBar(
            SnackBar(
              backgroundColor: AppColors.orangeAccent,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(AppSize.xxxs),
              ),
              behavior: SnackBarBehavior.floating,
              hitTestBehavior: HitTestBehavior.opaque,
              content: AppText(
                style: AppTextStyle.titleMedium,
                errorMessage,
                color: AppColors.white,
              ),
              action: SnackBarAction(
                label: AppStrings.retry,
                backgroundColor: AppColors.white,
                textColor: AppColors.green,
                onPressed: onRetry ?? () {},
              ),
            ),
          );
      }
    });
    return Stack(
      alignment: Alignment.center,
      children: [
        child,
        Positioned(
          child: FilledButton.tonalIcon(
            style: OutlinedButton.styleFrom(
              backgroundColor: AppColors.green,
              foregroundColor: AppColors.white,
              visualDensity: VisualDensity.compact,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              side: BorderSide.none,
            ),
            onPressed: onRetry,
            label: const Text(AppStrings.retry),
            icon: const Icon(
              Icons.running_with_errors_rounded,
              color: AppColors.white,
            ),
          ),
        ),
      ],
    );
  }
}
