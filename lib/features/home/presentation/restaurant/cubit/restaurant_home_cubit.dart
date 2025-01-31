import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stackfood/features/home/domain/entity/restaurant_entity.dart';
import 'package:stackfood/features/home/domain/repository/home_repo.dart';

part 'restaurant_home_state.dart';

class RestaurantHomeCubit extends Cubit<RestaurantHomeState> {
  final HomeRepository _homeRepository;
  final int _limit = 10;
  int _offset = 1;
  bool _isFetching = false;

  RestaurantHomeCubit({required HomeRepository homeRepository})
      : _homeRepository = homeRepository,
        super(const RestaurantHomeState.initial());

  void getRestaurants({bool isRefresh = false}) async {
    if (_isFetching || (!state.hasMoreData && !isRefresh)) return;

    _isFetching = true;

    if (isRefresh) {
      _offset = 1;
      emit(state.copyWith(
        restaurantList: [],
        hasMoreData: true,
        isLoading: true,
        errorMessage: '',
      ));
    } else {
      emit(state.copyWith(isLoading: true));
    }

    try {
      final response = await _homeRepository.getRestaurants(
        offset: _offset,
        limit: _limit,
      );

      response.fold(
        (failure) {
          emit(state.copyWith(
            errorMessage: failure.message,
            isLoading: false,
          ));
        },
        (restaurantResponse) {
          final newRestaurants = restaurantResponse.restaurants;
          final updatedList = isRefresh
              ? newRestaurants
              : [...state.restaurantList, ...newRestaurants];

          emit(state.copyWith(
            restaurantList: updatedList,
            hasMoreData: newRestaurants.length == _limit,
            isLoading: false,
          ));

          if (newRestaurants.isNotEmpty) {
            _offset += 1;
          }
        },
      );
    } catch (e) {
      emit(state.copyWith(
        errorMessage: e.toString(),
        isLoading: false,
      ));
    } finally {
      _isFetching = false;
    }
  }
}
