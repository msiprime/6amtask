part of 'restaurant_home_cubit.dart';

@immutable
sealed class RestaurantHomeState extends Equatable {
  const RestaurantHomeState();
}

final class RestaurantHomeInitial extends RestaurantHomeState {
  const RestaurantHomeInitial();

  @override
  List<Object> get props => [];
}

final class RestaurantHomeLoading extends RestaurantHomeState {
  @override
  List<Object> get props => [];
}

final class RestaurantHomeLoaded extends RestaurantHomeState {
  final List<RestaurantEntity> restaurants;

  const RestaurantHomeLoaded({
    required this.restaurants,
  });

  @override
  List<Object> get props => [restaurants];
}

final class RestaurantHomeError extends RestaurantHomeState {
  final String message;

  const RestaurantHomeError({
    required this.message,
  });

  @override
  List<Object> get props => [message];
}
