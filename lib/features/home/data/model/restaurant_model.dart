import 'package:stackfood/core/global/logger/logger.dart';
import 'package:stackfood/features/home/domain/entity/restaurant_entity.dart';

class RestaurantModel {
  int? id;
  String? name;
  String? phone;
  String? email;
  String? logo;
  String? latitude;
  String? longitude;
  String? address;
  int? minimumOrder;
  bool? scheduleOrder;
  int? status;
  int? vendorId;
  String? createdAt;
  String? updatedAt;
  bool? freeDelivery;
  String? coverPhoto;
  bool? delivery;
  bool? takeAway;
  bool? foodSection;
  int? tax;
  int? zoneId;
  bool? reviewsSection;
  bool? active;
  String? offDay;
  int? selfDeliverySystem;
  bool? posSystem;
  int? minimumShippingCharge;
  String? deliveryTime;
  int? veg;
  int? nonVeg;
  int? orderCount;
  int? totalOrder;
  String? restaurantModel;
  String? slug;
  bool? orderSubscriptionActive;
  bool? cutlery;
  String? metaTitle;
  String? metaDescription;
  String? metaImage;
  int? announcement;
  String? announcementMessage;
  String? additionalDocuments;
  int? open;
  double? distance;
  int? foodsCount;
  int? reviewsCommentsCount;
  List<Foods>? foods;
  List<Coupons>? coupons;
  String? deliveryFee;
  int? restaurantStatus;
  List<Cuisine>? cuisine;
  double? avgRating;
  int? ratingCount;
  int? positiveRating;
  int? customerOrderDate;
  bool? customerDateOrderSratus;
  bool? instantOrder;
  bool? halalTagStatus;
  String? currentOpeningTime;
  bool? isExtraPackagingActive;
  bool? extraPackagingStatus;
  int? extraPackagingAmount;
  bool? isDineInActive;
  int? scheduleAdvanceDineInBookingDuration;
  String? scheduleAdvanceDineInBookingDurationTimeFormat;
  List<String>? characteristics;
  bool? gstStatus;
  String? gstCode;
  bool? freeDeliveryDistanceStatus;
  String? freeDeliveryDistanceValue;
  String? logoFullUrl;
  String? coverPhotoFullUrl;
  String? metaImageFullUrl;
  List<Translations>? translations;
  List<Schedules>? schedules;
  List<Storage>? storage;

  RestaurantModel({
    this.id,
    this.name,
    this.phone,
    this.email,
    this.logo,
    this.latitude,
    this.longitude,
    this.address,
    this.minimumOrder,
    this.scheduleOrder,
    this.status,
    this.vendorId,
    this.createdAt,
    this.updatedAt,
    this.freeDelivery,
    this.coverPhoto,
    this.delivery,
    this.takeAway,
    this.foodSection,
    this.tax,
    this.zoneId,
    this.reviewsSection,
    this.active,
    this.offDay,
    this.selfDeliverySystem,
    this.posSystem,
    this.minimumShippingCharge,
    this.deliveryTime,
    this.veg,
    this.nonVeg,
    this.orderCount,
    this.totalOrder,
    this.restaurantModel,
    this.slug,
    this.orderSubscriptionActive,
    this.cutlery,
    this.metaTitle,
    this.metaDescription,
    this.metaImage,
    this.announcement,
    this.announcementMessage,
    this.additionalDocuments,
    this.open,
    this.distance,
    this.foodsCount,
    this.reviewsCommentsCount,
    this.foods,
    this.coupons,
    this.deliveryFee,
    this.restaurantStatus,
    this.cuisine,
    this.avgRating,
    this.ratingCount,
    this.positiveRating,
    this.customerOrderDate,
    this.customerDateOrderSratus,
    this.instantOrder,
    this.halalTagStatus,
    this.currentOpeningTime,
    this.isExtraPackagingActive,
    this.extraPackagingStatus,
    this.extraPackagingAmount,
    this.isDineInActive,
    this.scheduleAdvanceDineInBookingDuration,
    this.scheduleAdvanceDineInBookingDurationTimeFormat,
    this.characteristics,
    this.gstStatus,
    this.gstCode,
    this.freeDeliveryDistanceStatus,
    this.freeDeliveryDistanceValue,
    this.logoFullUrl,
    this.coverPhotoFullUrl,
    this.metaImageFullUrl,
    this.translations,
    this.schedules,
    this.storage,
  });

  RestaurantModel.fromJson(Map<String, dynamic> json) {
    try {
      id = json['id'];
      name = json['name'];
      phone = json['phone'];
      email = json['email'];
      logo = json['logo'];
      distance = (json['distance'] ?? 0).toDouble();
      avgRating = (json['avg_rating'] ?? 0).toDouble();

      latitude = json['latitude'];
      longitude = json['longitude'];
      address = json['address'];
      minimumOrder = json['minimum_order'];
      scheduleOrder = json['schedule_order'];
      status = json['status'];
      vendorId = json['vendor_id'];
      createdAt = json['created_at'];
      updatedAt = json['updated_at'];
      freeDelivery = json['free_delivery'];
      coverPhoto = json['cover_photo'];
      delivery = json['delivery'];
      takeAway = json['take_away'];
      foodSection = json['food_section'];
      tax = json['tax'];
      zoneId = json['zone_id'];
      reviewsSection = json['reviews_section'];
      active = json['active'];
      offDay = json['off_day'];
      selfDeliverySystem = json['self_delivery_system'];
      posSystem = json['pos_system'];
      minimumShippingCharge = json['minimum_shipping_charge'];
      deliveryTime = json['delivery_time'];
      veg = json['veg'];
      nonVeg = json['non_veg'];
      orderCount = json['order_count'];
      totalOrder = json['total_order'];
      restaurantModel = json['restaurant_model'];
      slug = json['slug'];
      orderSubscriptionActive = json['order_subscription_active'];
      cutlery = json['cutlery'];
      metaTitle = json['meta_title'];
      metaDescription = json['meta_description'];
      metaImage = json['meta_image'];
      announcement = json['announcement'];
      announcementMessage = json['announcement_message'];
      additionalDocuments = json['additional_documents'];
      open = json['open'];
      foodsCount = json['foods_count'];
      reviewsCommentsCount = json['reviews_comments_count'];

      if (json['foods'] != null) {
        foods = <Foods>[];
        json['foods'].forEach((v) {
          foods!.add(Foods.fromJson(v));
        });
      }
      if (json['coupons'] != null) {
        coupons = <Coupons>[];
        json['coupons'].forEach((v) {
          coupons!.add(Coupons.fromJson(v));
        });
      }

      deliveryFee = json['delivery_fee'];
      restaurantStatus = json['restaurant_status'];

      if (json['cuisine'] != null) {
        cuisine = <Cuisine>[];
        json['cuisine'].forEach((v) {
          cuisine!.add(Cuisine.fromJson(v));
        });
      }

      ratingCount = json['rating_count'];
      positiveRating = json['positive_rating'];
      customerOrderDate = json['customer_order_date'];
      customerDateOrderSratus = json['customer_date_order_sratus'];
      instantOrder = json['instant_order'];
      halalTagStatus = json['halal_tag_status'];
      currentOpeningTime = json['current_opening_time'];
      isExtraPackagingActive = json['is_extra_packaging_active'];
      extraPackagingStatus = json['extra_packaging_status'];
      extraPackagingAmount = json['extra_packaging_amount'];
      isDineInActive = json['is_dine_in_active'];
      scheduleAdvanceDineInBookingDuration =
          json['schedule_advance_dine_in_booking_duration'];
      scheduleAdvanceDineInBookingDurationTimeFormat =
          json['schedule_advance_dine_in_booking_duration_time_format'];
      characteristics = json['characteristics']?.cast<String>();
      gstStatus = json['gst_status'];
      gstCode = json['gst_code'];
      freeDeliveryDistanceStatus = json['free_delivery_distance_status'];
      freeDeliveryDistanceValue = json['free_delivery_distance_value'];
      logoFullUrl = json['logo_full_url'];
      coverPhotoFullUrl = json['cover_photo_full_url'];
      metaImageFullUrl = json['meta_image_full_url'];

      if (json['translations'] != null) {
        translations = <Translations>[];
        json['translations'].forEach((v) {
          translations!.add(Translations.fromJson(v));
        });
      }
      if (json['schedules'] != null) {
        schedules = <Schedules>[];
        json['schedules'].forEach((v) {
          schedules!.add(Schedules.fromJson(v));
        });
      }
      if (json['storage'] != null) {
        storage = <Storage>[];
        json['storage'].forEach((v) {
          storage!.add(Storage.fromJson(v));
        });
      }
    } catch (e) {
      logE(e.toString());
    }
  }
}

class Foods {
  int? id;
  String? image;
  String? name;
  String? imageFullUrl;
  List<Translations>? translations;
  List<Storage>? storage;

  Foods(
      {this.id,
      this.image,
      this.name,
      this.imageFullUrl,
      this.translations,
      this.storage});

  Foods.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    image = json['image'];
    name = json['name'];
    imageFullUrl = json['image_full_url'];
    if (json['translations'] != null) {
      translations = <Translations>[];
      json['translations'].forEach((v) {
        translations!.add(Translations.fromJson(v));
      });
    }
    if (json['storage'] != null) {
      storage = <Storage>[];
      json['storage'].forEach((v) {
        storage!.add(Storage.fromJson(v));
      });
    }
  }
}

class Translations {
  int? id;
  String? translationableType;
  int? translationableId;
  String? locale;
  String? key;
  String? value;

  Translations({
    this.id,
    this.translationableType,
    this.translationableId,
    this.locale,
    this.key,
    this.value,
  });

  Translations.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    translationableType = json['translationable_type'];
    translationableId = json['translationable_id'];
    locale = json['locale'];
    key = json['key'];
    value = json['value'];
  }
}

class Storage {
  int? id;
  String? dataType;
  String? dataId;
  String? key;
  String? value;
  String? createdAt;
  String? updatedAt;

  Storage({
    this.id,
    this.dataType,
    this.dataId,
    this.key,
    this.value,
    this.createdAt,
    this.updatedAt,
  });

  Storage.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    dataType = json['data_type'];
    dataId = json['data_id'];
    key = json['key'];
    value = json['value'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }
}

class Coupons {
  int? id;
  String? title;
  String? code;
  String? startDate;
  String? expireDate;
  int? minPurchase;
  int? maxDiscount;
  int? discount;
  String? discountType;
  String? couponType;
  int? limit;
  int? status;
  String? createdAt;
  String? updatedAt;
  String? data;
  int? totalUses;
  String? createdBy;
  String? customerId;
  int? restaurantId;
  List<Translations>? translations;

  Coupons(
      {this.id,
      this.title,
      this.code,
      this.startDate,
      this.expireDate,
      this.minPurchase,
      this.maxDiscount,
      this.discount,
      this.discountType,
      this.couponType,
      this.limit,
      this.status,
      this.createdAt,
      this.updatedAt,
      this.data,
      this.totalUses,
      this.createdBy,
      this.customerId,
      this.restaurantId,
      this.translations});

  Coupons.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    code = json['code'];
    startDate = json['start_date'];
    expireDate = json['expire_date'];
    minPurchase = json['min_purchase'];
    maxDiscount = json['max_discount'];
    discount = json['discount'];
    discountType = json['discount_type'];
    couponType = json['coupon_type'];
    limit = json['limit'];
    status = json['status'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    data = json['data'];
    totalUses = json['total_uses'];
    createdBy = json['created_by'];
    customerId = json['customer_id'];
    restaurantId = json['restaurant_id'];
    if (json['translations'] != null) {
      translations = <Translations>[];
      json['translations'].forEach((v) {
        translations!.add(Translations.fromJson(v));
      });
    }
  }
}

class Cuisine {
  int? id;
  String? name;
  String? image;
  int? status;
  String? slug;
  String? createdAt;
  String? updatedAt;
  String? imageFullUrl;
  Pivot? pivot;
  List<Translations>? translations;
  List<Storage>? storage;

  Cuisine({
    this.id,
    this.name,
    this.image,
    this.status,
    this.slug,
    this.createdAt,
    this.updatedAt,
    this.imageFullUrl,
    this.pivot,
    this.translations,
    this.storage,
  });

  Cuisine.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    image = json['image'];
    status = json['status'];
    slug = json['slug'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    imageFullUrl = json['image_full_url'];
    pivot = json['pivot'] != null ? Pivot.fromJson(json['pivot']) : null;
    if (json['translations'] != null) {
      translations = <Translations>[];
      json['translations'].forEach((v) {
        translations!.add(Translations.fromJson(v));
      });
    }
    if (json['storage'] != null) {
      storage = <Storage>[];
      json['storage'].forEach((v) {
        storage!.add(Storage.fromJson(v));
      });
    }
  }
}

class Pivot {
  int? restaurantId;
  int? cuisineId;

  Pivot({this.restaurantId, this.cuisineId});

  Pivot.fromJson(Map<String, dynamic> json) {
    restaurantId = json['restaurant_id'];
    cuisineId = json['cuisine_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['restaurant_id'] = restaurantId;
    data['cuisine_id'] = cuisineId;
    return data;
  }
}

class Schedules {
  int? id;
  int? restaurantId;
  int? day;
  String? openingTime;
  String? closingTime;

  Schedules({
    this.id,
    this.restaurantId,
    this.day,
    this.openingTime,
    this.closingTime,
  });

  Schedules.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    restaurantId = json['restaurant_id'];
    day = json['day'];
    openingTime = json['opening_time'];
    closingTime = json['closing_time'];
  }
}

extension RestaurantModelExtension on RestaurantModel {
  RestaurantEntity toEntity() {
    return RestaurantEntity(
      id: id ?? -1,
      name: name ?? '',
      phone: phone ?? '',
      email: email ?? '',
      latitude: latitude ?? '',
      longitude: longitude ?? '',
      address: address ?? '',
      minimumOrder: minimumOrder ?? -1,
      scheduleOrder: scheduleOrder ?? false,
      status: status ?? -1,
      vendorId: vendorId ?? -1,
      freeDelivery: freeDelivery ?? false,
      coverPhoto: coverPhoto ?? '',
      delivery: delivery ?? false,
      takeAway: takeAway ?? false,
      foodSection: foodSection ?? false,
      tax: tax ?? -1,
      zoneId: zoneId ?? -1,
      reviewsSection: reviewsSection ?? false,
      active: active ?? false,
      offDay: offDay ?? '',
      selfDeliverySystem: selfDeliverySystem ?? -1,
      posSystem: posSystem ?? false,
      minimumShippingCharge: minimumShippingCharge ?? -1,
      deliveryTime: deliveryTime ?? '',
      veg: veg ?? -1,
      nonVeg: nonVeg ?? -1,
      orderCount: orderCount ?? -1,
      totalOrder: totalOrder ?? -1,
      restaurantModel: restaurantModel ?? '',
      slug: slug ?? '',
      orderSubscriptionActive: orderSubscriptionActive ?? false,
      cutlery: cutlery ?? false,
      metaTitle: metaTitle ?? '',
      metaDescription: metaDescription ?? '',
      metaImage: metaImage ?? '',
      announcement: announcement ?? -1,
      announcementMessage: announcementMessage ?? '',
      additionalDocuments: additionalDocuments ?? '',
      open: open ?? -1,
      distance: distance ?? -1,
      foodsCount: foodsCount ?? -1,
      reviewsCommentsCount: reviewsCommentsCount ?? -1,
      deliveryFee: deliveryFee ?? '',
      restaurantStatus: restaurantStatus ?? -1,
      avgRating: avgRating ?? -1,
      ratingCount: ratingCount ?? -1,
      positiveRating: positiveRating ?? -1,
      customerOrderDate: customerOrderDate ?? -1,
      instantOrder: instantOrder ?? false,
      halalTagStatus: halalTagStatus ?? false,
      currentOpeningTime: currentOpeningTime ?? '',
      isExtraPackagingActive: isExtraPackagingActive ?? false,
      extraPackagingStatus: extraPackagingStatus ?? false,
      extraPackagingAmount: extraPackagingAmount ?? -1,
      isDineInActive: isDineInActive ?? false,
      scheduleAdvanceDineInBookingDuration:
          scheduleAdvanceDineInBookingDuration ?? -1,
      scheduleAdvanceDineInBookingDurationTimeFormat:
          scheduleAdvanceDineInBookingDurationTimeFormat ?? '',
      characteristics: characteristics ?? <String>[],
      coverPhotoFullUrl: coverPhotoFullUrl ?? '',
      logoFullUrl: logoFullUrl ?? '',
      metaImageFullUrl: metaImageFullUrl ?? '',
      freeDeliveryDistanceStatus: freeDeliveryDistanceStatus ?? false,
      freeDeliveryDistanceValue: freeDeliveryDistanceValue ?? '',
      gstCode: gstCode ?? '',
      gstStatus: gstStatus ?? false,
      customerDateOrderStatus: customerDateOrderSratus ?? false,
    );
  }
}
