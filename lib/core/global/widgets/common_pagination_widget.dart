import 'package:flutter/material.dart';

class CommonPaginationWidget extends StatelessWidget {
  const CommonPaginationWidget({
    super.key,
    required this.scrollController,
    required this.onPaginate,
    this.scrollStartThreshold = 0.8,
    required this.child,
  }) : assert(scrollStartThreshold <= 1);
  final ScrollController scrollController;
  final VoidCallback onPaginate;
  final double scrollStartThreshold;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return NotificationListener<ScrollEndNotification>(
        onNotification: (ScrollEndNotification notification) {
          if (scrollController.position.pixels >=
              scrollController.position.maxScrollExtent *
                  scrollStartThreshold) {
            onPaginate();
          }
          return true;
        },
        child: child);
  }
}
