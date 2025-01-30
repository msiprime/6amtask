import 'package:fpdart/fpdart.dart';
import 'package:stackfood/core/global/exception/failures.dart';
import 'package:stackfood/features/home/domain/entity/banner_entity.dart';
import 'package:stackfood/features/home/domain/entity/campaign_entity.dart';
import 'package:stackfood/features/home/domain/entity/category_entity.dart';
import 'package:stackfood/features/home/domain/entity/popular_product_entity.dart';
import 'package:stackfood/features/home/domain/entity/restaurant_entity.dart';

abstract interface class HomeRepository {
  /// Get home banners
  Future<Either<Failure, List<BannerEntity>>> getHomeBanners();

  /// Get home categories
  Future<Either<Failure, List<CategoryEntity>>> getHomeCategories();

  /// Get home popular products
  Future<Either<Failure, List<PopularFoodEntity>>> getHomePopularProducts();

  /// Get Food Campaigns
  Future<Either<Failure, List<CampaignEntity>>> getFoodCampaigns();

  /// Get Restaurants
  Future<Either<Failure, List<RestaurantEntity>>> getRestaurants({
    required int offset,
    required int limit,
  });
}
