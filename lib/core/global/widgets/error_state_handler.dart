import 'package:flutter/material.dart';

class ErrorStateHandler extends StatelessWidget {
  final Widget child;
  final VoidCallback? onRetry;

  const ErrorStateHandler({
    super.key,
    required this.child,
    this.onRetry,
  });

  @override
  Widget build(BuildContext context) {
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
            label: const Text('Retry'),
            icon: const Icon(Icons.refresh_sharp),
          ),
        ),
      ],
    );
  }
}
