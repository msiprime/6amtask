import 'package:stackfood/features/home/domain/entity/popular_product_entity.dart';

class ProductModel {
  int? id;
  String? name;
  String? description;
  String? image;
  int? categoryId;

  String? price;
  String? avgRating;
  String? restaurantName;
  int? reviewsCount;
  int? restaurantId;
  String? imageFullUrl;

  // int? ratingCount;
  // int? recommended;
  // String? slug;
  // int? isHalal;
  // int? itemStock;
  // int? sellCount;
  // String? stockType;
  // int? tempAvailable;
  // int? open;
  // String? createdAt;
  // String? updatedAt;
  // int? orderCount;
  // List<CategoryIds>? categoryIds;
  // List<Variations>? variations;
  // List<AddOns>? addOns;
  // String? attributes;
  // String? choiceOptions;
  // int? tax;
  // String? taxType;
  // int? discount;
  // String? discountType;
  // String? availableTimeStarts;
  // String? availableTimeEnds;
  // int? veg;
  // int? status;
  // List<Tags>? tags;
  // int? restaurantStatus;
  // int? restaurantDiscount;
  // String? restaurantOpeningTime;
  // String? restaurantClosingTime;
  // bool? scheduleOrder;
  // int? minDeliveryTime;
  // int? maxDeliveryTime;
  // int? freeDelivery;
  // int? halalTagStatus;
  // List<String>? nutritionsName;
  // List<String>? allergiesName;
  // List<Cuisines>? cuisines;

  // List<Translations>? translations;
  // List<Nutrition>? nutritions;
  // List<Allergies>? allergies;
  // List<Storage>? storage;

  ProductModel({
    this.id,
    this.name,
    this.description,
    this.image,
    this.categoryId,
    this.price,
    this.avgRating,
    this.restaurantId,
    this.reviewsCount,
    this.restaurantName,
    this.imageFullUrl,
  });

  ProductModel.fromJson(Map<String, dynamic> json) {
    id = json['id'] as int?;
    name = json['name'] as String?;
    description = json['description'] as String?;
    image = json['image'] as String?;
    categoryId = json['category_id'] as int?;
    avgRating = json['avg_rating'].toStringAsFixed(1);
    price = json['price'].toString();
    restaurantId = json['restaurant_id'] as int?;
    reviewsCount = json['reviews_count'] as int?;
    restaurantName = json['restaurant_name'] as String?;
    imageFullUrl = json['image_full_url'] as String?;

    // if (json['category_ids'] != null) {
    //   categoryIds = <CategoryIds>[];
    //   json['category_ids'].forEach((v) {
    //     categoryIds!.add(CategoryIds.fromJson(v));
    //   });
    // }
    // if (json['variations'] != null) {
    //   variations = <Variations>[];
    //   json['variations'].forEach((v) {
    //     variations!.add(Variations.fromJson(v));
    //   });
    // }
    // if (json['add_ons'] != null) {
    //   addOns = <AddOns>[];
    //   json['add_ons'].forEach((v) {
    //     addOns!.add(AddOns.fromJson(v));
    //   });
    // }
    // attributes = json['attributes'];
    // choiceOptions = json['choice_options'];
    // tax = json['tax'];
    // taxType = json['tax_type'];
    // discount = json['discount'];
    // discountType = json['discount_type'];
    // availableTimeStarts = json['available_time_starts'];
    // availableTimeEnds = json['available_time_ends'];
    // veg = json['veg'];
    // status = json['status'];
    // createdAt = json['created_at'];
    // updatedAt = json['updated_at'];
    // orderCount = json['order_count'];

    // ratingCount = json['rating_count'];
    // recommended = json['recommended'];
    // slug = json['slug'];
    // isHalal = json['is_halal'];
    // itemStock = json['item_stock'];
    // sellCount = json['sell_count'];
    // stockType = json['stock_type'];
    // tempAvailable = json['temp_available'];
    // open = json['open'];
    // if (json['tags'] != null) {
    //   tags = <Tags>[];
    //   json['tags'].forEach((v) {
    //     tags!.add(Tags.fromJson(v));
    //   });
    // }
    // restaurantStatus = json['restaurant_status'];
    // restaurantDiscount = json['restaurant_discount'];
    // restaurantOpeningTime = json['restaurant_opening_time'];
    // restaurantClosingTime = json['restaurant_closing_time'];
    // scheduleOrder = json['schedule_order'];
    // minDeliveryTime = json['min_delivery_time'];
    // maxDeliveryTime = json['max_delivery_time'];
    // freeDelivery = json['free_delivery'];
    // halalTagStatus = json['halal_tag_status'];
    // nutritionsName = json['nutritions_name'].cast<String>();
    // allergiesName = json['allergies_name'].cast<String>();
    // if (json['cuisines'] != null) {
    //   cuisines = <Cuisines>[];
    //   json['cuisines'].forEach((v) {
    //     cuisines!.add(Cuisines.fromJson(v));
    //   });
    // }
    // if (json['translations'] != null) {
    //   translations = <Translations>[];
    //   json['translations'].forEach((v) {
    //     translations!.add(Translations.fromJson(v));
    //   });
    // }
    // if (json['nutritions'] != null) {
    //   nutritions = <Nutrition>[];
    //   json['nutritions'].forEach((v) {
    //     nutritions!.add(Nutrition.fromJson(v));
    //   });
    // }
    // if (json['allergies'] != null) {
    //   allergies = <Allergies>[];
    //   json['allergies'].forEach((v) {
    //     allergies!.add(Allergies.fromJson(v));
    //   });
    // }
    // if (json['storage'] != null) {
    //   storage = <Storage>[];
    //   json['storage'].forEach((v) {
    //     storage!.add(Storage.fromJson(v));
    //   });
    // }
  }
}

class CategoryIds {
  String? id;
  int? position;

  CategoryIds({this.id, this.position});

  CategoryIds.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    position = json['position'];
  }
}

class Variations {
  int? variationId;
  String? name;
  String? type;
  String? min;
  String? max;
  String? required;
  List<Values>? values;

  Variations({
    this.variationId,
    this.name,
    this.type,
    this.min,
    this.max,
    this.required,
    this.values,
  });

  Variations.fromJson(Map<String, dynamic> json) {
    variationId = json['variation_id'];
    name = json['name'];
    type = json['type'];
    min = json['min'];
    max = json['max'];
    required = json['required'];
    if (json['values'] != null) {
      values = <Values>[];
      json['values'].forEach((v) {
        values!.add(Values.fromJson(v));
      });
    }
  }
}

class Values {
  String? label;
  int? optionPrice;
  String? totalStock;
  String? stockType;
  String? sellCount;
  int? optionId;
  int? currentStock;

  Values({
    this.label,
    this.optionPrice,
    this.totalStock,
    this.stockType,
    this.sellCount,
    this.optionId,
    this.currentStock,
  });

  Values.fromJson(Map<String, dynamic> json) {
    label = json['label'];
    optionPrice = json['optionPrice'];
    totalStock = json['total_stock'];
    stockType = json['stock_type'];
    sellCount = json['sell_count'];
    optionId = json['option_id'];
    currentStock = json['current_stock'];
  }
}

class AddOns {
  int? id;
  String? name;
  int? price;
  String? createdAt;
  String? updatedAt;
  int? restaurantId;
  int? status;
  String? stockType;
  int? addonStock;
  int? sellCount;
  List<Translations>? translations;

  AddOns({
    this.id,
    this.name,
    this.price,
    this.createdAt,
    this.updatedAt,
    this.restaurantId,
    this.status,
    this.stockType,
    this.addonStock,
    this.sellCount,
    this.translations,
  });

  AddOns.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    price = json['price'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    restaurantId = json['restaurant_id'];
    status = json['status'];
    stockType = json['stock_type'];
    addonStock = json['addon_stock'];
    sellCount = json['sell_count'];
    if (json['translations'] != null) {
      translations = <Translations>[];
      json['translations'].forEach((v) {
        translations!.add(Translations.fromJson(v));
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

class Tags {
  int? id;
  String? tag;
  String? createdAt;
  String? updatedAt;
  Pivot? pivot;

  Tags({this.id, this.tag, this.createdAt, this.updatedAt, this.pivot});

  Tags.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    tag = json['tag'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    pivot = json['pivot'] != null ? Pivot.fromJson(json['pivot']) : null;
  }
}

class Pivot {
  int? foodId;
  int? tagId;

  Pivot({this.foodId, this.tagId});

  Pivot.fromJson(Map<String, dynamic> json) {
    foodId = json['food_id'];
    tagId = json['tag_id'];
  }
}

class Cuisines {
  int? id;
  String? name;
  String? image;

  Cuisines({this.id, this.name, this.image});

  Cuisines.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    image = json['image'];
  }
}

class Nutrition {
  int? id;
  String? nutrition;
  String? createdAt;
  String? updatedAt;
  Pivot? pivot;

  Nutrition(
      {this.id, this.nutrition, this.createdAt, this.updatedAt, this.pivot});

  Nutrition.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    nutrition = json['nutrition'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    pivot = json['pivot'] != null ? Pivot.fromJson(json['pivot']) : null;
  }
}

class Allergies {
  int? id;
  String? allergy;
  String? createdAt;
  String? updatedAt;
  Pivot? pivot;

  Allergies({
    this.id,
    this.allergy,
    this.createdAt,
    this.updatedAt,
    this.pivot,
  });

  Allergies.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    allergy = json['allergy'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    pivot = json['pivot'] != null ? Pivot.fromJson(json['pivot']) : null;
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

extension ProductModelExtension on ProductModel {
  PopularFoodEntity toEntity() {
    return PopularFoodEntity(
      id: id ?? -1,
      name: name ?? '',
      description: description ?? '',
      image: image ?? '',
      categoryId: categoryId ?? -1,
      price: price ?? '',
      restaurantId: restaurantId ?? -1,
      avgRating: avgRating ?? '',
      restaurantName: restaurantName ?? '',
      imageFullUrl: imageFullUrl ?? '',
    );
  }
}
