import 'package:dio/dio.dart';
import 'package:stackfood/core/global/network/dio_client.dart';

import 'home_datasource.dart';

class HomeDataSourceImpl implements HomeDataSource {
  final DioClient _dioClient;

  HomeDataSourceImpl({
    required DioClient dioClient,
  }) : _dioClient = dioClient;

  // todo: make endpoint for getHomeBanners
  @override
  Future<Response> getHomeBanners() async {
    final response = await _dioClient.get(
      '/banners',
    );

    return response;
  }

  @override
  Future<Response> getHomeCategories() async {
    final response = await _dioClient.get(
      '/categories',
    );

    return response;
  }

  @override
  Future<Response> getHomePopularProducts({
    int? offset = 1,
    int? limit = 10,
  }) async {
    final response = await _dioClient.get(
      '/products/popular',
      queryParameters: {
        'offset': offset,
        'limit': limit,
      },
    );

    return response;
  }

  @override
  Future<Response> getHomeFoodCampaigns() async {
    final response = await _dioClient.get(
      '/campaigns/item',
    );

    return response;
  }

  @override
  Future<Response> getHomeRestaurants({
    required int offset,
    required int limit,
  }) async {
    final response = await _dioClient.get(
        '/restaurants/get-restaurants/all?offset=1&limit=10',
        queryParameters: {
          'offset': offset,
          'limit': limit,
        });

    return response;
  }
}
