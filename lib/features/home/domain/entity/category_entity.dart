class CategoryEntity {
  int id;
  String name;
  String image;
  int parentId;
  int position;
  int status;
  String createdAt;
  String updatedAt;
  int priority;
  String slug;
  int productsCount;
  int childesCount;
  int orderCount;
  String imageFullUrl;

  CategoryEntity({
    required this.id,
    required this.name,
    required this.image,
    required this.parentId,
    required this.position,
    required this.status,
    required this.createdAt,
    required this.updatedAt,
    required this.priority,
    required this.slug,
    required this.productsCount,
    required this.childesCount,
    required this.orderCount,
    required this.imageFullUrl,
  });
}
