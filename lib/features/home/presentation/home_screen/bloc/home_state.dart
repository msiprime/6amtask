part of 'home_bloc.dart';

@immutable
sealed class HomeState extends Equatable {}

final class HomeInitial extends HomeState {
  @override
  List<Object?> get props => [];
}

class HomeLoading extends HomeState {
  @override
  List<Object?> get props => [];
}

class HomeLoaded extends HomeState {
  HomeLoaded();

  @override
  List<Object?> get props => [];
}

class HomeError extends HomeState {
  final String message;

  HomeError({
    required this.message,
  });

  @override
  List<Object?> get props => [message];
}
