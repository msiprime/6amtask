import 'package:stackfood/features/home/data/model/banner_model.dart';

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
