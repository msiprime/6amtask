part of 'home_category_cubit.dart';

@immutable
sealed class HomeCategoryState extends Equatable {
  const HomeCategoryState();
}

final class HomeCategoryInitial extends HomeCategoryState {
  const HomeCategoryInitial();

  @override
  List<Object?> get props => [];
}

final class HomeCategoryLoading extends HomeCategoryState {
  const HomeCategoryLoading();

  @override
  List<Object?> get props => [];
}

final class HomeCategoryLoaded extends HomeCategoryState {
  final List<CategoryEntity> categories;

  const HomeCategoryLoaded(this.categories);

  @override
  List<Object?> get props => [categories];
}

final class HomeCategoryError extends HomeCategoryState {
  final String message;

  const HomeCategoryError(this.message);

  @override
  List<Object?> get props => [message];
}
