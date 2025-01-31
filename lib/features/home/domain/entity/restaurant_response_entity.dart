import 'package:stackfood/features/home/domain/entity/restaurant_entity.dart';

class RestaurantResponseEntity {
  String filterData;
  int totalSize;
  String limit;
  String offset;
  List<RestaurantEntity> restaurants;

  RestaurantResponseEntity({
    required this.filterData,
    required this.totalSize,
    required this.limit,
    required this.offset,
    required this.restaurants,
  });
}
