import 'package:dio/dio.dart';
import 'package:stackfood/core/global/constants/api_endpoints.dart';
import 'package:stackfood/core/global/network/dio_client.dart';

import 'home_datasource.dart';

class HomeDataSourceImpl implements HomeDataSource {
  final DioClient _dioClient;

  HomeDataSourceImpl({
    required DioClient dioClient,
  }) : _dioClient = dioClient;

  @override
  Future<Response> getHomeBanners() async {
    final response = await _dioClient.get(
      ApiEndpoints.homeBanners,
    );

    return response;
  }

  @override
  Future<Response> getHomeCategories() async {
    final response = await _dioClient.get(
      ApiEndpoints.homeCategories,
    );

    return response;
  }

  @override
  Future<Response> getHomePopularProducts({
    int? offset = 1,
    int? limit = 10,
  }) async {
    final response = await _dioClient.get(
      ApiEndpoints.homePopularProducts,
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
      ApiEndpoints.homeFoodCampaigns,
    );

    return response;
  }

  @override
  Future<Response> getHomeRestaurants({
    required int offset,
    required int limit,
  }) async {
    final response = await _dioClient.get(
      ApiEndpoints.homeRestaurants,
      queryParameters: {
        'offset': offset,
        'limit': limit,
      },
    );

    return response;
  }
}
