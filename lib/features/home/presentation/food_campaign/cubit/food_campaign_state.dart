part of 'food_campaign_cubit.dart';

sealed class FoodCampaignState extends Equatable {
  const FoodCampaignState();
}

final class FoodCampaignInitial extends FoodCampaignState {
  const FoodCampaignInitial();

  @override
  List<Object> get props => [];
}

final class FoodCampaignLoading extends FoodCampaignState {
  const FoodCampaignLoading();

  @override
  List<Object> get props => [];
}

final class FoodCampaignLoaded extends FoodCampaignState {
  final List<CampaignEntity> campaigns;

  const FoodCampaignLoaded({
    required this.campaigns,
  });

  @override
  List<Object> get props => [campaigns];
}

final class FoodCampaignError extends FoodCampaignState {
  final String message;

  const FoodCampaignError(this.message);

  @override
  List<Object> get props => [message];
}
