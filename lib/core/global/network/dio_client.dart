import 'package:dio/dio.dart';
import 'package:stackfood/core/global/logger/logger.dart';

class DioClient {
  final Dio _dio;

  DioClient(this._dio) {
    _dio.options = BaseOptions(
      baseUrl: 'https://stackfood-admin.6amtech.com',
      connectTimeout: const Duration(milliseconds: 5000),
      receiveTimeout: const Duration(milliseconds: 3000),
      headers: {
        'Content-Type': 'application/json; charset=UTF-8',
        'zoneId': '1',
        'latitude': '23.735129',
        'longitude': '90.425614',
      },
    );
  }

  Future<Response> get(
    String path, {
    Map<String, dynamic>? queryParameters,
  }) async {
    try {
      final url = _dio.options.baseUrl + path;
      logD('Request URL: $url');
      logD('Query Parameters: $queryParameters');

      final response = await _dio.get(
        path,
        queryParameters: queryParameters,
      );
      return response;
    } on DioException catch (dioError) {
      String errorMessage = _handleDioError(dioError);
      logE('DioException: $errorMessage');
      throw Exception('Failed to fetch data: $errorMessage');
    } catch (e) {
      logE('Unexpected error: $e');
      throw Exception('Unexpected error: $e');
    }
  }

  String _handleDioError(DioException error) {
    switch (error.type) {
      case DioExceptionType.connectionTimeout:
        return 'Connection timeout';
      case DioExceptionType.sendTimeout:
        return 'Send timeout';
      case DioExceptionType.receiveTimeout:
        return 'Receive timeout';
      case DioExceptionType.badResponse:
        return 'Server error: ${error.response?.statusCode} ${error.response?.statusMessage}';
      case DioExceptionType.cancel:
        return 'Request cancelled';
      case DioExceptionType.unknown:
        return 'Unexpected error: ${error.message}';
      default:
        return 'Unknown error';
    }
  }
}
