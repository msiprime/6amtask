import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stackfood/features/home/domain/entity/banner_entity.dart';
import 'package:stackfood/features/home/domain/repository/home_repo.dart';

part 'home_banner_state.dart';

class HomeBannerCubit extends Cubit<HomeBannerState> {
  final HomeRepository _homeRepository;

  HomeBannerCubit({
    required HomeRepository homeRepository,
  })  : _homeRepository = homeRepository,
        super(BannerInitial());

  Future<void> getBanners() async {
    emit(BannerLoading());
    try {
      final banners = await _homeRepository.getHomeBanners();

      banners.fold(
        (failure) => emit(BannerError(failure.message)),
        (banners) => emit(BannerLoaded(banners)),
      );
    } catch (e) {
      emit(BannerError(e.toString()));
    }
  }
}
