part of 'home_banner_cubit.dart';

@immutable
sealed class HomeBannerState extends Equatable {
  const HomeBannerState();
}

final class BannerInitial extends HomeBannerState {
  @override
  List<Object> get props => [];
}

final class BannerLoading extends HomeBannerState {
  @override
  List<Object> get props => [];
}

final class BannerLoaded extends HomeBannerState {
  final List<BannerEntity> banners;

  const BannerLoaded(this.banners);

  @override
  List<Object> get props => [banners];
}

final class BannerError extends HomeBannerState {
  final String message;

  const BannerError(this.message);

  @override
  List<Object> get props => [message];
}
