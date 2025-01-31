import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stackfood/core/global/constants/app_strings.dart';
import 'package:stackfood/features/home/presentation/restaurant/cubit/restaurant_home_cubit.dart';

class ErrorRestaurantWidget extends StatelessWidget {
  const ErrorRestaurantWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Center(
        child: FilledButton.tonalIcon(
          style: ButtonStyle(visualDensity: VisualDensity.compact),
          onPressed: () => context
              .read<RestaurantHomeCubit>()
              .getRestaurants(isRefresh: true),
          label: Text(AppStrings.retry),
          icon: const Icon(Icons.refresh_sharp),
        ),
      ),
    );
  }
}
