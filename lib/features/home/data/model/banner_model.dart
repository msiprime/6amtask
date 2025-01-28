import 'package:stackfood/features/home/domain/entity/banner_entity.dart';

class BannerModel {
  final int? id;
  final String? title;
  final String? type;
  final String? imageUrl;

  BannerModel({
    required this.id,
    required this.title,
    required this.type,
    required this.imageUrl,
  });

  factory BannerModel.fromJson(Map<String, dynamic> json) {
    return BannerModel(
      id: json['id'] as int?,
      title: json['title'] as String?,
      type: json['type'] as String?,
      imageUrl: json['image_full_url'] as String?,
    );
  }
}

extension BannerModelX on BannerModel {
  BannerEntity toEntity() {
    return BannerEntity(
      id: id ?? -99,
      title: title ?? '',
      type: type ?? '',
      imageUrl: imageUrl ?? '',
    );
  }
}

class BannerResponse {
  List<BannerModel>? banners;

  BannerResponse({this.banners});

  BannerResponse.fromJson(Map<String, dynamic> json) {
    if (json['banners'] != null) {
      banners = <BannerModel>[];
      json['banners'].forEach((v) {
        banners!.add(BannerModel.fromJson(v));
      });
    }
  }
}
