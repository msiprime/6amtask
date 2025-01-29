import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stackfood/features/home/domain/entity/campaign_entity.dart';
import 'package:stackfood/features/home/domain/repository/home_repo.dart';

part 'food_campaign_state.dart';

class FoodCampaignCubit extends Cubit<FoodCampaignState> {
  final HomeRepository _homeRepository;

  FoodCampaignCubit({
    required HomeRepository homeRepository,
  })  : _homeRepository = homeRepository,
        super(const FoodCampaignInitial());

  Future<void> getFoodCampaigns() async {
    emit(const FoodCampaignLoading());
    try {
      final response = await _homeRepository.getFoodCampaigns();
      response.fold(
        (failure) => emit(FoodCampaignError(failure.message)),
        (campaigns) => emit(FoodCampaignLoaded(campaigns: campaigns)),
      );
    } catch (e) {
      emit(FoodCampaignError("Unexpected error: ${e.toString()}"));
    }
  }
}
