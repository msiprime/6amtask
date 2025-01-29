part of 'popular_food_cubit.dart';

@immutable
sealed class PopularFoodState extends Equatable {
  const PopularFoodState();
}

final class PopularFoodInitial extends PopularFoodState {
  @override
  List<Object?> get props => [];
}

final class PopularFoodLoading extends PopularFoodState {
  @override
  List<Object?> get props => [];
}

final class PopularFoodLoaded extends PopularFoodState {
  final List<PopularFoodEntity> popularProducts;

  const PopularFoodLoaded(this.popularProducts);

  @override
  List<Object?> get props => [popularProducts];
}

final class PopularFoodError extends PopularFoodState {
  final String message;

  const PopularFoodError(this.message);

  @override
  List<Object?> get props => [message];
}
