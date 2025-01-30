import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stackfood/core/global/logger/logger.dart';
import 'package:stackfood/features/home/domain/entity/restaurant_entity.dart';
import 'package:stackfood/features/home/domain/repository/home_repo.dart';

part 'restaurant_home_state.dart';

class RestaurantHomeCubit extends Cubit<RestaurantHomeState> {
  final HomeRepository _homeRepository;
  int _currentPage = 1;
  final int _limit = 3;
  bool _isFetching = false;

  RestaurantHomeCubit({required HomeRepository homeRepository})
      : _homeRepository = homeRepository,
        super(RestaurantHomeInitial());

  void getRestaurants({bool isPagination = false}) async {
    if (_isFetching) return;

    final currentState = state;
    List<RestaurantEntity> oldRestaurants = [];

    if (currentState is RestaurantHomeLoaded) {
      oldRestaurants = currentState.restaurants;
      if (currentState.hasReachedMax) return;
    }

    emit(RestaurantHomeLoaded(
      restaurants: oldRestaurants,
      hasReachedMax: false,
      isLoading: true,
    ));

    _isFetching = true;

    try {
      final offset = (_currentPage - 1) * _limit;
      logE("Fetching restaurants: page $_currentPage, offset $offset");

      final response = await _homeRepository.getRestaurants(
        offset: offset,
        limit: _limit,
      );

      response.fold(
        (failure) {
          emit(RestaurantHomeError(message: failure.message));
          _isFetching = false;
        },
        (restaurants) {
          _currentPage++;
          final hasReachedMax = restaurants.length < _limit;

          emit(RestaurantHomeLoaded(
            restaurants: oldRestaurants + restaurants,
            hasReachedMax: hasReachedMax,
            isLoading: false,
          ));

          _isFetching = false;
        },
      );
    } catch (e) {
      emit(RestaurantHomeError(message: e.toString()));
      _isFetching = false;
    }
  }
}
