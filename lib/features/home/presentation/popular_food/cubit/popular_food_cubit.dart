import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stackfood/features/home/domain/entity/popular_product_entity.dart';
import 'package:stackfood/features/home/domain/repository/home_repo.dart';

part 'popular_food_state.dart';

class PopularFoodCubit extends Cubit<PopularFoodState> {
  final HomeRepository _homeRepository;

  PopularFoodCubit({
    required HomeRepository homeRepository,
  })  : _homeRepository = homeRepository,
        super(PopularFoodInitial());

  Future<void> getPopularFoodNearby() async {
    emit(PopularFoodLoading());

    try {
      final popularProductsOrFailure =
          await _homeRepository.getHomePopularProducts();

      popularProductsOrFailure.fold(
        (failure) => emit(PopularFoodError(failure.message)),
        (popularProducts) => emit(PopularFoodLoaded(popularProducts)),
      );
    } catch (e) {
      emit(PopularFoodError("Unexpected error: ${e.toString()}"));
    }
  }
}
