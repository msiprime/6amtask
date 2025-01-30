import 'dart:core';

import 'package:fpdart/fpdart.dart';
import 'package:stackfood/core/global/exception/failures.dart';
import 'package:stackfood/core/global/logger/logger.dart';
import 'package:stackfood/features/home/data/datasources/home_datasource.dart';
import 'package:stackfood/features/home/data/model/banner_model.dart';
import 'package:stackfood/features/home/data/model/campaign_model.dart';
import 'package:stackfood/features/home/data/model/categories_model.dart';
import 'package:stackfood/features/home/data/model/product_model.dart';
import 'package:stackfood/features/home/data/model/response/banner_response.dart';
import 'package:stackfood/features/home/data/model/response/popular_item_response.dart';
import 'package:stackfood/features/home/data/model/response/restaurant_response.dart';
import 'package:stackfood/features/home/data/model/restaurant_model.dart';
import 'package:stackfood/features/home/domain/entity/banner_entity.dart';
import 'package:stackfood/features/home/domain/entity/campaign_entity.dart';
import 'package:stackfood/features/home/domain/entity/category_entity.dart';
import 'package:stackfood/features/home/domain/entity/popular_product_entity.dart';
import 'package:stackfood/features/home/domain/entity/restaurant_entity.dart';
import 'package:stackfood/features/home/domain/repository/home_repo.dart';

class HomeRepositoryImpl implements HomeRepository {
  final HomeDataSource _homeDataSource;

  HomeRepositoryImpl({
    required HomeDataSource homeDataSource,
  }) : _homeDataSource = homeDataSource;

  @override
  Future<Either<Failure, List<BannerEntity>>> getHomeBanners() async {
    try {
      final response = await _homeDataSource.getHomeBanners();

      if (response.statusCode == 200) {
        final BannerResponse bannerResponse =
            BannerResponse.fromJson(response.data as Map<String, dynamic>);

        final List<BannerModel> banners = bannerResponse.banners ?? [];

        final List<BannerEntity> bannersEntity =
            banners.map((banner) => banner.toEntity()).toList();

        return Right(bannersEntity);
      }

      return Left(
          ServerFailure("${response.statusMessage} : ${response.statusCode}"));
    } catch (e) {
      return Left(ServerFailure("Unexpected error: ${e.toString()}"));
    }
  }

  @override
  Future<Either<Failure, List<CategoryEntity>>> getHomeCategories() async {
    try {
      final response = await _homeDataSource.getHomeCategories();

      if (response.statusCode == 200) {
        final data = response.data as List<dynamic>;

        final List<CategoryModel> categories =
            data.map((category) => CategoryModel.fromJson(category)).toList();

        final List<CategoryEntity> categoriesEntity =
            categories.map((category) => category.toEntity()).toList();

        return Right(categoriesEntity);
      }

      return Left(
          ServerFailure("${response.statusMessage} : ${response.statusCode}"));
    } catch (e) {
      return Left(ServerFailure("Unexpected error: ${e.toString()}"));
    }
  }

  @override
  Future<Either<Failure, List<PopularFoodEntity>>>
      getHomePopularProducts() async {
    try {
      final response = await _homeDataSource.getHomePopularProducts();

      if (response.statusCode == 200) {
        final data = response.data as Map<String, dynamic>;

        final PopularItemResponse popularProducts =
            PopularItemResponse.fromJson(data);

        final List<ProductModel> products = popularProducts.products ?? [];

        final List<PopularFoodEntity> popularProductsEntity =
            products.map((product) => product.toEntity()).toList();

        return Right(popularProductsEntity);
      }

      return Left(
          ServerFailure("${response.statusMessage} : ${response.statusCode}"));
    } catch (e) {
      return Left(ServerFailure("Unexpected error: ${e.toString()}"));
    }
  }

  @override
  Future<Either<Failure, List<CampaignEntity>>> getFoodCampaigns() async {
    try {
      final response = await _homeDataSource.getHomeFoodCampaigns();

      if (response.statusCode == 200) {
        final data = response.data as List<dynamic>;

        final List<CampaignModel> campaigns =
            data.map((campaign) => CampaignModel.fromJson(campaign)).toList();

        final List<CampaignEntity> campaignsEntity =
            campaigns.map((campaign) => campaign.toEntity()).toList();

        return Right(campaignsEntity);
      }

      return Left(
          ServerFailure("${response.statusMessage} : ${response.statusCode}"));
    } catch (e) {
      return Left(ServerFailure("Unexpected error: ${e.toString()}"));
    }
  }

  @override
  Future<Either<Failure, List<RestaurantEntity>>> getRestaurants({
    required int offset,
    required int limit,
  }) async {
    try {
      final response = await _homeDataSource.getHomeRestaurants(
        offset: offset,
        limit: limit,
      );

      if (response.statusCode == 200) {
        final data = response.data as Map<String, dynamic>;

        final RestaurantResponse restaurantResponse =
            RestaurantResponse.fromJson(data);

        logE(restaurantResponse);

        final List<RestaurantModel> restaurants =
            restaurantResponse.restaurants ?? [];

        final List<RestaurantEntity> restaurantsEntity =
            restaurants.map((restaurant) => restaurant.toEntity()).toList();

        return Right(restaurantsEntity);
      }

      return Left(
          ServerFailure("${response.statusMessage} : ${response.statusCode}"));
    } catch (e) {
      return Left(ServerFailure("Unexpected error: ${e.toString()}"));
    }
  }
}
