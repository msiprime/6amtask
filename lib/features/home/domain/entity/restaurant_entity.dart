class RestaurantEntity {
  final int id;
  final String name;
  final String phone;
  final String email;
  final String latitude;
  final String longitude;
  final String address;
  final int minimumOrder;
  final bool scheduleOrder;
  final int status;
  final int vendorId;
  final bool freeDelivery;
  final String coverPhoto;
  final bool delivery;
  final bool takeAway;
  final bool foodSection;
  final int tax;
  final int zoneId;
  final bool reviewsSection;
  final bool active;
  final String offDay;
  final int selfDeliverySystem;
  final bool posSystem;
  final int minimumShippingCharge;
  final String deliveryTime;
  final int veg;
  final int nonVeg;
  final int orderCount;
  final int totalOrder;
  final String restaurantModel;
  final String slug;
  final bool orderSubscriptionActive;
  final bool cutlery;
  final String metaTitle;
  final String metaDescription;
  final String metaImage;
  final int announcement;
  final String announcementMessage;
  final String additionalDocuments;
  final int open;
  final double distance;
  final int foodsCount;
  final int reviewsCommentsCount;
  final String deliveryFee;
  final int restaurantStatus;
  final double avgRating;
  final int ratingCount;
  final int positiveRating;
  final int customerOrderDate;
  final bool customerDateOrderStatus;
  final bool instantOrder;
  final bool halalTagStatus;
  final String currentOpeningTime;
  final bool isExtraPackagingActive;
  final bool extraPackagingStatus;
  final int extraPackagingAmount;
  final bool isDineInActive;
  final int scheduleAdvanceDineInBookingDuration;
  final String scheduleAdvanceDineInBookingDurationTimeFormat;
  final List<String> characteristics;
  final bool gstStatus;
  final String gstCode;
  final bool freeDeliveryDistanceStatus;
  final String freeDeliveryDistanceValue;
  final String logoFullUrl;
  final String coverPhotoFullUrl;
  final String metaImageFullUrl;

  const RestaurantEntity({
    required this.id,
    required this.name,
    required this.phone,
    required this.email,
    required this.latitude,
    required this.longitude,
    required this.address,
    required this.minimumOrder,
    required this.scheduleOrder,
    required this.status,
    required this.vendorId,
    required this.freeDelivery,
    required this.coverPhoto,
    required this.delivery,
    required this.takeAway,
    required this.foodSection,
    required this.tax,
    required this.zoneId,
    required this.reviewsSection,
    required this.active,
    required this.offDay,
    required this.selfDeliverySystem,
    required this.posSystem,
    required this.minimumShippingCharge,
    required this.deliveryTime,
    required this.veg,
    required this.nonVeg,
    required this.orderCount,
    required this.totalOrder,
    required this.restaurantModel,
    required this.slug,
    required this.orderSubscriptionActive,
    required this.cutlery,
    required this.metaTitle,
    required this.metaDescription,
    required this.metaImage,
    required this.announcement,
    required this.announcementMessage,
    required this.additionalDocuments,
    required this.open,
    required this.distance,
    required this.foodsCount,
    required this.reviewsCommentsCount,
    required this.deliveryFee,
    required this.restaurantStatus,
    required this.avgRating,
    required this.ratingCount,
    required this.positiveRating,
    required this.customerOrderDate,
    required this.customerDateOrderStatus,
    required this.instantOrder,
    required this.halalTagStatus,
    required this.currentOpeningTime,
    required this.isExtraPackagingActive,
    required this.extraPackagingStatus,
    required this.extraPackagingAmount,
    required this.isDineInActive,
    required this.scheduleAdvanceDineInBookingDuration,
    required this.scheduleAdvanceDineInBookingDurationTimeFormat,
    required this.characteristics,
    required this.gstStatus,
    required this.gstCode,
    required this.freeDeliveryDistanceStatus,
    required this.freeDeliveryDistanceValue,
    required this.logoFullUrl,
    required this.coverPhotoFullUrl,
    required this.metaImageFullUrl,
  });
}
