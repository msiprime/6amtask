import 'package:stackfood/features/home/domain/entity/campaign_entity.dart';

class CampaignModel {
  int? id;
  String? image;
  String? description;
  int? price;
  int? discount;
  String? address;
  String? discountType;
  int? restaurantId;
  String? name;
  String? availableTimeStarts;
  String? availableTimeEnds;
  String? availableDateStarts;
  String? availableDateEnds;
  int? recommended;
  String? restaurantName;
  int? restaurantStatus;
  int? restaurantDiscount;
  int? ratingCount;
  int? avgRating;
  String? imageFullUrl;

  CampaignModel({
    this.id,
    this.image,
    this.description,
    this.price,
    this.discount,
    this.discountType,
    this.restaurantId,
    this.name,
    this.availableTimeStarts,
    this.availableTimeEnds,
    this.availableDateStarts,
    this.availableDateEnds,
    this.recommended,
    this.address,
    this.restaurantName,
    this.restaurantStatus,
    this.restaurantDiscount,
    this.ratingCount,
    this.avgRating,
    this.imageFullUrl,
  });

  CampaignModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    image = json['image'];
    description = json['description'];
    address = json['address'];
    price = json['price'];
    discount = json['discount'];
    discountType = json['discount_type'];
    restaurantId = json['restaurant_id'];
    name = json['name'];
    availableTimeStarts = json['available_time_starts'];
    availableTimeEnds = json['available_time_ends'];
    availableDateStarts = json['available_date_starts'];
    availableDateEnds = json['available_date_ends'];
    recommended = json['recommended'];
    restaurantName = json['restaurant_name'];
    restaurantStatus = json['restaurant_status'];
    restaurantDiscount = json['restaurant_discount'];
    ratingCount = json['rating_count'];
    avgRating = json['avg_rating'];
    imageFullUrl = json['image_full_url'];
  }
}

extension CampaignModelExtension on CampaignModel {
  CampaignEntity toEntity() {
    return CampaignEntity(
      id: id ?? -1,
      name: name ?? '',
      address: address ?? '',
      averageRating: avgRating?.toDouble() ?? 0.0,
      description: description ?? '',
      price: price?.toDouble() ?? 0.0,
      discount: discount?.toDouble() ?? 0.0,
      discountType: discountType ?? '',
      imageUrl: imageFullUrl ?? '',
      restaurantName: restaurantName ?? '',
    );
  }
}
