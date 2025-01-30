import 'package:dio/dio.dart';

abstract interface class HomeDataSource {
  Future<Response> getHomeBanners();

  Future<Response> getHomeCategories();

  Future<Response> getHomePopularProducts();

  Future<Response> getHomeFoodCampaigns();

  Future<Response> getHomeRestaurants({
    required int offset,
    required int limit,
  });
}
