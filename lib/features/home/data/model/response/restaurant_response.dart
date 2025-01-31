import 'package:stackfood/features/home/data/model/restaurant_model.dart';
import 'package:stackfood/features/home/domain/entity/restaurant_response_entity.dart';

class RestaurantResponse {
  String? filterData;
  int? totalSize;
  String? limit;
  String? offset;
  List<RestaurantModel>? restaurants;

  RestaurantResponse({
    this.filterData,
    this.totalSize,
    this.limit,
    this.offset,
    this.restaurants,
  });

  RestaurantResponse.fromJson(Map<String, dynamic> json) {
    filterData = json['filter_data'];
    totalSize = json['total_size'];
    limit = json['limit'];
    offset = json['offset'];
    if (json['restaurants'] != null) {
      restaurants = <RestaurantModel>[];
      json['restaurants'].forEach((v) {
        restaurants!.add(RestaurantModel.fromJson(v));
      });
    }
  }
}

extension RestaurantResponseExtension on RestaurantResponse {
  RestaurantResponseEntity toEntity() {
    return RestaurantResponseEntity(
      filterData: filterData ?? "",
      totalSize: totalSize ?? 0,
      limit: limit ?? "",
      offset: offset ?? "",
      restaurants: restaurants?.map((e) => e.toEntity()).toList() ?? [],
    );
  }
}
