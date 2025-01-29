import 'package:stackfood/features/home/data/model/product_model.dart';

class PopularItemResponse {
  int? totalSize;
  List<ProductModel>? products;

  PopularItemResponse({
    this.totalSize,
    this.products,
  });

  PopularItemResponse.fromJson(Map<String, dynamic> json) {
    totalSize = json['total_size'];

    if (json['products'] != null) {
      products = <ProductModel>[];
      json['products'].forEach((v) {
        products!.add(ProductModel.fromJson(v));
      });
    }
  }
}
