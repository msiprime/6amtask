part of 'restaurant_home_cubit.dart';

@immutable
sealed class RestaurantHomeState extends Equatable {}

final class RestaurantHomeInitial extends RestaurantHomeState {
  @override
  List<Object?> get props => [];
}

class RestaurantHomeLoading extends RestaurantHomeState {
  @override
  List<Object?> get props => [];
}

class RestaurantHomeLoaded extends RestaurantHomeState {
  final List<RestaurantEntity> restaurants;
  final bool hasReachedMax;
  final bool isLoading;

  RestaurantHomeLoaded({
    required this.restaurants,
    required this.hasReachedMax,
    this.isLoading = false,
  });

  @override
  List<Object?> get props => [restaurants, hasReachedMax, isLoading];
}

class RestaurantHomeError extends RestaurantHomeState {
  final String message;

  RestaurantHomeError({
    required this.message,
  });

  @override
  List<Object?> get props => [message];
}
