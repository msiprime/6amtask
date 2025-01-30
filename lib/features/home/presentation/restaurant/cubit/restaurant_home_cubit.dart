import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stackfood/features/home/domain/entity/restaurant_entity.dart';
import 'package:stackfood/features/home/domain/repository/home_repo.dart';

part 'restaurant_home_state.dart';

class RestaurantHomeCubit extends Cubit<RestaurantHomeState> {
  final HomeRepository _homeRepository;

  RestaurantHomeCubit({
    required HomeRepository homeRepository,
  })  : _homeRepository = homeRepository,
        super(const RestaurantHomeInitial());

  void getRestaurants() async {
    try {
      emit(RestaurantHomeLoading());
      final response = await _homeRepository.getRestaurants();
      response.fold(
        (failure) => emit(RestaurantHomeError(message: failure.message)),
        (restaurants) => emit(RestaurantHomeLoaded(restaurants: restaurants)),
      );
    } catch (e) {
      emit(RestaurantHomeError(message: e.toString()));
    }
  }
}
