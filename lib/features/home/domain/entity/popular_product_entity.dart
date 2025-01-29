class PopularFoodEntity {
  int id;
  String name;
  String description;
  String image;
  int categoryId;
  String price;
  int restaurantId;
  String avgRating;
  String restaurantName;
  String imageFullUrl;

  // String attributes;
  // String choiceOptions;
  // String taxType;
  // int discount;
  // String discountType;
  // String availableTimeStarts;
  // String availableTimeEnds;
  // int status;

  PopularFoodEntity({
    required this.id,
    required this.name,
    required this.description,
    required this.image,
    required this.categoryId,
    required this.price,
    required this.restaurantId,
    required this.avgRating,
    required this.restaurantName,
    required this.imageFullUrl,

    // required this.attributes,
    // required this.choiceOptions,
    // required this.taxType,
    // required this.discount,
    // required this.discountType,
    // required this.availableTimeStarts,
    // required this.availableTimeEnds,
    // required this.status,
  });
}
