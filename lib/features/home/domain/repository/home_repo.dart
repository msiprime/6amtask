import 'package:fpdart/fpdart.dart';
import 'package:stackfood/core/global/exception/failures.dart';
import 'package:stackfood/features/home/domain/entity/banner_entity.dart';
import 'package:stackfood/features/home/domain/entity/category_entity.dart';
import 'package:stackfood/features/home/domain/entity/popular_product_entity.dart';

abstract interface class HomeRepository {
  Future<Either<Failure, List<BannerEntity>>> getHomeBanners();

  Future<Either<Failure, List<CategoryEntity>>> getHomeCategories();

  Future<Either<Failure, List<PopularFoodEntity>>> getHomePopularProducts();
}
