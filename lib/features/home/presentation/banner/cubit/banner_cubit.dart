import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stackfood/features/home/domain/entity/banner_entity.dart';
import 'package:stackfood/features/home/domain/repository/home_repo.dart';

part 'banner_state.dart';

class BannerCubit extends Cubit<BannerState> {
  final HomeRepository _homeRepository;

  BannerCubit({
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
