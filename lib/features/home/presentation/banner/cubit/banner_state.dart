part of 'banner_cubit.dart';

sealed class BannerState extends Equatable {
  const BannerState();
}

final class BannerInitial extends BannerState {
  @override
  List<Object> get props => [];
}

final class BannerLoading extends BannerState {
  @override
  List<Object> get props => [];
}

final class BannerLoaded extends BannerState {
  final List<BannerEntity> banners;

  const BannerLoaded(this.banners);

  @override
  List<Object> get props => [banners];
}

final class BannerError extends BannerState {
  final String message;

  const BannerError(this.message);

  @override
  List<Object> get props => [message];
}
