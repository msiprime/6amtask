part of 'restaurant_home_cubit.dart';

@immutable
class RestaurantHomeState extends Equatable {
  final List<RestaurantEntity> restaurantList;
  final bool isLoading;
  final bool hasMoreData;
  final String errorMessage;

  const RestaurantHomeState({
    required this.restaurantList,
    required this.isLoading,
    required this.hasMoreData,
    required this.errorMessage,
  });

  const RestaurantHomeState.initial()
      : restaurantList = const [],
        isLoading = false,
        hasMoreData = true,
        errorMessage = '';

  RestaurantHomeState copyWith({
    List<RestaurantEntity>? restaurantList,
    bool? isLoading,
    bool? hasMoreData,
    String? errorMessage,
  }) {
    return RestaurantHomeState(
      restaurantList: restaurantList ?? this.restaurantList,
      isLoading: isLoading ?? this.isLoading,
      hasMoreData: hasMoreData ?? this.hasMoreData,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }

  @override
  List<Object?> get props => [
        restaurantList,
        isLoading,
        hasMoreData,
        errorMessage,
      ];
}
