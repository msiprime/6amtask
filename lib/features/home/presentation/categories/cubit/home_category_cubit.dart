import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stackfood/features/home/domain/entity/category_entity.dart';
import 'package:stackfood/features/home/domain/repository/home_repo.dart';

part 'home_category_state.dart';

class HomeCategoryCubit extends Cubit<HomeCategoryState> {
  final HomeRepository _homeRepository;

  HomeCategoryCubit({
    required HomeRepository homeRepository,
  })  : _homeRepository = homeRepository,
        super(HomeCategoryInitial());

  Future<void> getHomeCategories() async {
    emit(HomeCategoryLoading());
    try {
      final categories = await _homeRepository.getHomeCategories();
      categories.fold(
        (failure) => emit(HomeCategoryError(failure.message)),
        (categories) => emit(HomeCategoryLoaded(categories)),
      );
    } catch (e) {
      emit(HomeCategoryError(e.toString()));
    }
  }
}
