import 'package:flutter/material.dart';
import 'package:stackfood/core/global/constants/app_strings.dart';

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
              behavior: SnackBarBehavior.floating,
              content: Text(errorMessage),
              action: SnackBarAction(
                label: AppStrings.retry,
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
              visualDensity: VisualDensity.compact,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              side: BorderSide.none,
            ),
            onPressed: onRetry,
            label: const Text(AppStrings.retry),
            icon: const Icon(Icons.running_with_errors_rounded),
          ),
        ),
      ],
    );
  }
}
