import 'package:stackfood/features/home/domain/entity/category_entity.dart';

class CategoryModel {
  int? id;
  String? name;
  String? image;
  int? parentId;
  int? position;
  int? status;
  String? createdAt;
  String? updatedAt;
  int? priority;
  String? slug;
  int? productsCount;
  int? childesCount;
  int? orderCount;
  String? imageFullUrl;

  CategoryModel({
    this.id,
    this.name,
    this.image,
    this.parentId,
    this.position,
    this.status,
    this.createdAt,
    this.updatedAt,
    this.priority,
    this.slug,
    this.productsCount,
    this.childesCount,
    this.orderCount,
    this.imageFullUrl,
  });

  CategoryModel.fromJson(Map<String, dynamic> json) {
    id = json['id'] as int?;
    name = json['name'] as String?;
    status = json['status'] as int?;
    priority = json['priority'] as int?;
    slug = json['slug'] as String?;
    imageFullUrl = json['image_full_url'] as String?;
  }
}

extension BannerModelX on CategoryModel {
  CategoryEntity toEntity() {
    return CategoryEntity(
      id: id ?? -1,
      name: name ?? '',
      image: image ?? '',
      parentId: parentId ?? -1,
      position: position ?? -1,
      status: status ?? -1,
      createdAt: createdAt ?? '',
      updatedAt: updatedAt ?? '',
      priority: priority ?? -1,
      slug: slug ?? '',
      productsCount: productsCount ?? -1,
      childesCount: childesCount ?? -1,
      orderCount: orderCount ?? -1,
      imageFullUrl: imageFullUrl ?? '',
    );
  }
}
